<%@include file="../includes/header_staff.jsp" %>

<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0 text-dark">Housekeeping & Room Status</h2>
            <p class="text-muted">Monitor and update room readiness for arriving guests.</p>
        </div>
        <div class="d-flex gap-2">
            <button class="btn btn-outline-secondary btn-sm rounded-pill" onclick="window.location.reload();">
                <i class="fa-solid fa-rotate me-1"></i> Refresh Grid
            </button>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-4 mb-4">
        <div class="card-body py-2 px-4 d-flex justify-content-center gap-4 flex-wrap">
            <div class="d-flex align-items-center small fw-bold">
                <span class="badge bg-success me-2">&nbsp;</span> Available / Clean
            </div>
            <div class="d-flex align-items-center small fw-bold">
                <span class="badge bg-danger me-2">&nbsp;</span> Occupied
            </div>
            <div class="d-flex align-items-center small fw-bold">
                <span class="badge bg-warning me-2">&nbsp;</span> Dirty / Pending
            </div>
            <div class="d-flex align-items-center small fw-bold">
                <span class="badge bg-dark me-2">&nbsp;</span> Out of Order
            </div>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-6 col-md-4 col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 text-center p-3 border-top border-success border-5 h-100">
                <h3 class="fw-bold mb-1">101</h3>
                <p class="text-muted small mb-2">Standard Garden</p>
                <span class="badge bg-success-subtle text-success rounded-pill mb-3">Available</span>
                <div class="mt-auto">
                    <button class="btn btn-sm btn-light w-100 border" onclick="updateStatus('101', 'Available')" data-bs-toggle="modal" data-bs-target="#statusModal">
                        Change Status
                    </button>
                </div>
            </div>
        </div>

        <div class="col-6 col-md-4 col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 text-center p-3 border-top border-warning border-5 h-100">
                <h3 class="fw-bold mb-1">102</h3>
                <p class="text-muted small mb-2">Standard Garden</p>
                <span class="badge bg-warning-subtle text-warning rounded-pill mb-3">Dirty</span>
                <div class="mt-auto">
                    <button class="btn btn-sm btn-light w-100 border" onclick="updateStatus('102', 'Dirty')" data-bs-toggle="modal" data-bs-target="#statusModal">
                        Change Status
                    </button>
                </div>
            </div>
        </div>

        <div class="col-6 col-md-4 col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 text-center p-3 border-top border-danger border-5 h-100">
                <h3 class="fw-bold mb-1">204</h3>
                <p class="text-muted small mb-2">Deluxe Ocean</p>
                <span class="badge bg-danger-subtle text-danger rounded-pill mb-3">Occupied</span>
                <div class="mt-auto">
                    <button class="btn btn-sm btn-light w-100 border" onclick="updateStatus('204', 'Occupied')" data-bs-toggle="modal" data-bs-target="#statusModal">
                        Change Status
                    </button>
                </div>
            </div>
        </div>

        </div>
</div>

<div class="modal fade" id="statusModal" tabindex="-1">
    <div class="modal-dialog modal-sm modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header border-0 pb-0">
                <h6 class="modal-title fw-bold">Room <span id="modalRoomNum"></span> Update</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="RoomStatusServlet" method="POST">
                <input type="hidden" name="roomNumber" id="hiddenRoomNum">
                <div class="modal-body p-4 text-center">
                    <label class="form-label d-block text-muted small mb-3">Select Current State:</label>
                    <div class="d-grid gap-2">
                        <input type="radio" class="btn-check" name="newStatus" id="stat1" value="Available" checked>
                        <label class="btn btn-outline-success rounded-pill" for="stat1">Available (Clean)</label>

                        <input type="radio" class="btn-check" name="newStatus" id="stat2" value="Dirty">
                        <label class="btn btn-outline-warning rounded-pill" for="stat2">Dirty (Pending)</label>

                        <input type="radio" class="btn-check" name="newStatus" id="stat3" value="Occupied">
                        <label class="btn btn-outline-danger rounded-pill" for="stat3">Occupied</label>

                        <input type="radio" class="btn-check" name="newStatus" id="stat4" value="Maintenance">
                        <label class="btn btn-outline-dark rounded-pill" for="stat4">Maintenance</label>
                    </div>
                </div>
                <div class="modal-footer border-0 p-3">
                    <button type="submit" class="btn btn-primary w-100 py-2">Confirm Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function updateStatus(roomNum, currentStatus) {
        document.getElementById('modalRoomNum').innerText = roomNum;
        document.getElementById('hiddenRoomNum').value = roomNum;
        // Logic to pre-select the radio button based on currentStatus can be added here
    }
</script>

<%@include file="../includes/footer.jsp" %>