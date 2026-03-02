<%@include file="includes/header.jsp" %>

<header class="hero-section">
    <div class="container text-center">
        <h1 class="display-2 fw-bold mb-3">Your Paradise in Galle</h1>
        <p class="lead mb-5">Experience luxury by the shore. Hundreds of guests trust our sanctuary every month.</p>
        <a href="#booking" class="btn btn-lg btn-light px-5 py-3 fw-bold">Explore Rooms</a>
    </div>
</header>

<section id="booking" class="container position-relative">
    <div class="booking-bar text-dark">
        <form action="ReservationServlet" method="POST" class="row g-3 align-items-end">
            <div class="col-md-3">
                <label class="form-label fw-semibold">Check-In</label>
                <input type="date" class="form-control" name="checkIn">
            </div>
            <div class="col-md-3">
                <label class="form-label fw-semibold">Check-Out</label>
                <input type="date" class="form-control" name="checkOut">
            </div>
            <div class="col-md-3">
                <label class="form-label fw-semibold">Room Type</label>
                <select class="form-select" name="roomType">
                    <option selected disabled>Select Category</option>
                    <option value="Standard">Standard ($80)</option>
                    <option value="Deluxe">Deluxe ($150)</option>
                    <option value="Suite">Presidential Suite ($300)</option>
                </select>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary w-100 py-2">Check Availability</button>
            </div>
        </form>
    </div>
</section>

<section class="py-5 mt-5">
    <div class="container text-center py-5">
        <h2 class="fw-bold mb-5">Why Choose Ocean View?</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="p-4 bg-light rounded-4 h-100 transition-up">
                    <i class="fa-solid fa-shield-halved fa-3x text-primary mb-3"></i>
                    <h4>Secure Booking</h4>
                    <p class="text-muted">Encrypted reservations and unique ID for every guest.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-4 bg-light rounded-4 h-100 transition-up">
                    <i class="fa-solid fa-file-invoice-dollar fa-3x text-primary mb-3"></i>
                    <h4>Transparent Billing</h4>
                    <p class="text-muted">Instant automated bill calculation for your entire stay.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-4 bg-light rounded-4 h-100 transition-up">
                    <i class="fa-solid fa-headset fa-3x text-primary mb-3"></i>
                    <h4>24/7 Support</h4>
                    <p class="text-muted">Our dedicated staff is always here to assist with your needs.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<footer class="bg-dark text-white py-4 mt-5">
    <div class="container text-center">
        <p class="mb-0">&copy; 2026 Ocean View Resort Galle. All Rights Reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>