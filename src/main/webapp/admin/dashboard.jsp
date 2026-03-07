<%@include file="../includes/header_admin.jsp" %>
<%
List<RoomBooking> bookings = (List<RoomBooking>) request.getAttribute("availablebookings");
if (bookings != null) {
%>
    <p style="color:green;">Total Bookings: <%= bookings.size() %></p>
<%
} else {
%>
    <p style="color:red;">Bookings list is NULL</p>
<%
}
%>
<main class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0">Admin Overview</h2>
            <p class="text-muted">Welcome back! Here is what's happening today.</p>
        </div>
        <button class="btn btn-white shadow-sm border">
            <i class="fa-solid fa-download me-2"></i> Export Report
        </button>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-md-3">
            <div class="card border-0 shadow-sm p-3 border-top border-primary border-4">
                <div class="d-flex align-items-center">
                    <div class="bg-primary bg-opacity-10 p-3 rounded-3 me-3">
                        <i class="fa-solid fa-clipboard-list text-primary"></i>
                    </div>
                    <div>
                        <small class="text-muted fw-bold d-block text-uppercase">Reservations</small>
                        <h4 class="fw-bold mb-0">128</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm p-3 border-top border-success border-4">
                <div class="d-flex align-items-center">
                    <div class="bg-success bg-opacity-10 p-3 rounded-3 me-3">
                        <i class="fa-solid fa-dollar-sign text-success"></i>
                    </div>
                    <div>
                        <small class="text-muted fw-bold d-block text-uppercase">Revenue</small>
                        <h4 class="fw-bold mb-0">$12,450</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm p-3 border-top border-warning border-4">
                <div class="d-flex align-items-center">
                    <div class="bg-warning bg-opacity-10 p-3 rounded-3 me-3">
                        <i class="fa-solid fa-user-check text-warning"></i>
                    </div>
                    <div>
                        <small class="text-muted fw-bold d-block text-uppercase">Active Guests</small>
                        <h4 class="fw-bold mb-0">42</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm p-3 border-top border-info border-4">
                <div class="d-flex align-items-center">
                    <div class="bg-info bg-opacity-10 p-3 rounded-3 me-3">
                        <i class="fa-solid fa-door-open text-info"></i>
                    </div>
                    <div>
                        <small class="text-muted fw-bold d-block text-uppercase">Occupancy</small>
                        <h4 class="fw-bold mb-0">85%</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-header bg-white py-3 border-bottom d-flex justify-content-between align-items-center">
            <h5 class="mb-0 fw-bold">Recent Reservations</h5>
            <a href="add-reservation.jsp" class="btn btn-primary btn-sm rounded-pill px-3">
                <i class="fa-solid fa-plus me-1"></i> New Booking
            </a>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="ps-4">Res ID</th>
                            <th>Guest Name</th>
                            <th>Room Number</th>
                            <th>Check-In</th>
                            <th>Status</th>
                            <th class="text-end pe-4">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        if(bookings != null){
                            for(RoomBooking b : bookings){
                        %>

                        <tr>
                            <td class="ps-4 fw-bold">#OV-<%= b.getRoomBookingId() %></td>
                            <td><%= b.getGuestName() %></td>
                            <td>
                                <span class="badge bg-light text-dark border">
                                    <%= b.getRoom().getRoomNumber() %>
                                </span>
                            </td>
                            <td><%= b.getCheckIn() %></td>
                            <td><span class="badge bg-success">Confirmed</span></td>
                            <td class="text-end pe-4">
                                <button class="btn btn-sm btn-light border text-primary me-1">
                                    <i class="fa-solid fa-file-invoice"></i>
                                </button>
                                <button class="btn btn-sm btn-light border text-danger">
                                    <i class="fa-solid fa-trash"></i>
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
    </div>
</main>

<%@include file="../includes/footer.jsp" %>