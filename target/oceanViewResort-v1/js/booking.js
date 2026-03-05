const params = new URLSearchParams(window.location.search);
const rnum = params.get('rnum');

fetch(`room?rnum=${encodeURIComponent(rnum)}`)
        .then(res => res.json())
        .then(data => {
            console.log(data)
            if (data.error) {
                alert(data.error);
            } else {
                document.getElementById('roomNumber').innerText = data.roomNumber;
                document.getElementById('pricePerNight').innerText = "$" + data.roomType.pricePerNight;
                document.getElementById('roomType').innerText = data.roomType.roomType;
                document.getElementById('pricePerNightValue').value = data.roomType.pricePerNight;
                updateSummary();
            }
        })
        .catch(err => console.error(err));

function updateSummary() {
        const cin = document.getElementById('inDate').value;
        const cout = document.getElementById('outDate').value;
        const rate = parseFloat(document.getElementById('pricePerNightValue').value);
        
        if (cin && cout) {
            const start = new Date(cin);
            const end = new Date(cout);
            const diff = Math.ceil((end - start) / (1000 * 60 * 60 * 24));

            if (diff > 0) {
                const total = diff * rate;
                document.getElementById('summaryLogic').classList.remove('d-none');
                document.getElementById('promptText').classList.add('d-none');
                document.getElementById('nightsText').innerText = diff + " Night(s)";
                document.getElementById('totalText').innerText = "$" + total.toLocaleString('en-US', {minimumFractionDigits: 2});
                document.getElementById('hiddenTotal').value = total.toFixed(2);
            } else {
                document.getElementById('summaryLogic').classList.add('d-none');
                document.getElementById('promptText').classList.remove('d-none');
            }
        }
    }

// Set Minimum Date as Today
    const today = new Date().toISOString().split("T")[0];
    document.getElementById('inDate').min = today;
    document.getElementById('inDate').addEventListener('change', function () {
        document.getElementById('outDate').min = this.value;
    });

