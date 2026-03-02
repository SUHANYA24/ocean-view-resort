<%@include file="../includes/header_staff.jsp" %>

<main class="container py-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold text-dark">How can we help you today?</h2>
        <p class="text-muted">Quick guides and documentation for Ocean View Staff members.</p>
        <div class="row justify-content-center mt-3">
            <div class="col-md-6">
                <div class="input-group shadow-sm rounded-pill overflow-hidden">
                    <span class="input-group-text bg-white border-0 ps-3"><i class="fa-solid fa-search"></i></span>
                    <input type="text" class="form-control border-0 py-2" placeholder="Search for a topic (e.g., 'billing', 'check-in')...">
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 sticky-top" style="top: 100px;">
                <div class="list-group list-group-flush rounded-4">
                    <a href="#booking-guide" class="list-group-item list-group-item-action py-3 fw-bold border-0">
                        <i class="fa-solid fa-calendar-check me-2 text-info"></i> Booking Guide
                    </a>
                    <a href="#billing-guide" class="list-group-item list-group-item-action py-3 fw-bold border-0">
                        <i class="fa-solid fa-file-invoice-dollar me-2 text-success"></i> Billing & Invoices
                    </a>
                    <a href="#room-status" class="list-group-item list-group-item-action py-3 fw-bold border-0">
                        <i class="fa-solid fa-broom me-2 text-warning"></i> Room Maintenance
                    </a>
                    <a href="#contact-admin" class="list-group-item list-group-item-action py-3 fw-bold border-0 text-danger">
                        <i class="fa-solid fa-headset me-2"></i> Contact Admin
                    </a>
                </div>
            </div>
        </div>

        <div class="col-lg-9">
            
            <section id="booking-guide" class="mb-5">
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <h4 class="fw-bold mb-4 border-bottom pb-2">1. Managing Bookings (Requirement #3)</h4>
                    <div class="mb-4">
                        <h6 class="fw-bold text-info"><i class="fa-solid fa-magnifying-glass me-2"></i>How to find a guest?</h6>
                        <p class="text-muted small">Go to the <strong>Reservations</strong> tab. Enter the guest's name or their unique <strong>Reservation ID</strong> in the search bar. The system will instantly filter all matching records from the database.</p>
                    </div>
                    <div class="mb-3">
                        <h6 class="fw-bold text-info"><i class="fa-solid fa-check-to-slot me-2"></i>How to Check-In a guest?</h6>
                        <p class="text-muted small">Once you locate the reservation, click the green <strong>Check-In</strong> button. This will update the room status to 'Occupied' automatically.</p>
                    </div>
                </div>
            </section>

            <section id="billing-guide" class="mb-5">
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <h4 class="fw-bold mb-4 border-bottom pb-2 text-success">2. Billing & Payments (Requirement #4)</h4>
                    <p class="text-muted small mb-4">The system automatically calculates the bill based on the room rate and the number of nights stayed.</p>
                    
                    <div class="bg-light p-3 rounded-3 mb-3 border-start border-success border-4">
                        <h6 class="fw-bold mb-1">To print an invoice:</h6>
                        <ol class="small text-muted mb-0">
                            <li>Search for the guest in the <strong>Reservations</strong> list.</li>
                            <li>Click the <strong>Bill</strong> button next to their name.</li>
                            <li>A summary will appear. Verify the total and click <strong>Print</strong>.</li>
                        </ol>
                    </div>
                </div>
            </section>

            <section id="room-status" class="mb-5">
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <h4 class="fw-bold mb-4 border-bottom pb-2 text-warning">3. Room Housekeeping</h4>
                    <p class="text-muted small">It is vital to keep the room status updated so the front desk knows which rooms are ready for check-in.</p>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="p-3 border rounded-3">
                                <span class="badge bg-warning mb-2">Dirty</span>
                                <p class="small text-muted mb-0">Set this status after a guest checks out.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="p-3 border rounded-3">
                                <span class="badge bg-success mb-2">Available</span>
                                <p class="small text-muted mb-0">Set this after the room has been cleaned and inspected.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <div class="alert alert-info border-0 shadow-sm rounded-4 p-4 text-center">
                <h5 class="fw-bold">Still need help?</h5>
                <p class="mb-3">If you encounter technical issues, please contact the System Administrator.</p>
                <a href="mailto:admin@oceanview.com" class="btn btn-info text-white rounded-pill px-4">Email Support</a>
            </div>

        </div>
    </div>
</main>

<%@include file="../includes/footer.jsp" %>