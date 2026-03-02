<%@include file="../includes/header_staff.jsp" %>

<main class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0 text-dark">Reception Desk</h2>
            <p class="text-muted small">Search reservations, manage guest arrivals, and process check-outs.</p>
        </div>
        <div class="btn-group">
            <button class="btn btn-info text-white shadow-sm px-4" data-bs-toggle="modal" data-bs-target="#newBookingModal">
                <i class="fa-solid fa-plus me-2"></i>New Reservation
            </button>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-4 mb-4">
        <div class="card-body p-3">
            <form action="SearchServlet" method="GET" class="row g-2">
                <div class="col-md-7">
                    <div class="input-group">
                        <span class="input-group-text bg-light border-0"><i class="fa-solid fa-search"></i></span>
                        <input type="text" name="query" class="form-control border-0 bg-light" 
                               placeholder="Find Guest by Name, Email, or Res ID #...">
                    </div>
                </div>
                <div class="col-md-3">
                    <select class="form-select border-0 bg-light">
                        <option value="">Expected Today</option>
                        <option value="">Currently In-House</option>
                        <option value="">Departing Today</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-dark w-100">Find Records</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="bg-light text-muted small text-uppercase">
                    <tr>
                        <th class="ps-4">Status</th>
                        <th>Res ID</th>
                        <th>Guest</th>
                        <th>Room</th>
                        <th>Dates</th>
                        <th class="text-end pe-4">Front Desk Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="ps-4">
                            <span class="badge bg-warning text-dark rounded-pill px-3">Pending Arrival</span>
                        </td>
                        <td class="fw-bold text-muted">#BK-8810</td>
                        <td>
                            <div class="fw-bold">Kasun Perera</div>
                            <small class="text-muted">+94 71 000 0000</small>
                        </td>
                        <td><span class="badge bg-light text-dark border">Room 302</span></td>
                        <td><small>Mar 02 - Mar 04</small></td>
                        <td class="text-end pe-4">
                            <button class="btn btn-sm btn-success px-3 me-1">Check In</button>
                            <button class="btn btn-sm btn-light border" onclick="viewDetails('BK-8810')"><i class="fa-solid fa-eye"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td class="ps-4">
                            <span class="badge bg-success-subtle text-success rounded-pill px-3">In-House</span>
                        </td>
                        <td class="fw-bold text-muted">#BK-8805</td>
                        <td>
                            <div class="fw-bold">Sarah Jenkins</div>
                            <small class="text-muted">sarah.j@email.com</small>
                        </td>
                        <td><span class="badge bg-light text-dark border">Room 105</span></td>
                        <td><small>Feb 28 - Mar 03</small></td>
                        <td class="text-end pe-4">
                            <button class="btn btn-sm btn-primary me-1" 
                                    onclick="prepBill('BK-8805', 'Sarah Jenkins', 'Deluxe', 3, 150.00)" 
                                    data-bs-toggle="modal" data-bs-target="#staffBillModal">
                                <i class="fa-solid fa-print me-1"></i> Print Bill
                            </button>
                            <button class="btn btn-sm btn-outline-danger">Check Out</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</main>

<div class="modal fade" id="staffBillModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content border-0 shadow-lg">
            <div id="printableArea">
                <div class="modal-header bg-info text-white border-0">
                    <h5 class="modal-title fw-bold">Ocean View Resort - Bill</h5>
                    <button type="button" class="btn-close btn-close-white d-print-none" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="row mb-4">
                        <div class="col-6">
                            <small class="text-muted d-block text-uppercase">Guest Name</small>
                            <h6 class="fw-bold" id="billGuestName">Guest Name</h6>
                        </div>
                        <div class="col-6 text-end">
                            <small class="text-muted d-block text-uppercase">Res ID</small>
                            <h6 class="fw-bold" id="billResId">#0000</h6>
                        </div>
                    </div>
                    <table class="table table-sm border-top">
                        <thead class="bg-light">
                            <tr>
                                <th>Item</th>
                                <th class="text-end">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td id="billDesc">Room Charges</td>
                                <td class="text-end fw-bold" id="billTotal">$0.00</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer border-0 d-print-none">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-info text-white px-4" onclick="window.print()">
                    <i class="fa-solid fa-print me-2"></i>Print Final Bill
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    function prepBill(id, name, type, nights, rate) {
        document.getElementById('billResId').innerText = "#" + id;
        document.getElementById('billGuestName').innerText = name;
        document.getElementById('billDesc').innerText = type + " Room (" + nights + " Nights)";
        document.getElementById('billTotal').innerText = "$" + (nights * rate).toFixed(2);
    }
</script>

<style>
    @media print {
        body * { visibility: hidden; }
        #printableArea, #printableArea * { visibility: visible; }
        #printableArea { position: absolute; left: 0; top: 0; width: 100%; }
    }
</style>

<%@include file="../includes/footer.jsp" %>