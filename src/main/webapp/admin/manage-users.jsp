<%@include file="../includes/header_admin.jsp" %>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>User Management</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">
            <i class="fa-solid fa-user-plus me-2"></i> Add New User
        </button>
    </div>

    <div class="card shadow-sm border-0">
        <div class="table-responsive">
            <table class="table align-middle mb-0">
                <thead class="table-light">
                    <tr>
                        <th class="ps-4">User</th>
                        <th>Role</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th class="text-end pe-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="ps-4">
                            <div class="d-flex align-items-center">
                                <img src="https://ui-avatars.com/api/?name=John+Staff" class="rounded-circle me-3" width="35">
                                <div>
                                    <div class="fw-bold">John Staff</div>
                                    <small class="text-muted">Staff Account</small>
                                </div>
                            </div>
                        </td>
                        <td><span class="badge bg-info">STAFF</span></td>
                        <td>john.staff@oceanview.com</td>
                        <td><span class="text-success"><i class="fa-solid fa-circle fa-2xs me-1"></i> Active</span></td>
                        <td class="text-end pe-4">
                            <button class="btn btn-sm btn-outline-warning" data-bs-toggle="modal" data-bs-target="#resetPasswordModal">
                                <i class="fa-solid fa-key"></i> Reset
                            </button>
                            <button class="btn btn-sm btn-outline-danger"><i class="fa-solid fa-trash"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</main>

<%@include file="modals/add_user_modal.jsp" %>
<%@include file="modals/reset_password_modal.jsp" %>

<%@include file="../includes/footer.jsp" %>