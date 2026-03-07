<%@include file="../includes/header_admin.jsp" %>
<%
List<RoomBooking> bookings = 
    (List<RoomBooking>) request.getAttribute("availablebookings");
%>
<main class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0 text-dark">Reservation Control</h2>
            <p class="text-muted">Retrieve guest records, manage check-ins, and generate final bills.</p>
        </div>
        <button class="btn btn-primary rounded-pill shadow-sm px-4" data-bs-toggle="modal" data-bs-target="#newBookingModal">
            <i class="fa-solid fa-calendar-plus me-2"></i>New Walk-in Booking
        </button>
    </div>

    <div class="card border-0 shadow-sm rounded-4 mb-4">
        <div class="card-body p-3">
            <form action="BookingServlet" method="GET" class="row g-2">
                <div class="col-md-5">
                    <div class="input-group">
                        <span class="input-group-text bg-transparent border-end-0 text-muted">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </span>
                        <input type="text" name="searchQuery" class="form-control border-start-0 ps-0" 
                               placeholder="Search by Reservation ID or Guest Name..." aria-label="Search">
                    </div>
                </div>
                <div class="col-md-3">
                    <select name="statusFilter" class="form-select">
                        <option value="">All Statuses</option>
                        <option value="Confirmed">Confirmed</option>
                        <option value="Checked-In">Checked-In</option>
                        <option value="Checked-Out">Checked-Out</option>
                        <option value="Cancelled">Cancelled</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <input type="date" name="filterDate" class="form-control">
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-dark w-100">Search Records</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="bg-light text-muted small text-uppercase">
                    <tr>
                        <th class="ps-4">Res ID</th>
                        <th>Guest Details</th>
                        <th>Room</th>
                        <th>Stay Duration</th>
                        <th>Status</th>
                        <th class="text-end pe-4">Billing & Actions</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                    if(bookings != null){
                    for(RoomBooking b : bookings){
                    %>

                    <tr>
                        <td class="ps-4 fw-bold text-primary">
                            #BK-<%= b.getRoomBookingId() %>
                        </td>

                        <td>
                            <div class="fw-bold text-dark">
                                <%= b.getGuestName() %>
                            </div>
                            <small class="text-muted">
                                <%= b.getRoomBookingId() %>
                            </small>
                        </td>

                        <td>
                            <span class="d-block fw-medium">
                                Room <%= b.getRoomBookingId() %>
                            </span>
                        </td>

                        <td>
                            <div class="small fw-bold">
                                <%= b.getCheckIn() %> - <%= b.getCheckOut() %>
                            </div>
                        </td>

                        <td>
                            <span class="badge bg-success">Confirmed</span>
                        </td>

                        <td class="text-end pe-4">
                            <button class="btn btn-sm btn-outline-dark">
                                Bill
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

<div class="modal fade" id="billingModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content border-0 shadow-lg">
            <div id="printableInvoice">
                <div class="modal-header bg-dark text-white border-0">
                    <h5 class="modal-title fw-bold">Ocean View Resort - Invoice</h5>
                    <button type="button" class="btn-close btn-close-white d-print-none" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="d-flex justify-content-between mb-4">
                        <div>
                            <h6 class="text-muted small mb-0">BILL TO:</h6>
                            <h5 class="fw-bold" id="invGuestName">Guest Name</h5>
                        </div>
                        <div class="text-end">
                            <h6 class="text-muted small mb-0">RESERVATION:</h6>
                            <h5 class="fw-bold" id="invResId">#BK-0000</h5>
                        </div>
                    </div>

                    <table class="table table-sm border-top">
                        <thead class="bg-light">
                            <tr>
                                <th>Description</th>
                                <th class="text-center">Qty</th>
                                <th class="text-end">Rate</th>
                                <th class="text-end">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td id="invRoomType">Room Charges</td>
                                <td class="text-center" id="invNights">0</td>
                                <td class="text-end" id="invRate">$0.00</td>
                                <td class="text-end fw-bold" id="invSubtotal">$0.00</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="row mt-4">
                        <div class="col-7 text-muted small">
                            <p>Thank you for choosing Ocean View Resort. Please keep this invoice for your records.</p>
                        </div>
                        <div class="col-5">
                            <div class="d-flex justify-content-between border-top pt-2">
                                <span class="fw-bold">TOTAL:</span>
                                <h4 class="fw-bold text-primary mb-0" id="invGrandTotal">$0.00</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer border-0 bg-light d-print-none">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary px-4" onclick="window.print()">
                    <i class="fa-solid fa-print me-2"></i>Print Invoice
                </button>
            </div>
        </div>
    </div>
</div>
                    
                    <div class="modal fade" id="newBookingModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content border-0 shadow">
            <form action="${pageContext.request.contextPath}/admin/manage-bookings" method="POST">
                
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">New Walk-in Booking</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <div class="row g-3">

                        <div class="col-md-6">
                            <label class="form-label">Guest Name</label>
                            <input type="text" name="guestName" class="form-control" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Contact Number</label>
                            <input type="text" name="contact" class="form-control" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Room ID</label>
                            <input type="number" name="roomId" class="form-control" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Room Type</label>
                            <input type="text" name="roomType" class="form-control">
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Check-In</label>
                            <input type="date" name="checkIn" class="form-control" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Check-Out</label>
                            <input type="date" name="checkOut" class="form-control" required>
                        </div>

                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Create Booking</button>
                </div>

            </form>
        </div>
    </div>
</div>

<script>
    function generateInvoice(resId, name, room, nights, rate) {
        const total = (nights * rate).toFixed(2);
        document.getElementById('invResId').innerText = "#" + resId;
        document.getElementById('invGuestName').innerText = name;
        document.getElementById('invRoomType').innerText = room + " (Per Night)";
        document.getElementById('invNights').innerText = nights;
        document.getElementById('invRate').innerText = "$" + rate.toFixed(2);
        document.getElementById('invSubtotal').innerText = "$" + total;
        document.getElementById('invGrandTotal').innerText = "$" + total;
    }
</script>

<style>
    @media print {
        body * {
            visibility: hidden;
        }
        #printableInvoice, #printableInvoice * {
            visibility: visible;
        }
        #printableInvoice {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
        }
        .d-print-none {
            display: none !important;
        }
    }
</style>

<%@include file="../includes/footer.jsp" %>