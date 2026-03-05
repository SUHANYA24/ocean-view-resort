<%@include file="includes/header.jsp" %>

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-5">
        <div>
            <h2 class="fw-bold mb-1">My Reservations</h2>
            <p class="text-muted">Manage your upcoming stays and download past receipts.</p>
        </div>
        <a href="../rooms.jsp" class="btn btn-primary rounded-pill px-4 shadow-sm">
            <i class="fa-solid fa-plus me-2"></i>Book New Stay
        </a>
    </div>

    <ul class="nav nav-pills mb-4" id="pills-tab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active rounded-pill px-4 me-2" data-bs-toggle="pill" data-bs-target="#upcoming">Upcoming</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-pill px-4" data-bs-toggle="pill" data-bs-target="#past">Past Stays</button>
        </li>
    </ul>

    <div class="tab-content" id="pills-tabContent">
        <div class="tab-pane fade show active" id="upcoming">
            <div class="row g-4">
                <div class="col-12">
                    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                        <div class="row g-0">
                            <div class="col-md-3">
                                <img src="https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=400&q=80" 
                                     class="img-fluid h-100 object-fit-cover" alt="Room">
                            </div>
                            <div class="col-md-9">
                                <div class="card-body p-4">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <div>
                                            <span class="badge bg-primary-subtle text-primary mb-2">Confirmed</span>
                                            <h5 class="fw-bold mb-0">Deluxe Ocean Front</h5>
                                            <small class="text-muted">Res ID: #OV-7702</small>
                                        </div>
                                        <div class="text-end">
                                            <h4 class="fw-bold text-dark mb-0">$450.00</h4>
                                            <small class="text-muted">Total Paid</small>
                                        </div>
                                    </div>
                                    
                                    <div class="row mb-4">
                                        <div class="col-sm-4">
                                            <small class="text-uppercase text-muted d-block" style="font-size: 0.7rem;">Check-In</small>
                                            <span class="fw-bold">March 15, 2026</span>
                                        </div>
                                        <div class="col-sm-4">
                                            <small class="text-uppercase text-muted d-block" style="font-size: 0.7rem;">Check-Out</small>
                                            <span class="fw-bold">March 18, 2026</span>
                                        </div>
                                        <div class="col-sm-4">
                                            <small class="text-uppercase text-muted d-block" style="font-size: 0.7rem;">Guests</small>
                                            <span class="fw-bold">2 Adults</span>
                                        </div>
                                    </div>

                                    <div class="d-flex gap-2">
                                        <button class="btn btn-outline-dark btn-sm rounded-pill px-3" onclick="window.print()">
                                            <i class="fa-solid fa-file-pdf me-1"></i> Receipt
                                        </button>
                                        <button class="btn btn-light btn-sm rounded-pill px-3 text-danger">
                                            <i class="fa-solid fa-xmark me-1"></i> Cancel Booking
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="past">
            <div class="card border-0 shadow-sm rounded-4">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="bg-light small text-uppercase">
                            <tr>
                                <th class="ps-4">Stay Dates</th>
                                <th>Room Type</th>
                                <th>Reservation ID</th>
                                <th>Total Bill</th>
                                <th class="text-end pe-4">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="ps-4">Jan 05 - Jan 08, 2026</td>
                                <td class="fw-bold">Standard Garden View</td>
                                <td>#OV-5521</td>
                                <td>$240.00</td>
                                <td class="text-end pe-4">
                                    <button class="btn btn-sm btn-outline-primary rounded-pill">View Bill</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>