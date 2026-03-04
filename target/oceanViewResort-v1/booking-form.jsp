<%@include file="includes/header.jsp" %>

<%
    // Getting data from the URL (e.g., booking-form.jsp?type=Deluxe)
    String roomType = request.getParameter("type");
    double pricePerNight = 0;
    
    if("Standard".equals(roomType)) pricePerNight = 80;
    else if("Deluxe".equals(roomType)) pricePerNight = 150;
    else if("Suite".equals(roomType)) pricePerNight = 350;
%>

<div class="container py-5 mt-5">
    <div class="row g-5">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 p-4">
                <h3 class="fw-bold mb-4">Complete Your Reservation</h3>
                <form action="confirm-booking.jsp" method="POST" id="finalBookingForm">
                    <input type="hidden" name="roomType" value="<%= roomType %>">
                    <input type="hidden" name="rate" id="hiddenRate" value="<%= pricePerNight %>">
                    <input type="hidden" name="totalAmount" id="hiddenTotal">

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label small fw-bold">Check-In Date</label>
                            <input type="date" name="checkIn" id="inDate" class="form-control" required onchange="updateSummary()">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold">Check-Out Date</label>
                            <input type="date" name="checkOut" id="outDate" class="form-control" required onchange="updateSummary()">
                        </div>
                        
                        <div class="col-12 mt-4">
                            <h6 class="fw-bold mb-3">Payment Option</h6>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <input type="radio" class="btn-check" name="paymentType" id="payNow" value="Now" checked>
                                    <label class="btn btn-outline-primary w-100 py-3 rounded-4" for="payNow">
                                        <i class="fa-solid fa-credit-card me-2"></i>Pay Now (Securely)
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <input type="radio" class="btn-check" name="paymentType" id="payLater" value="Later">
                                    <label class="btn btn-outline-secondary w-100 py-3 rounded-4" for="payLater">
                                        <i class="fa-solid fa-hotel me-2"></i>Pay at Resort
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 mt-5">
                            <button type="submit" class="btn btn-primary btn-lg w-100 rounded-pill py-3 fw-bold shadow">
                                Confirm & Book Room
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 p-4 bg-light sticky-top" style="top: 100px;">
                <h5 class="fw-bold mb-3">Your Selection</h5>
                <div class="d-flex justify-content-between mb-2">
                    <span class="text-muted"><%= roomType %> Room</span>
                    <span class="fw-bold">$<%= pricePerNight %>/night</span>
                </div>
                <hr>
                <div id="summaryLogic" class="d-none">
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Stay Duration</span>
                        <span id="nightsText" class="fw-bold">0 Nights</span>
                    </div>
                    <div class="d-flex justify-content-between mb-4">
                        <span class="fs-5 fw-bold text-dark">Total Amount</span>
                        <span id="totalText" class="fs-5 fw-bold text-primary">$0.00</span>
                    </div>
                </div>
                <p id="promptText" class="small text-muted text-center mb-0">Select dates to see total price</p>
            </div>
        </div>
    </div>
</div>

<script>
function updateSummary() {
    const cin = document.getElementById('inDate').value;
    const cout = document.getElementById('outDate').value;
    const rate = <%= pricePerNight %>;
    
    if(cin && cout) {
        const start = new Date(cin);
        const end = new Date(cout);
        const diff = Math.ceil((end - start) / (1000 * 60 * 60 * 24));

        if(diff > 0) {
            const total = diff * rate;
            document.getElementById('summaryLogic').classList.remove('d-none');
            document.getElementById('promptText').classList.add('d-none');
            document.getElementById('nightsText').innerText = diff + " Nights";
            document.getElementById('totalText').innerText = "$" + total.toFixed(2);
            document.getElementById('hiddenTotal').value = total.toFixed(2);
        }
    }
}
// Prevent past dates
document.getElementById('inDate').min = new Date().toISOString().split("T")[0];
</script>

<%@include file="includes/footer.jsp" %>