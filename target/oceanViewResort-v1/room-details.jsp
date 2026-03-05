<%@include file="includes/header.jsp" %>

<%
    // Mocking the data that would usually come from a Database based on a URL ID
    String roomName = "Deluxe Ocean Front";
    double price = 150.00;
    String description = "Experience the ultimate coastal luxury. Our Deluxe Ocean Front rooms offer panoramic views of the Galle coastline, featuring a private balcony, king-sized bed, and premium amenities.";
%>

<div class="container py-5 mt-5">
    <div class="row g-5">
        <div class="col-lg-7">
            <div id="roomCarousel" class="carousel slide shadow-sm rounded-4 overflow-hidden mb-4" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=800&q=80" class="d-block w-100" alt="Room View">
                    </div>
                </div>
            </div>
            
            <h2 class="fw-bold" id="roomName"></h2>
            <div class="d-flex align-items-center gap-3 mb-3 text-primary">
                <span><i class="fa-solid fa-arrows-maximize me-1"></i> 45 m²</span>
                <span><i class="fa-solid fa-bed me-1"></i> King Bed</span>
                <span><i class="fa-solid fa-wifi me-1"></i> Free WiFi</span>
            </div>
            <p class="text-muted fs-5" id="roomDesc"></p>
            
            <hr class="my-4">
            <h5 class="fw-bold mb-3">Room Amenities</h5>
            <div class="row g-3">
                <div class="col-6 col-md-4 small"><i class="fa-solid fa-check text-success me-2"></i>Mini Bar</div>
                <div class="col-6 col-md-4 small"><i class="fa-solid fa-check text-success me-2"></i>Air Conditioning</div>
                <div class="col-6 col-md-4 small"><i class="fa-solid fa-check text-success me-2"></i>Safe Box</div>
                <div class="col-6 col-md-4 small"><i class="fa-solid fa-check text-success me-2"></i>Rain Shower</div>
                <div class="col-6 col-md-4 small"><i class="fa-solid fa-check text-success me-2"></i>Smart TV</div>
            </div>
        </div>

        <div class="col-lg-5">
            <div class="card border-0 shadow-lg rounded-4 p-4 sticky-top" style="top: 100px;">
                <h4 class="fw-bold mb-4">Check Availability</h4>
                
                <div class="row g-3 mb-4">
                    <div class="col-6">
                        <label class="form-label small fw-bold">Check-In</label>
                        <input type="date" id="checkIn" class="form-control" required>
                    </div>
                    <div class="col-6">
                        <label class="form-label small fw-bold">Check-Out</label>
                        <input type="date" id="checkOut" class="form-control" required>
                    </div>
                    <div class="col-12">
                        <button class="btn btn-primary w-100 py-3 fw-bold rounded-pill" onclick="checkRooms()">
                            <i class="fa-solid fa-magnifying-glass me-2"></i>Search Available Units
                        </button>
                    </div>
                </div>

                <div id="availabilityResults" class="d-none animate__animated animate__fadeIn">
                    <h6 class="fw-bold text-muted border-top pt-4 mb-3">Available Room Numbers:</h6>
                    <div class="row g-2 mb-4">
                        <div class="col-4">
                            <input type="radio" class="btn-check" name="roomNum" id="r101" value="101" autocomplete="off">
                            <label class="btn btn-outline-dark w-100 py-2" for="r101">Room 101</label>
                        </div>
                        <div class="col-4">
                            <input type="radio" class="btn-check" name="roomNum" id="r105" value="105" autocomplete="off">
                            <label class="btn btn-outline-dark w-100 py-2" for="r105">Room 105</label>
                        </div>
                        <div class="col-4">
                            <input type="radio" class="btn-check" name="roomNum" id="r203" value="203" autocomplete="off">
                            <label class="btn btn-outline-dark w-100 py-2" for="r203">Room 203</label>
                        </div>
                    </div>

                    <div class="bg-light p-3 rounded-3 mb-4">
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-muted">Price per night:</span>
                            <span class="fw-bold text-dark" id="roomPrice"></span>
                        </div>
                    </div>

                    <button class="btn btn-success btn-lg w-100 py-3 fw-bold rounded-pill shadow" onclick="goToBooking()">
                        Book Selected Room <i class="fa-solid fa-arrow-right ms-2"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/roomTypeDetails.js"></script>
<script>
    // 1. Set Min Date to Today
    const today = new Date().toISOString().split("T")[0];
    document.getElementById('checkIn').min = today;
    document.getElementById('checkOut').min = today;

    // 2. Simulate Availability Check
    function checkRooms() {
        const cin = document.getElementById('checkIn').value;
        const cout = document.getElementById('checkOut').value;

        if(!cin || !cout) {
            alert("Please select both dates.");
            return;
        }

        if(new Date(cout) <= new Date(cin)) {
            alert("Check-out must be after check-in.");
            return;
        }

        // Show the results (In real app, this would be an AJAX call to the database)
        document.getElementById('availabilityResults').classList.remove('d-none');
    }

    // 3. Redirect to Booking Page with data
    function goToBooking() {
        const selectedRoom = document.querySelector('input[name="roomNum"]:checked');
        const cin = document.getElementById('checkIn').value;
        const cout = document.getElementById('checkOut').value;

        if(!selectedRoom) {
            alert("Please pick a physical room number first.");
            return;
        }

        // Send parameters to the booking form
        window.location.href = `booking-form.jsp?type=<%= roomName %>&num=${selectedRoom.value}&in=${cin}&out=${cout}`;
    }
</script>

<%@include file="includes/footer.jsp" %>