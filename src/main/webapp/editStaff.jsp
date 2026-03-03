<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Staff Record</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background-color: #2c3e50; }
        .edit-box { background: white; border-radius: 12px; border-top: 5px solid #f39c12; }
    </style>
</head>
<body>
<!-- ========================================== -->
<!-- UNIVERSAL NAVIGATION BUTTONS -->
<!-- ========================================== -->
<div class="position-fixed d-flex" style="top: 20px; left: 20px; z-index: 9999;">
    <button onclick="history.back()" class="btn btn-light shadow me-2 d-flex align-items-center" style="border-radius: 10px; font-weight: bold; border: 1px solid #dee2e6;">
        <i class="bi bi-arrow-left-circle-fill text-secondary me-2 fs-5"></i> Back
    </button>
    <a href="index.jsp" class="btn btn-dark shadow d-flex align-items-center" style="border-radius: 10px; font-weight: bold;">
        <i class="bi bi-house-door-fill text-warning me-2 fs-5"></i> Home
    </a>
</div>
<!-- ========================================== -->
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow p-4 edit-box">
                <div class="text-center mb-4">
                    <i class="bi bi-pencil-square text-warning" style="font-size: 3rem;"></i>
                    <h3 class="fw-bold mt-2">Update Staff Profile</h3>
                    <p class="text-muted small">Modify contact information and salary for an existing employee.</p>
                </div>

                <% if ("true".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success border-0 shadow-sm"><i class="bi bi-check-lg me-2"></i>Profile updated successfully!</div>
                <% } else if ("true".equals(request.getParameter("error"))) { %>
                <div class="alert alert-danger border-0 shadow-sm"><i class="bi bi-x-circle me-2"></i>Employee ID not found.</div>
                <% } %>

                <form action="UpdateStaffServlet" method="POST">
                    <div class="mb-4">
                        <label class="form-label fw-bold text-dark">Target Employee ID</label>
                        <input type="text" name="employeeId" class="form-control border-warning" placeholder="E.g., EMP-001" required>
                    </div>

                    <hr class="text-muted mb-4">

                    <div class="mb-3">
                        <label class="form-label fw-bold text-secondary">New Phone Number</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                            <input type="text" name="phone" class="form-control" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-secondary">New Base Salary ($)</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                            <input type="number" step="0.01" name="salary" class="form-control" required>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-warning w-100 fw-bold shadow-sm">
                        <i class="bi bi-save me-2"></i>Save Changes
                    </button>
                </form>

                <div class="text-center mt-4">
                    <a href="staffRegistration.jsp" class="text-decoration-none text-secondary me-3">Cancel</a>
                    <a href="ViewStaffServlet" class="text-decoration-none text-info">View Directory</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>