<%@include file="../includes/header_staff.jsp" %>

<main class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0">Daily Operations</h2>
            <p class="text-muted">Current Shift: <%= new java.util.Date() %></p>
        </div>
        <div class="btn-group shadow-sm">
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newBookingModal">
                <i class="fa-solid fa-plus me-2"></i>Quick Booking
            </button>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-md-4">
            <div class="card border-0 shadow-sm p-4 border-bottom border-primary border-5 rounded-4">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-muted small fw-bold text-uppercase">Today's Arrivals</h6>
                        <h2 class="fw-bold mb-0">12</h2>
                    </div>
                    <i class="fa-solid fa-plane-arrival fa-2x text-primary opacity-25"></i>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border-0 shadow-sm p-4 border-bottom border-warning border-5 rounded-4">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-muted small fw-bold text-uppercase">Today's Departures</h6>
                        <h2 class="fw-bold mb-0">08</h2>
                    </div>
                    <i class="fa-solid fa-plane-departure fa-2x text-warning opacity-25"></i>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border-0 shadow-sm p-4 border-bottom border-info border-5 rounded-4">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="text-muted small fw-bold text-uppercase">Dirty Rooms</h6>
                        <h2 class="fw-bold mb-0">05</h2>
                    </div>
                    <i class="fa-solid fa-broom fa-2x text-info opacity-25"></i>
                </div>
            </div>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-header bg-white py-3">
            <h5 class="mb-0 fw-bold">Live Guest Status</h5>
        </div>
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="bg-light">
                    <tr>
                        <th class="ps-4">Room</th>
                        <th>Guest Name</th>
                        <th>Stay Period</th>
                        <th>Cleaning</th>
                        <th class="text-end pe-4">Quick Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="ps-4 fw-bold text-primary">204</td>
                        <td>Mr. Kamal Perera</td>
                        <td><small>Mar 02 - Mar 05</small></td>
                        <td><span class="badge bg-success">Clean</span></td>
                        <td class="text-end pe-4">
                            <button class="btn btn-sm btn-outline-info" title="Print Key Card"><i class="fa-solid fa-key"></i></button>
                            <button class="btn btn-sm btn-outline-dark" title="Generate Bill"><i class="fa-solid fa-file-invoice-dollar"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td class="ps-4 fw-bold text-primary">102</td>
                        <td>Ms. Sarah Jenkins</td>
                        <td><small>Mar 01 - Mar 03</small></td>
                        <td><span class="badge bg-danger">Requires Cleaning</span></td>
                        <td class="text-end pe-4">
                            <button class="btn btn-sm btn-success">Check Out</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</main>

<%@include file="../includes/footer.jsp" %>