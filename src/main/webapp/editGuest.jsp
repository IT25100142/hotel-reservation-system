<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Guest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
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
<div class="container mt-5">
    <div class="card shadow p-4 mx-auto" style="max-width: 600px;">
        <h2 class="mb-4 text-center text-warning">Update Guest Contact Info</h2>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success">Guest contact details updated successfully!</div>
        <% } else if ("true".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger">Error: Guest ID not found. Update failed.</div>
        <% } %>

        <form action="UpdateGuestServlet" method="POST">
            <div class="mb-3">
                <label class="form-label fw-bold">Guest ID to Update:</label>
                <input type="text" name="id" class="form-control" placeholder="E.g., G101" required>
                <div class="form-text">You must enter the exact ID to modify their record.</div>
            </div>

            <hr>

            <div class="mb-3">
                <label class="form-label fw-bold">New Email Address:</label>
                <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">New Phone Number:</label>
                <input type="text" name="phone" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-warning w-100 fw-bold">Update Records</button>
        </form>

        <div class="text-center mt-3">
            <a href="guestRegistration.jsp" class="text-decoration-none">Back to Registration</a>
        </div>
    </div>
</div>
</body>
</html>