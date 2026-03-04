<%@include file="includes/header.jsp" %>

<%
    // In a real app, you'd save this to a database and get an ID
    String resId = "OV-" + (int)(Math.random()*9000 + 1000);
    String room = request.getParameter("roomType");
    String total = request.getParameter("totalAmount");
    String payType = request.getParameter("paymentType");
%>

<div class="container py-5 mt-5">
    <div class="text-center mb-5 animate__animated animate__zoomIn">
        <div class="bg-success bg-opacity-10 d-inline-block p-4 rounded-circle mb-3">
            <i class="fa-solid fa-check-circle fa-4x text-success"></i>
        </div>
        <h1 class="fw-bold">Reservation Confirmed!</h1>
        <p class="text-muted">Thank you for choosing Ocean View Resort. We've sent a confirmation to your email.</p>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
                <div class="bg-primary p-4 text-white text-center">
                    <small class="text-uppercase opacity-75">Your Reservation ID</small>
                    <h2 class="fw-bold mb-0">#<%= resId %></h2>
                </div>
                <div class="card-body p-4">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between px-0">
                            <span class="text-muted">Room Type</span>
                            <span class="fw-bold"><%= room %></span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between px-0">
                            <span class="text-muted">Payment Status</span>
                            <span class="badge <%= "Now".equals(payType) ? "bg-success" : "bg-warning text-dark" %>">
                                <%= "Now".equals(payType) ? "Paid Online" : "Pay at Check-in" %>
                            </span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between px-0 py-3">
                            <span class="fs-5 fw-bold">Total Bill</span>
                            <span class="fs-5 fw-bold text-primary">$<%= total %></span>
                        </li>
                    </ul>
                    
                    <div class="mt-4 d-grid gap-2">
                        <button onclick="window.print()" class="btn btn-outline-dark rounded-pill">
                            <i class="fa-solid fa-print me-2"></i>Download Receipt
                        </button>
                        <a href="index.jsp" class="btn btn-link text-muted text-decoration-none">Back to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>