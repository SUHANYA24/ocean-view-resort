<%@include file="../includes/header_admin.jsp" %>
<div class="card border-0 shadow-sm mt-4">
    <div class="card-body">
        <h5 class="fw-bold mb-4">Room Management</h5>
        <div class="row g-3">
            <div class="col-md-6">
                <div class="d-flex align-items-center p-3 border rounded-3 bg-white">
                    <img src="https://via.placeholder.com/60" class="rounded me-3">
                    <div class="flex-grow-1">
                        <h6 class="mb-0 fw-bold">Standard Garden View</h6>
                        <small class="text-muted">Current Rate: $80/night</small>
                    </div>
                    <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editPriceModal">Edit</button>
                </div>
            </div>
            <div class="col-md-6">
                <div class="d-flex align-items-center p-3 border border-dashed rounded-3 bg-light justify-content-center h-100" style="cursor:pointer;">
                    <span class="text-muted"><i class="fa-solid fa-plus-circle me-1"></i> Add New Category</span>
                </div>
            </div>
        </div>
    </div>
</div>