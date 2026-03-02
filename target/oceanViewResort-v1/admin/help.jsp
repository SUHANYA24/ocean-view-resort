<%@include file="../includes/header_admin.jsp" %>

<main class="container py-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold text-dark"><i class="fa-solid fa-circle-info me-2 text-primary"></i>Administrator Documentation</h2>
        <p class="text-muted">Master guide for managing system settings, users, and hotel inventory.</p>
    </div>

    <div class="row g-4">
        <div class="col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 sticky-top" style="top: 100px;">
                <div class="list-group list-group-flush rounded-4">
                    <a href="#user-management" class="list-group-item list-group-item-action py-3 fw-bold border-0">
                        <i class="fa-solid fa-users-gear me-2 text-primary"></i> User Management
                    </a>
                    <a href="#room-config" class="list-group-item list-group-item-action py-3 fw-bold border-0">
                        <i class="fa-solid fa-sliders me-2 text-success"></i> Room Configuration
                    </a>
                    <a href="#billing-logic" class="list-group-item list-group-item-action py-3 fw-bold border-0">
                        <i class="fa-solid fa-calculator me-2 text-warning"></i> Billing Logic
                    </a>
                    <a href="#system-security" class="list-group-item list-group-item-action py-3 fw-bold border-0">
                        <i class="fa-solid fa-shield-halved me-2 text-danger"></i> System Security
                    </a>
                </div>
            </div>
        </div>

        <div class="col-lg-9">
            
            <section id="user-management" class="mb-5">
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <h4 class="fw-bold mb-4 border-bottom pb-2">1. Managing Staff & Accounts</h4>
                    <p class="text-muted small">As an Admin, you are responsible for creating staff accounts and maintaining security.</p>
                    
                    <div class="mb-4">
                        <h6 class="fw-bold text-primary"><i class="fa-solid fa-plus-circle me-2"></i>Registering Staff</h6>
                        <p class="text-muted small">Go to <strong>Manage Users</strong>. Use the "Register New Staff" button. Staff accounts are restricted from accessing financial reports and room pricing.</p>
                    </div>
                    <div class="bg-light p-3 rounded-3 border-start border-primary border-4">
                        <h6 class="fw-bold mb-1 small">Password Recovery:</h6>
                        <p class="small text-muted mb-0">If a staff member forgets their password, locate them in the user table and use the <strong>Key icon</strong> to set a temporary password.</p>
                    </div>
                </div>
            </section>

            <section id="room-config" class="mb-5">
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <h4 class="fw-bold mb-4 border-bottom pb-2 text-success">2. Inventory & Pricing</h4>
                    <p class="text-muted small mb-4">This section handles the core data used by the booking engine.</p>
                    
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="p-3 border rounded-3 h-100">
                                <h6 class="fw-bold small">Room Types</h6>
                                <p class="text-muted" style="font-size: 0.8rem;">Define categories (e.g., Suite) and set the <strong>Rate per Night</strong>. This directly affects billing calculations.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="p-3 border rounded-3 h-100">
                                <h6 class="fw-bold small">Room Units</h6>
                                <p class="text-muted" style="font-size: 0.8rem;">Add physical room numbers and link them to a Type. This tracks real-time availability for guests.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="billing-logic" class="mb-5">
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <h4 class="fw-bold mb-4 border-bottom pb-2 text-warning">3. Automated Billing (Requirement #4)</h4>
                    <p class="text-muted small">The system calculates totals using the following formula:</p>
                    
                    <div class="bg-dark text-white p-3 rounded-3 mb-3 text-center">
                        <code>Total Bill = (Room Rate per Night) × (Number of Nights)</code>
                    </div>
                    
                    <p class="text-muted small">To update prices, navigate to <strong>Manage Rooms</strong> and edit the category rate. Changes will apply to all new bookings made after the update.</p>
                </div>
            </section>

            <section id="system-security" class="mb-5">
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <h4 class="fw-bold mb-4 border-bottom pb-2 text-danger">4. Data Integrity & Security</h4>
                    <ul class="text-muted small">
                        <li class="mb-2"><strong>Session Control:</strong> Admins are automatically logged out after 30 minutes of inactivity to protect guest data.</li>
                        <li class="mb-2"><strong>Audit Trail:</strong> All room price changes and user creations are logged in the database.</li>
                        <li class="mb-2"><strong>Customer Privacy:</strong> Only the Admin can permanently delete customer records from the system.</li>
                    </ul>
                </div>
            </section>

            <div class="text-center p-4">
                <p class="text-muted small">Ocean View Resort Management System v1.0.0</p>
                <button class="btn btn-sm btn-outline-secondary rounded-pill" onclick="window.print()">
                    <i class="fa-solid fa-print me-2"></i>Print Full Documentation
                </button>
            </div>

        </div>
    </div>
</main>

<%@include file="../includes/footer.jsp" %>