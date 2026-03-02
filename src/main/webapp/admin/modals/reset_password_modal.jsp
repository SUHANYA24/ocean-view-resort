<div class="modal fade" id="resetPasswordModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title">Reset User Password</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to reset the password for <strong>John Staff</strong>? A temporary password will be sent to the registered email.</p>
            </div>
            <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                <form action="UserServlet" method="POST">
                    <input type="hidden" name="action" value="reset_password">
                    <input type="hidden" name="userId" value="123">
                    <button type="submit" class="btn btn-warning">Confirm Reset</button>
                </form>
            </div>
        </div>
    </div>
</div>