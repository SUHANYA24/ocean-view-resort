<div class="modal fade" id="editPriceModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title fw-bold"><i class="fa-solid fa-pen-to-square me-2"></i>Update Room Details</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <form action="RoomServlet" method="POST">
                <div class="modal-body p-4">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="roomId" id="editRoomId">
                    
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Room Name</label>
                        <input type="text" id="editRoomName" name="roomName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Current Rate ($)</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <input type="number" id="editRoomRate" name="rate" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input" type="checkbox" id="roomStatus" name="isActive" checked>
                        <label class="form-check-label" for="roomStatus">Room is Available for Booking</label>
                    </div>
                </div>
                <div class="modal-footer bg-light border-0">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success px-4">Update Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>