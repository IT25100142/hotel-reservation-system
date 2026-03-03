<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Staff Onboarding</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background-color: #2c3e50; color: #fff; }
        .admin-card { background: #34495e; border: none; border-radius: 12px; box-shadow: 0 8px 24px rgba(0,0,0,0.2); }
        .form-control, .form-select { background-color: #2c3e50; border: 1px solid #455a64; color: #fff; }
        .form-control:focus, .form-select:focus { background-color: #2c3e50; color: #fff; border-color: #1abc9c; box-shadow: 0 0 0 0.25rem rgba(26, 188, 156, 0.25); }
    </style>
    <script>
        function toggleRoleFields() {
            const role = document.getElementById("role").value;
            const managerDiv = document.getElementById("managerFields");
            const houseDiv = document.getElementById("housekeeperFields");

            if (role === "Manager") {
                managerDiv.style.display = "block";
                houseDiv.style.display = "none";
            } else {
                managerDiv.style.display = "none";
                houseDiv.style.display = "block";
            }
        }
    </script>
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
        <div class="col-md-7">
            <div class="card admin-card p-4 p-md-5">
                <div class="text-center mb-4">
                    <i class="bi bi-person-badge-fill" style="font-size: 3rem; color: #1abc9c;"></i>
                    <h2 class="fw-bold mt-2">New Employee Onboarding</h2>
                    <p class="text-light opacity-75">Register a new staff member to the hotel system.</p>
                </div>

                <% if ("true".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success bg-success text-white border-0"><i class="bi bi-check-circle me-2"></i>Employee successfully registered!</div>
                <% } %>

                <form action="RegisterStaffServlet" method="POST">
                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label class="form-label text-info small text-uppercase fw-bold">Employee ID</label>
                            <input type="text" name="employeeId" class="form-control" placeholder="E.g., EMP-001" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-info small text-uppercase fw-bold">Full Name</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                    </div>

                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label class="form-label text-info small text-uppercase fw-bold">Phone Number</label>
                            <input type="text" name="phone" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-info small text-uppercase fw-bold">Base Salary ($)</label>
                            <input type="number" step="0.01" name="salary" class="form-control" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label text-info small text-uppercase fw-bold">Assign Role</label>
                        <select id="role" name="role" class="form-select" onchange="toggleRoleFields()" required>
                            <option value="Housekeeper">Housekeeping Staff</option>
                            <option value="Manager">Department Manager</option>
                        </select>
                    </div>

                    <div id="housekeeperFields" class="mb-4 p-3 rounded" style="background: rgba(0,0,0,0.1);">
                        <label class="form-label text-warning small text-uppercase fw-bold"><i class="bi bi-building me-2"></i>Assigned Floor</label>
                        <input type="number" name="assignedFloor" class="form-control" placeholder="E.g. 5" value="1">
                    </div>

                    <div id="managerFields" class="mb-4 p-3 rounded" style="background: rgba(0,0,0,0.1); display: none;">
                        <label class="form-label text-warning small text-uppercase fw-bold"><i class="bi bi-briefcase me-2"></i>Department</label>
                        <input type="text" name="department" class="form-control" placeholder="E.g. Front Desk, HR">
                    </div>

                    <button type="submit" class="btn btn-lg w-100 fw-bold border-0" style="background-color: #1abc9c; color: #fff;">
                        <i class="bi bi-person-plus-fill me-2"></i>Add to Staff Directory
                    </button>
                </form>

                <div class="text-center mt-4 pt-3 border-top border-secondary">
                    <a href="ViewStaffServlet" class="text-decoration-none text-light opacity-75 me-3"><i class="bi bi-people-fill me-1"></i>View Directory</a>
                    <a href="editStaff.jsp" class="text-decoration-none text-warning"><i class="bi bi-pencil-square me-1"></i>Edit Staff Info</a>
                </div>
            </div>
        </div>
        <div class="d-flex flex-wrap justify-content-center gap-2 mt-4 pt-4 border-top">
            <a href="ViewStaffServlet" class="btn btn-outline-info shadow-sm fw-bold text-dark"><i class="bi bi-people me-1"></i>Directory</a>
            <a href="editStaff.jsp" class="btn btn-outline-warning shadow-sm fw-bold text-dark"><i class="bi bi-pencil-square me-1"></i>Edit Staff</a>
            <a href="removeStaff.jsp" class="btn btn-outline-danger shadow-sm fw-bold"><i class="bi bi-person-x-fill me-1"></i>Terminate</a>
        </div>
    </div>
</div>
</body>
</html>