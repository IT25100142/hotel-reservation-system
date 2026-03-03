<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Terminate Staff</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-light">

<!-- UNIVERSAL NAVIGATION BUTTONS -->
<div class="position-fixed d-flex" style="top: 20px; left: 20px; z-index: 9999;">
    <button onclick="history.back()" class="btn btn-light shadow me-2 d-flex align-items-center" style="border-radius: 10px; font-weight: bold; border: 1px solid #dee2e6;">
        <i class="bi bi-arrow-left-circle-fill text-secondary me-2 fs-5"></i> Back
    </button>
    <a href="DashboardServlet" class="btn btn-dark shadow d-flex align-items-center" style="border-radius: 10px; font-weight: bold;">
        <i class="bi bi-house-door-fill text-warning me-2 fs-5"></i> Home
    </a>
</div>

<div class="container py-5 mt-4">
    <div class="card shadow p-4 mx-auto border-top border-danger border-4" style="max-width: 500px;">
        <div class="text-center mb-4">
            <i class="bi bi-person-dash-fill text-danger" style="font-size: 3rem;"></i>
            <h2 class="fw-bold mt-2 text-danger">Remove Staff Member</h2>
        </div>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success shadow-sm">Employee successfully removed from system.</div>
        <% } else if ("true".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger shadow-sm">Employee ID not found.</div>
        <% } %>

        <form action="DeleteStaffServlet" method="POST">
            <div class="mb-4">
                <label class="form-label fw-bold">Employee ID</label>
                <input type="text" name="employeeId" class="form-control border-danger" placeholder="EMP-..." required>
            </div>
            <button type="submit" class="btn btn-danger w-100 fw-bold shadow-sm" onclick="return confirm('Are you sure you want to terminate this employee record?');">Remove Employee</button>
        </form>
    </div>
</div>
</body>
</html>