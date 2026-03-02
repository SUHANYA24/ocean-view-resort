<%@include file="includes/header.jsp" %>

<header class="hero-section text-white d-flex align-items-center" style="background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)), url('https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=1920&q=80') center/cover no-repeat; min-height: 80vh;">
    <div class="container text-center">
        <h1 class="display-2 fw-bold mb-3 animate__animated animate__fadeInDown">Your Paradise in Galle</h1>
        <p class="lead mb-5 fs-4 opacity-90">Experience luxury by the shore. Hundreds of guests trust our sanctuary every month.</p>
        <a href="#booking" class="btn btn-lg btn-light px-5 py-3 fw-bold rounded-pill shadow">Explore Rooms</a>
    </div>
</header>

<section id="booking" class="container position-relative" style="margin-top: -50px; z-index: 10;">
    <div class="bg-white p-4 rounded-4 shadow-lg">
        <form action="ReservationServlet" method="POST" class="row g-3 align-items-end">
            <div class="col-md-3">
                <label class="form-label small fw-bold text-uppercase text-muted">Check-In</label>
                <input type="date" class="form-control border-0 bg-light py-2" name="checkIn" id="checkInDate">
            </div>
            <div class="col-md-3">
                <label class="form-label small fw-bold text-uppercase text-muted">Check-Out</label>
                <input type="date" class="form-control border-0 bg-light py-2" name="checkOut" id="checkOutDate">
            </div>
            <div class="col-md-3">
                <label class="form-label small fw-bold text-uppercase text-muted">Room Type</label>
                <select class="form-select border-0 bg-light py-2" name="roomType">
                    <option selected disabled>Select Category</option>
                    <option value="1">Standard Garden ($80)</option>
                    <option value="2">Deluxe Ocean ($150)</option>
                    <option value="3">Presidential Suite ($300)</option>
                </select>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary w-100 py-2 fw-bold rounded-3">Find My Room</button>
            </div>
        </form>
    </div>
</section>

<section class="py-5 mt-5 bg-white">
    <div class="container py-5">
        <div class="row align-items-center g-5">
            <div class="col-lg-6">
                <h6 class="text-primary fw-bold text-uppercase tracking-widest">The Ocean View Experience</h6>
                <h2 class="display-5 fw-bold mb-4">A Sanctuary Built for You</h2>
                <p class="text-muted fs-5 mb-4">Located on the pristine coastline of Galle, we specialize in providing a seamless blend of traditional Sri Lankan hospitality and modern digital convenience.</p>
                
                <div class="row g-4">
                    <div class="col-6">
                        <h3 class="fw-bold text-dark">500+</h3>
                        <p class="small text-muted text-uppercase">Monthly Guests</p>
                    </div>
                    <div class="col-6">
                        <h3 class="fw-bold text-dark">4.9/5</h3>
                        <p class="small text-muted text-uppercase">Guest Rating</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="row g-2">
                    <div class="col-6">
                        <img src="https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=400&q=80" class="img-fluid rounded-4 shadow-sm" alt="Pool">
                    </div>
                    <div class="col-6 mt-4">
                        <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=400&q=80" class="img-fluid rounded-4 shadow-sm" alt="Resort">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5 bg-light">
    <div class="container text-center">
        <h2 class="fw-bold mb-5">Unmatched Digital Comfort</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="p-4 bg-white rounded-4 h-100 border-0 shadow-sm transition-up">
                    <div class="icon-circle bg-primary bg-opacity-10 text-primary mx-auto mb-3">
                        <i class="fa-solid fa-shield-halved fa-2x"></i>
                    </div>
                    <h5 class="fw-bold">Secured ID Booking</h5>
                    <p class="text-muted small">Every reservation generates a unique ID, ensuring your data remains private and your check-in is swift.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-4 bg-white rounded-4 h-100 border-0 shadow-sm transition-up">
                    <div class="icon-circle bg-success bg-opacity-10 text-success mx-auto mb-3">
                        <i class="fa-solid fa-file-invoice-dollar fa-2x"></i>
                    </div>
                    <h5 class="fw-bold">Auto-Billing Engine</h5>
                    <p class="text-muted small">No hidden fees. Our system calculates your stay instantly using real-time nightly rates.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-4 bg-white rounded-4 h-100 border-0 shadow-sm transition-up">
                    <div class="icon-circle bg-info bg-opacity-10 text-info mx-auto mb-3">
                        <i class="fa-solid fa-headset fa-2x"></i>
                    </div>
                    <h5 class="fw-bold">Staff at Your Fingertips</h5>
                    <p class="text-muted small">Our digital management system ensures staff are alerted to your needs 24/7.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="py-5">
    <div class="container py-5 text-center">
        <h2 class="fw-bold mb-5">What Our Guests Say</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card border-0 shadow-sm p-4 rounded-4 italic">
                    <p class="text-muted">"The booking process was incredibly smooth. I received my reservation ID instantly, and the automated bill was clear and accurate!"</p>
                    <div class="d-flex align-items-center justify-content-center mt-3">
                        <img src="https://ui-avatars.com/api/?name=Arjun+S&background=random" class="rounded-circle me-2" width="40">
                        <h6 class="mb-0 fw-bold">Arjun Silva</h6>
                    </div>
                </div>
            </div>
            </div>
    </div>
</section>

<footer class="bg-dark text-white pt-5 pb-4 mt-5">
    <div class="container text-center">
        <h4 class="fw-bold text-primary mb-3">Ocean View Resort</h4>
        <p class="text-muted small mb-4">Galle Road, Galle, Sri Lanka | +94 11 234 5678</p>
        <hr class="opacity-10 mb-4">
        <p class="mb-0 small text-muted">&copy; 2026 Ocean View Resort. All Rights Reserved.</p>
    </div>
</footer>

<style>
    .transition-up:hover { transform: translateY(-10px); transition: all 0.3s ease; }
    .icon-circle { width: 80px; height: 80px; display: flex; align-items: center; justify-content: center; border-radius: 50%; }
</style>

<script>
    // Set min date for check-in as today
    document.getElementById('checkInDate').min = new Date().toISOString().split("T")[0];
</script>

<%@include file="includes/footer.jsp" %>