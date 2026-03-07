<%@include file="includes/header.jsp" %>
<div class="container py-5 mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card border-0 shadow p-4">
                <h3 class="fw-bold mb-4">Create Your Account</h3>

                <%-- Show error if exists --%>
                <% if(request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger mb-3">
                        <i class="fa-solid fa-circle-exclamation me-2"></i>
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <form action="register" method="POST" class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">First Name</label>
                        <input type="text" name="firstName" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Last Name</label>
                        <input type="text" name="lastName" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Email/Username</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label">Address</label>
                        <input type="text" name="address" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Phone Number</label>
                        <input type="text" name="phone" class="form-control" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <input type="hidden" value="GUEST" name="role">
                    <div class="col-12 mt-4">
                        <button type="submit" class="btn btn-primary w-100">Create Account</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>