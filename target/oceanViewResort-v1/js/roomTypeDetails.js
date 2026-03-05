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
            }
        })
        .catch(err => console.error(err));