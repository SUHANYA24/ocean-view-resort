<%@include file="includes/header.jsp" %>

<%
    String guestName = "";
    String guestPhone = "";

    if(user != null && user instanceof Guest){
        Guest guest = (Guest) user;          // cast to subclass
        guestName = guest.getFullName();     // now works
        guestPhone = guest.getContactNumber();
    }
    
    String roomNum = request.getParameter("rnum");  // passed from room-details.jsp
    String checkIn = request.getParameter("in");
    String checkOut = request.getParameter("out");
%>

<div class="container py-5 mt-5">
    <div class="row g-5">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
                <h3 class="fw-bold mb-4">Guest Information</h3>
                <form action="confirm-booking.jsp" method="POST" id="finalBookingForm">
                    <input type="hidden" name="roomNum" value="<%= roomNum %>">
                    <input type="hidden" name="totalAmount" id="hiddenTotal">
                    <input type="hidden" id="pricePerNightValue">

                    <div class="row g-3">
                        <input type="text" name="guestName" class="form-control bg-light border-0 py-2"
                               placeholder="e.g. John Doe" required
                               value="<%= guestName %>">

                        <input type="tel" name="guestPhone" class="form-control bg-light border-0 py-2"
                               placeholder="e.g. +94 77 123 4567" required
                               value="<%= guestPhone %>">

                        <input type="date" name="checkIn" id="inDate" class="form-control bg-light border-0 py-2"
                               value="<%= checkIn != null ? checkIn : "" %>" required onchange="updateSummary()">

                        <input type="date" name="checkOut" id="outDate" class="form-control bg-light border-0 py-2"
                               value="<%= checkOut != null ? checkOut : "" %>" required onchange="updateSummary()">

                        <div class="col-12 mt-4">
                            <h6 class="fw-bold mb-3 text-uppercase small">Select Payment Method</h6>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <input type="radio" class="btn-check" name="paymentType" id="payNow" value="Now" checked>
                                    <label class="btn btn-outline-primary w-100 py-3 rounded-4 shadow-sm" for="payNow">
                                        <i class="fa-solid fa-credit-card me-2"></i>Pay Online Now
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <input type="radio" class="btn-check" name="paymentType" id="payLater" value="Later">
                                    <label class="btn btn-outline-secondary w-100 py-3 rounded-4 shadow-sm" for="payLater">
                                        <i class="fa-solid fa-hotel me-2"></i>Pay at Reception
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 mt-5">
                            <button type="submit" class="btn btn-primary btn-lg w-100 rounded-pill py-3 fw-bold shadow">
                                Complete Reservation
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 p-4 bg-white sticky-top" style="top: 100px;">
                <h5 class="fw-bold mb-4">Booking Summary</h5>

                <div class="d-flex align-items-center mb-4">
                    <div class="bg-primary bg-opacity-10 p-3 rounded-3 me-3">
                        <i class="fa-solid fa-bed text-primary fa-lg"></i>
                    </div>
                    <div>
                        <h6 class="fw-bold mb-0" id="roomType"></h6>
                        <small class="text-muted">Room Number: <span class="text-dark fw-bold" id="roomNumber"></span></small>
                    </div>
                </div>

                <div class="list-group list-group-flush mb-4">
                    <div class="list-group-item px-0 border-0 d-flex justify-content-between">
                        <span class="text-muted">Rate per night</span>
                        <span class="fw-bold" id="pricePerNight"></span>
                    </div>
                    
                    <div id="summaryLogic" class="d-none">
                        <div class="list-group-item px-0 border-0 d-flex justify-content-between">
                            <span class="text-muted">Stay Duration</span>
                            <span id="nightsText" class="fw-bold text-dark">0 Nights</span>
                        </div>
                        <hr class="my-2">
                        <div class="list-group-item px-0 border-0 d-flex justify-content-between align-items-center">
                            <span class="fs-5 fw-bold">Total Bill</span>
                            <span id="totalText" class="fs-4 fw-bold text-primary">$0.00</span>
                        </div>
                    </div>
                </div>

                <div id="promptText" class="alert alert-warning py-2 mb-0 border-0 rounded-3 text-center small">
                    <i class="fa-solid fa-calendar-day me-1"></i> Choose dates to calculate total
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/booking.js"></script>

<%@include file="includes/footer.jsp" %>