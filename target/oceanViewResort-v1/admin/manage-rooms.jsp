<%@include file="../includes/header_admin.jsp" %>

<main class="container py-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0 text-dark">Room Management</h2>
            <p class="text-muted">Configure room categories, pricing, and physical unit inventory.</p>
        </div>
        <div class="d-flex gap-2">
            <button class="btn btn-outline-primary rounded-pill shadow-sm" data-bs-toggle="modal" data-bs-target="#addTypeModal">
                <i class="fa-solid fa-tags me-2"></i>Manage Categories
            </button>
            <button class="btn btn-primary rounded-pill shadow-sm px-4" data-bs-toggle="modal" data-bs-target="#addRoomModal">
                <i class="fa-solid fa-plus me-2"></i>Add New Room
            </button>
        </div>
    </div>

    <h5 class="fw-bold mb-3"><i class="fa-solid fa-layer-group me-2 text-primary"></i>Active Categories & Rates</h5>
    <div class="row g-3 mb-5">
        <%
                        List<RoomType> types = (List<RoomType>)request.getAttribute("types");
                        for(RoomType t : types){
        %>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <div class="bg-primary bg-opacity-10 p-3 rounded-3">
                            <i class="fa-solid fa-bed text-primary fa-lg"></i>
                        </div>
                        <button class="btn btn-sm btn-light border-0" 
                                onclick="populateTypeModal('1', 'Standard Garden', '80.00')" 
                                data-bs-toggle="modal" data-bs-target="#editTypeModal">
                            <i class="fa-solid fa-ellipsis-v"></i>
                        </button>
                    </div>
                    <h6 class="fw-bold mb-1">Standard Garden View</h6>
                    <h4 class="text-primary fw-bold mb-0">$80.00 <small class="text-muted fs-6">/ night</small></h4>
                </div>
            </div>
        </div>

        <%
        }
        %>
        <div class="col-md-4">
            <div class="card border-2 border-dashed h-100 d-flex align-items-center justify-content-center bg-light" 
                 style="cursor: pointer; border-style: dashed !important;" data-bs-toggle="modal" data-bs-target="#addTypeModal">
                <div class="text-center p-4">
                    <i class="fa-solid fa-plus-circle text-muted fa-2x mb-2"></i>
                    <p class="text-muted mb-0 fw-medium">Add New Category</p>
                </div>
            </div>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-header bg-white py-3 border-bottom d-flex justify-content-between align-items-center">
            <h5 class="mb-0 fw-bold">Room Inventory (Physical Units)</h5>
            <div class="input-group input-group-sm w-25">
                <span class="input-group-text bg-light border-0"><i class="fa-solid fa-search"></i></span>
                <input type="text" class="form-control border-0 bg-light" placeholder="Search Room #...">
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="bg-light text-muted small text-uppercase">
                    <tr>
                        <th class="ps-4">Room Number</th>
                        <th>Category</th>
                        <th>Status</th>
                        <th class="text-end pe-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Room> rooms = (List<Room>)request.getAttribute("rooms");
                        for(Room r : rooms){
                    %>

                    <tr>
                        <td class="ps-4 fw-bold"><%= r.getRoomNumber() %></td>
                        <td>
                            <span class="badge bg-primary bg-opacity-10 text-primary px-3">
                                <%= r.getRoomType().getRoomType() %>
                            </span>
                        </td>
                        <td><span class="badge bg-success text-white px-3">Active</span></td>
                        <td class="text-end pe-4">
                            <button class="btn btn-sm btn-outline-secondary border-0">
                                <i class="fa-solid fa-pen"></i>
                            </button>
                        </td>
                    </tr>

                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="addTypeModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow">
            <div class="modal-header border-0">
                <h5 class="modal-title fw-bold">Add Room Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="RoomTypeServlet" method="POST">
                <div class="modal-body py-0">
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Category Name</label>
                        <input type="text" name="typeName" class="form-control" placeholder="e.g. Executive Suite" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Nightly Rate ($)</label>
                        <input type="number" name="rate" class="form-control" placeholder="0.00" step="0.01" required>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary px-4">Create Category</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="editTypeModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title fw-bold">Edit Category</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <form action="RoomTypeServlet" method="POST">
                <input type="hidden" name="action" value="update">
                <input type="hidden" id="editTypeId" name="typeId">
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Category Name</label>
                        <input type="text" id="editTypeName" name="typeName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Update Rate ($)</label>
                        <input type="number" id="editTypeRate" name="rate" class="form-control" step="0.01" required>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="submit" class="btn btn-success px-4">Update Category</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="addRoomModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow">
            <div class="modal-header">
                <h5 class="modal-title fw-bold">Register New Room</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="RoomServlet" method="POST">
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Room Number</label>
                            <input type="text" name="roomNumber" class="form-control" placeholder="e.g. 101" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Category</label>
                            <select name="typeId" class="form-select">
                                <option value="">Select Type</option>
                                <%
                                    for(RoomType t : types){
                                %>
                                <option value="<%= t.getRoomTypeId() %>"><%= t.getRoomType() %></option>
                                <% };%>
                            </select>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label fw-bold">Floor/Location</label>
                            <input type="text" name="floor" class="form-control" placeholder="Ground Floor, Block B">
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="submit" class="btn btn-primary w-100">Save Room Inventory</button>
                </div>
            </form>
        </div>
    </div>
</main>

<script>
    function populateTypeModal(id, name, rate) {
        document.getElementById('editTypeId').value = id;
        document.getElementById('editTypeName').value = name;
        document.getElementById('editTypeRate').value = rate;
    }

    function populateRoomModal(roomNum, typeId, floor, status) {
        // Logic for room editing can be added here similarly
    }
</script>

<%@include file="../includes/footer.jsp" %>