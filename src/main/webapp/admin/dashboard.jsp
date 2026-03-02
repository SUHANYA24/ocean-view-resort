<%@include file="../includes/header_admin.jsp" %> <div class="container-fluid">
    <div class="row">
        <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse min-vh-100">
            <div class="position-sticky pt-4">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link text-white active" href="dashboard.jsp">
                            <i class="fa-solid fa-chart-line me-2"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="manage-bookings.jsp">
                            <i class="fa-solid fa-calendar-check me-2"></i> Bookings
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="manage-rooms.jsp">
                            <i class="fa-solid fa-door-open me-2"></i> Room Management
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="guests.jsp">
                            <i class="fa-solid fa-users me-2"></i> Guest Records
                        </a>
                    </li>
                    <hr class="text-secondary">
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="../logout.jsp">
                            <i class="fa-solid fa-right-from-bracket me-2"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 bg-light">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Admin Overview</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <button type="button" class="btn btn-sm btn-outline-secondary">Export Report</button>
                </div>
            </div>

            <div class="row g-4 mb-4">
                <div class="col-md-3">
                    <div class="card border-0 shadow-sm p-3 border-start border-primary border-5">
                        <small class="text-muted fw-bold">TOTAL RESERVATIONS</small>
                        <h3 class="fw-bold mt-1">128</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card border-0 shadow-sm p-3 border-start border-success border-5">
                        <small class="text-muted fw-bold">REVENUE (MARCH)</small>
                        <h3 class="fw-bold mt-1">$12,450</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card border-0 shadow-sm p-3 border-start border-warning border-5">
                        <small class="text-muted fw-bold">ACTIVE GUESTS</small>
                        <h3 class="fw-bold mt-1">42</h3>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card border-0 shadow-sm p-3 border-start border-info border-5">
                        <small class="text-muted fw-bold">ROOM OCCUPANCY</small>
                        <h3 class="fw-bold mt-1">85%</h3>
                    </div>
                </div>
            </div>

            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold">Recent Reservations</h5>
                    <a href="add-reservation.jsp" class="btn btn-primary btn-sm">+ New Booking</a>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>Res ID</th>
                                    <th>Guest Name</th>
                                    <th>Room Type</th>
                                    <th>Check-In</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#OV-9921</td>
                                    <td><strong>John Doe</strong></td>
                                    <td>Deluxe Ocean</td>
                                    <td>2026-03-05</td>
                                    <td><span class="badge bg-success">Confirmed</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-light border" title="Print Bill"><i class="fa-solid fa-file-invoice"></i></button>
                                        <button class="btn btn-sm btn-light border text-danger"><i class="fa-solid fa-trash"></i></button>
                                    </td>
                                </tr>
                                </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>