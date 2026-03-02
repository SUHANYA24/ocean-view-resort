<%@include file="../includes/header_admin.jsp" %>

<main class="container py-5">
    <div class="row">
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 text-center p-4 mb-4">
                <div class="position-relative d-inline-block mx-auto mb-3">
                    <img src="https://ui-avatars.com/api/?name=Admin+User&background=0077b6&color=fff&size=128" 
                         class="rounded-circle border border-4 border-white shadow-sm" width="120">
                    <button class="btn btn-primary btn-sm rounded-circle position-absolute bottom-0 end-0 shadow">
                        <i class="fa-solid fa-camera"></i>
                    </button>
                </div>
                <h4 class="fw-bold mb-1">Admin User</h4>
                <p class="text-muted small mb-3">System Administrator</p>
                <div class="d-grid">
                    <button class="btn btn-outline-danger btn-sm rounded-pill" onclick="location.href='../logout.jsp'">
                        <i class="fa-solid fa-power-off me-2"></i>Sign Out
                    </a>
                </div>
            </div>

            <div class="card border-0 shadow-sm rounded-4 p-3">
                <h6 class="fw-bold small text-uppercase text-muted mb-3">Security Status</h6>
                <div class="d-flex align-items-center mb-2">
                    <span class="small me-auto">Account Verified</span>
                    <i class="fa-solid fa-circle-check text-success"></i>
                </div>
                <div class="d-flex align-items-center mb-2">
                    <span class="small me-auto">2FA Enabled</span>
                    <i class="fa-solid fa-circle-xmark text-muted"></i>
                </div>
                <hr>
                <small class="text-muted">Last Login: March 02, 2026 - 07:14 PM</small>
            </div>
        </div>

        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-4">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="mb-0 fw-bold"><i class="fa-solid fa-user-gear me-2 text-primary"></i>Personal Information</h5>
                </div>
                <div class="card-body p-4">
                    <form action="ProfileServlet" method="POST">
                        <input type="hidden" name="action" value="update_profile">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Full Name</label>
                                <input type="text" name="fullname" class="form-control" value="Admin User" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Username</label>
                                <input type="text" name="username" class="form-control" value="admin_ocean" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Email Address</label>
                                <input type="email" name="email" class="form-control" value="admin@oceanview.com" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Phone Number</label>
                                <input type="text" name="phone" class="form-control" value="+94 11 234 5678">
                            </div>
                            <div class="col-12 mt-4 text-end">
                                <button type="submit" class="btn btn-primary px-4 rounded-pill">Update Profile</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="mb-0 fw-bold"><i class="fa-solid fa-shield-halved me-2 text-warning"></i>Change Password</h5>
                </div>
                <div class="card-body p-4">
                    <form action="ProfileServlet" method="POST">
                        <input type="hidden" name="action" value="update_password">
                        <div class="row g-3">
                            <div class="col-md-12">
                                <label class="form-label small fw-bold">Current Password</label>
                                <input type="password" name="current_pass" class="form-control" placeholder="????????" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">New Password</label>
                                <input type="password" name="new_pass" class="form-control" placeholder="Minimum 8 characters" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Confirm New Password</label>
                                <input type="password" name="confirm_pass" class="form-control" placeholder="Repeat new password" required>
                            </div>
                            <div class="col-12 mt-4 text-end">
                                <button type="submit" class="btn btn-dark px-4 rounded-pill">Securely Update Password</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="../includes/footer.jsp" %>