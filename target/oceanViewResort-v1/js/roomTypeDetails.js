const params = new URLSearchParams(window.location.search);
const type = params.get('type');

fetch(`roomType?type=${encodeURIComponent(type)}`)
        .then(res => res.json())
        .then(data => {
            console.log(data)
            if (data.error) {
                alert(data.error);
            } else {
                document.getElementById('roomName').innerText = data.roomType;
                document.getElementById('roomPrice').innerText = "$" + data.pricePerNight;
                document.getElementById('roomDesc').innerText = data.description;
                document.getElementById('roomTypeId').value = data.roomTypeId;
                document.getElementById('pricePerNightValue').value = data.pricePerNight;
            }
        })
        .catch(err => console.error(err));

function checkAvailability() {
    const checkIn = document.getElementById('checkIn').value;
    const checkOut = document.getElementById('checkOut').value;
    const roomTypeId = document.getElementById('roomTypeId').value;

    if(!checkIn || !checkOut) {
        alert("Select both dates");
        return;
    }

    fetch(`booking?roomTypeId=${roomTypeId}&checkIn=${checkIn}&checkOut=${checkOut}`)
        .then(res => {
            if(!res.ok) throw new Error(res.statusText);
            return res.json();
        })
        .then(data => {
            const container = document.getElementById('availableRooms');
            container.innerHTML = "";

            if(data.length === 0) {
                container.innerHTML = "<p>No rooms available for selected dates.</p>";
                return;
            }

            data.forEach(room => {
                const div = document.createElement("div");
                div.classList.add('col-4');
                div.innerHTML = `
                    <input type="radio" class="btn-check" name="selectedRoom" value="${room.roomNumber}" id="r${room.roomId}" autocomplete="off">
                    <label class="btn btn-outline-dark w-100 py-2" for="r${room.roomId}">Room ${room.roomNumber}</label>
                `;
                container.appendChild(div);
            });
            document.getElementById('availabilityResults').classList.remove('d-none');
            if(data.length > 0){
                document.getElementById(`r${data[0].roomId}`).checked = true;
                document.getElementById(`r${data[0].roomId}`).dispatchEvent(new Event('change'));
            }
            updatePrice();
            
        })
        .catch(err => console.error(err));
}

function updatePrice() {
    const checkIn = new Date(document.getElementById('checkIn').value);
    const checkOut = new Date(document.getElementById('checkOut').value);
    const pricePerNight = parseInt(document.getElementById("pricePerNightValue").value);
    if(!checkIn || !checkOut || checkOut <= checkIn) return;

    const diffTime = checkOut - checkIn; // milliseconds
    const nights = diffTime / (1000 * 60 * 60 * 24); // convert to days

    document.getElementById('roomPrice').innerText = `$${pricePerNight.toFixed(2)}`;
    document.getElementById('numNights').innerText = nights;
    document.getElementById('totalPrice').innerText = `$${(pricePerNight * nights).toFixed(2)}`;
}

function goToBooking() {
    const cin = document.getElementById('checkIn').value;
    const cout = document.getElementById('checkOut').value;
    const selectedRoom = document.querySelector('input[name="selectedRoom"]:checked');
    const roomType = document.getElementById('roomName').innerText;

    if (!selectedRoom) {
        alert("Please pick a physical room number first.");
        return;
    }

    // Send parameters to the booking form
    window.location.href = `booking-form.jsp?type=${roomType}&rnum=${selectedRoom.value}&in=${cin}&out=${cout}`;
}