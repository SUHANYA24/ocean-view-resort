<%@include file="includes/header.jsp" %>

<section class="py-5 bg-light" style="min-height: 80vh; display: flex; align-items: center;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card border-0 shadow-lg rounded-4">
                    <div class="card-body p-5">
                        <div class="text-center mb-4">
                            <i class="fa-solid fa-circle-user fa-3x text-primary mb-2"></i>
                            <h2 class="fw-bold">Welcome Back</h2>
                            <p class="text-muted">Login to manage your reservations</p>
                        </div>
                        
                        <% if(request.getParameter("msg") != null) { %>
                            <div class="alert alert-warning border-0 small">
                                <i class="fa-solid fa-circle-info me-2"></i> <%= request.getParameter("msg") %>
                            </div>
                        <% } %>

                        <form action="LoginServlet" method="POST">
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Username</label>
                                <input type="text" name="username" class="form-control p-3" placeholder="Enter username" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Password</label>
                                <input type="password" name="password" class="form-control p-3" placeholder="????????" required>
                            </div>
                            <div class="mb-4">
                                <label class="form-label fw-semibold">I am a...</label>
                                <select name="role" class="form-select p-3">
                                    <option value="CUSTOMER">Guest / Customer</option>
                                    <option value="STAFF">Hotel Staff</option>
                                    <option value="ADMIN">System Administrator</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary w-100 py-3 fw-bold rounded-3">Sign In</button>
                        </form>
                        
                        <div class="text-center mt-4">
                            <p class="small text-muted">Don't have an account? <a href="register.jsp" class="text-primary fw-bold">Register here</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="includes/footer.jsp" %>