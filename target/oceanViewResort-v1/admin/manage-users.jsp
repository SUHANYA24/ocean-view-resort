<%@include file="../includes/header_admin.jsp" %>

<main class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0 text-dark">User Account Management</h2>
            <p class="text-muted">Manage system access for Admins, Staff, and Customers.</p>
        </div>
        <button class="btn btn-primary rounded-pill shadow-sm px-4" data-bs-toggle="modal" data-bs-target="#addStaffModal">
            <i class="fa-solid fa-user-plus me-2"></i>Register New Staff
        </button>
    </div>

    <div class="row g-3 mb-4">
        <div class="col-md-4">
            <div class="card border-0 shadow-sm p-3">
                <div class="d-flex align-items-center">
                    <div class="bg-primary bg-opacity-10 p-3 rounded-circle me-3">
                        <i class="fa-solid fa-user-shield text-primary"></i>
                    </div>
                    <div>
                        <small class="text-muted fw-bold d-block">ADMINS</small>
                        <h5 class="fw-bold mb-0"><%= request.getAttribute("adminCount") %></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border-0 shadow-sm p-3">
                <div class="d-flex align-items-center">
                    <div class="bg-info bg-opacity-10 p-3 rounded-circle me-3">
                        <i class="fa-solid fa-user-tie text-info"></i>
                    </div>
                    <div>
                        <small class="text-muted fw-bold d-block">STAFF MEMBERS</small>
                        <h5 class="fw-bold mb-0"><%= request.getAttribute("staffCount") %></h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border-0 shadow-sm p-3">
                <div class="d-flex align-items-center">
                    <div class="bg-success bg-opacity-10 p-3 rounded-circle me-3">
                        <i class="fa-solid fa-users text-success"></i>
                    </div>
                    <div>
                        <small class="text-muted fw-bold d-block">CUSTOMERS</small>
                        <h5 class="fw-bold mb-0"><%= request.getAttribute("guestCount") %></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-header bg-white py-3 border-bottom d-flex justify-content-between align-items-center">
            <h5 class="mb-0 fw-bold">All System Users</h5>
            <div class="btn-group btn-group-sm shadow-sm">
                <button class="btn btn-outline-secondary active">All</button>
                <button class="btn btn-outline-secondary">Staff</button>
                <button class="btn btn-outline-secondary">Customers</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="bg-light text-muted small text-uppercase">
                    <tr>
                        <th class="ps-4">User Details</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Contact</th>
                        <th class="text-end pe-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<User> users = (List<User>) request.getAttribute("users");

                        if(users != null){
                        for(User u : users){
                    %>

                    <tr>

                        <td class="ps-4">
                            <div class="d-flex align-items-center">
                                <img src="https://ui-avatars.com/api/?name=<%=u.getEmail() %>&background=0077b6&color=fff"
                                     class="rounded-circle me-3" width="38">

                                <div>
                                    <div class="fw-bold"><%=u.getEmail()%></div>
                                    <small class="text-muted">System User</small>
                                </div>
                            </div>
                        </td>

                        <td>
                            <span class="text-dark fw-medium"><%=u.getEmail()%></span>
                        </td>

                        <td>

                            <%
                            String role = u.getRole();

                            if(role.equals("ADMIN")){
                            %>
                            <span class="badge bg-primary px-3 py-2 rounded-pill">ADMIN</span>
                            <%
                            }else if(role.equals("STAFF")){
                            %>
                            <span class="badge bg-info-subtle text-info px-3 py-2 rounded-pill">STAFF</span>
                            <%
                            }else{
                            %>
                            <span class="badge bg-success-subtle text-success px-3 py-2 rounded-pill">CUSTOMER</span>
                            <%
                            }
                            %>

                        </td>

                        <td><%=u.getEmail()%></td>

                        <td class="text-end pe-4">

                            <button class="btn btn-sm btn-light border me-1"
                                    onclick="prepReset('<%=u.getEmail()%>')"
                                    data-bs-toggle="modal"
                                    data-bs-target="#resetPasswordModal">

                                <i class="fa-solid fa-key text-warning"></i>

                            </button>

                            <button class="btn btn-sm btn-light border text-danger">

                                <i class="fa-solid fa-user-minus"></i>

                            </button>

                        </td>

                    </tr>

                    <%
                    }
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</main>

<div class="modal fade" id="addStaffModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow">
            <div class="modal-header border-bottom py-3">
                <h5 class="modal-title fw-bold">Register Staff Member</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="UserServlet" method="POST">
                <input type="hidden" name="action" value="create_staff">
                <div class="modal-body p-4">
                    <div class="row g-3">
                        <div class="col-md-12">
                            <label class="form-label small fw-bold">Full Name</label>
                            <input type="text" name="fullname" class="form-control" placeholder="Enter full name" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold">Username</label>
                            <input type="text" name="username" class="form-control" placeholder="staff_id" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold">Temporary Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label small fw-bold">Contact Number</label>
                            <input type="text" name="contact" class="form-control" placeholder="+94...">
                        </div>
                    </div>
                </div>
                <div class="modal-footer bg-light border-0">
                    <button type="button" class="btn btn-link text-muted text-decoration-none" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary px-4">Create Account</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="resetPasswordModal" tabindex="-1">
    <div class="modal-dialog modal-sm modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-warning border-0">
                <h6 class="modal-title fw-bold text-dark"><i class="fa-solid fa-shield-halved me-2"></i>Security Reset</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="UserServlet" method="POST">
                <input type="hidden" name="action" value="reset_pass">
                <input type="hidden" id="resetUserId" name="username">
                <div class="modal-body text-center p-4">
                    <p class="mb-3">Set new password for <br><strong id="resetUserName">User</strong></p>
                    <input type="password" name="newPassword" class="form-control mb-2" placeholder="Enter new password" required>
                    <small class="text-muted">User will need to use this to login immediately.</small>
                </div>
                <div class="modal-footer border-0 p-3">
                    <button type="submit" class="btn btn-dark w-100 py-2">Update Password</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function prepReset(email) {
        document.getElementById('resetUserId').value = email;
    }
</script>

<%@include file="../includes/footer.jsp" %>