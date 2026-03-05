<%@include file="includes/header.jsp" %>

<header class="py-5 bg-light border-bottom">
    <div class="container text-center pt-5">
        <h1 class="fw-bold mt-4">Our Accommodations</h1>
        <p class="text-muted">Choose from our curated selection of luxury stays in Galle.</p>
    </div>
</header>

<section class="py-5">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-5 flex-wrap">
            <div class="btn-group shadow-sm" role="group">
                <button type="button" class="btn btn-outline-primary active">All Rooms</button>
                <button type="button" class="btn btn-outline-primary">Standard</button>
                <button type="button" class="btn btn-outline-primary">Deluxe</button>
                <button type="button" class="btn btn-outline-primary">Suites</button>
            </div>
            <p class="text-muted mt-2 mt-md-0">Showing 6 exclusive room types</p>
        </div>

        <div class="row g-4" id="roomContainer">
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden room-card">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=600&q=80" class="card-img-top" alt="Standard Room">
                        <span class="badge bg-success position-absolute top-0 end-0 m-3 p-2">Available</span>
                    </div>
                    <div class="card-body p-4">
                        <h5 class="card-title fw-bold">Standard Garden View</h5>
                        <p class="text-muted small mb-3">Perfect for solo travelers or couples seeking comfort.</p>
                        <div class="d-flex mb-3 text-primary">
                            <i class="fa-solid fa-wifi me-3" title="Free Wifi"></i>
                            <i class="fa-solid fa-snowflake me-3" title="AC"></i>
                            <i class="fa-solid fa-tv me-3" title="Smart TV"></i>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <span class="fs-4 fw-bold text-dark">$80</span>
                                <span class="text-muted small">/ night</span>
                            </div>
                            <a href="login.jsp" class="btn btn-primary btn-sm rounded-pill px-3">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden room-card">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=600&q=80" class="card-img-top" alt="Deluxe Room">
                        <span class="badge bg-primary position-absolute top-0 end-0 m-3 p-2">Best Seller</span>
                    </div>
                    <div class="card-body p-4">
                        <h5 class="card-title fw-bold">Deluxe Ocean Front</h5>
                        <p class="text-muted small mb-3">Wake up to the sound of waves with a private balcony.</p>
                        <div class="d-flex mb-3 text-primary">
                            <i class="fa-solid fa-wifi me-3"></i>
                            <i class="fa-solid fa-snowflake me-3"></i>
                            <i class="fa-solid fa-mug-hot me-3"></i>
                            <i class="fa-solid fa-water me-3"></i>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <span class="fs-4 fw-bold text-dark">$150</span>
                                <span class="text-muted small">/ night</span>
                            </div>
                            <a href="login.jsp" class="btn btn-primary btn-sm rounded-pill px-3">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden room-card">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=600&q=80" class="card-img-top" alt="Suite">
                        <span class="badge bg-warning text-dark position-absolute top-0 end-0 m-3 p-2">Premium</span>
                    </div>
                    <div class="card-body p-4">
                        <h5 class="card-title fw-bold">Presidential Suite</h5>
                        <p class="text-muted small mb-3">The ultimate luxury experience with a private jacuzzi.</p>
                        <div class="d-flex mb-3 text-primary">
                            <i class="fa-solid fa-wifi me-3"></i>
                            <i class="fa-solid fa-martini-glass-citrus me-3"></i>
                            <i class="fa-solid fa-hot-tub-person me-3"></i>
                            <i class="fa-solid fa-utensils me-3"></i>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <span class="fs-4 fw-bold text-dark">$350</span>
                                <span class="text-muted small">/ night</span>
                            </div>
                           <button onclick="handleBooking('Deluxe')" class="btn btn-primary rounded-pill">Book Now</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
    .room-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .room-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 35px rgba(0,0,0,0.1) !important;
    }
    .card-img-top {
        height: 250px;
        object-fit: cover;
    }
</style>

<script src="js/roomTypes.js"></script>

<script>
    function handleBooking(roomType) {
    // Check if a session variable 'user' exists (Logic for JSP)
    // For this example, we'll assume the JSP sets a JS variable
<%
    boolean result =false;
    if(user != null && user instanceof Guest){
        result = true;
    }
%>
    var isLoggedIn = <%= result %>;
    alert(isLoggedIn);
    if (isLoggedIn) {
        window.location.href = "room-details.jsp?type=" + roomType;
    } else {
        window.location.href = "login.jsp?msg=Please login to complete your " + roomType + " reservation.";
    }
}
</script>

<%@include file="includes/footer.jsp" %>