<%@include file="../includes/header_staff.jsp" %>

<main class="container py-5">
    <div class="row">
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 text-center p-4 mb-4">
                <div class="position-relative d-inline-block mx-auto mb-3">
                    <img src="https://ui-avatars.com/api/?name=Staff+Member&background=0dcaf0&color=fff&size=128" 
                         class="rounded-circle border border-4 border-white shadow-sm" width="120">
                </div>
                <h4 class="fw-bold mb-1">Staff Member</h4>
                <p class="text-info small fw-bold mb-3"><i class="fa-solid fa-id-badge me-1"></i> Front Desk Operations</p>
                
                <hr class="my-4 text-muted opacity-25">
                
                <div class="text-start">
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted small">Employee ID:</span>
                        <span class="small fw-bold">EMP-9920</span>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted small">Status:</span>
                        <span class="badge bg-success-subtle text-success">On Shift</span>
                    </div>
                </div>
            </div>

            <div class="list-group border-0 shadow-sm rounded-4 overflow-hidden">
                <a href="help.jsp" class="list-group-item list-group-item-action border-0 py-3">
                    <i class="fa-solid fa-circle-question me-2 text-info"></i> System Help Guide
                </a>
                <a href="../logout.jsp" class="list-group-item list-group-item-action border-0 py-3 text-danger">
                    <i class="fa-solid fa-power-off me-2"></i> Sign Out
                </a>
            </div>
        </div>

        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 mb-4">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="mb-0 fw-bold"><i class="fa-solid fa-user-pen me-2 text-info"></i>My Information</h5>
                </div>
                <div class="card-body p-4">
                    <form action="ProfileServlet" method="POST">
                        <input type="hidden" name="action" value="update_staff_info">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Full Name</label>
                                <input type="text" name="fullname" class="form-control" value="Saman Kumara" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Username</label>
                                <input type="text" class="form-control bg-light" value="saman_staff" readonly>
                                <small class="text-muted" style="font-size: 0.7rem;">Username cannot be changed by staff.</small>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Contact Number</label>
                                <input type="text" name="phone" class="form-control" value="+94 77 123 4567">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Email</label>
                                <input type="email" name="email" class="form-control" value="saman@oceanview.com">
                            </div>
                            <div class="col-12 text-end mt-4">
                                <button type="submit" class="btn btn-info text-white px-4 rounded-pill shadow-sm">Save Changes</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="mb-0 fw-bold"><i class="fa-solid fa-lock me-2 text-warning"></i>Security Settings</h5>
                </div>
                <div class="card-body p-4">
                    <form action="ProfileServlet" method="POST">
                        <input type="hidden" name="action" value="update_staff_password">
                        <div class="row g-3">
                            <div class="col-md-12">
                                <label class="form-label small fw-bold">Current Password</label>
                                <input type="password" name="old_pass" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">New Password</label>
                                <input type="password" name="new_pass" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small fw-bold">Confirm New Password</label>
                                <input type="password" name="confirm_pass" class="form-control" required>
                            </div>
                            <div class="col-12 text-end mt-4">
                                <button type="submit" class="btn btn-dark px-4 rounded-pill">Change Password</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="../includes/footer.jsp" %>