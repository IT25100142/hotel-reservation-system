<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Remove Guest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-light">

<!-- UNIVERSAL NAVIGATION BUTTONS -->
<div class="position-fixed d-flex" style="top: 20px; left: 20px; z-index: 9999;">
    <button onclick="history.back()" class="btn btn-light shadow me-2 d-flex align-items-center" style="border-radius: 10px; font-weight: bold; border: 1px solid #dee2e6;">
        <i class="bi bi-arrow-left-circle-fill text-secondary me-2 fs-5"></i> Back
    </button>
    <a href="index.jsp" class="btn btn-dark shadow d-flex align-items-center" style="border-radius: 10px; font-weight: bold;">
        <i class="bi bi-house-door-fill text-warning me-2 fs-5"></i> Home
    </a>
</div>

<div class="container mt-5 pt-4">
    <div class="card shadow p-4 mx-auto border-top border-danger border-4" style="max-width: 500px;">
        <div class="text-center mb-4">
            <i class="bi bi-person-x-fill text-danger" style="font-size: 3rem;"></i>
            <h2 class="fw-bold mt-2 text-danger">Remove Guest</h2>
            <p class="text-muted small">Permanently delete a guest's profile from the system.</p>
        </div>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success"><i class="bi bi-check-circle-fill me-2"></i>Guest profile successfully deleted!</div>
        <% } else if ("true".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger"><i class="bi bi-exclamation-triangle-fill me-2"></i>Error: Guest ID not found.</div>
        <% } %>

        <form action="DeleteGuestServlet" method="POST">
            <div class="mb-4">
                <label class="form-label fw-bold">Enter Guest ID to Delete:</label>
                <div class="input-group">
                    <span class="input-group-text bg-danger text-white"><i class="bi bi-person-dash"></i></span>
                    <input type="text" name="id" class="form-control border-danger" placeholder="E.g., G101" required>
                </div>
            </div>

            <button type="submit" class="btn btn-danger w-100 fw-bold shadow-sm" onclick="return confirm('Are you absolutely sure you want to delete this guest profile?');">
                <i class="bi bi-trash3-fill me-2"></i>Delete Profile
            </button>
        </form>

        <!-- STYLED BUTTON MENU -->
        <div class="d-flex flex-wrap justify-content-center gap-2 mt-4 pt-4 border-top">
            <a href="guestRegistration.jsp" class="btn btn-outline-primary shadow-sm fw-bold"><i class="bi bi-person-plus-fill me-1"></i>Register</a>
            <a href="viewGuestProfile.jsp" class="btn btn-outline-info shadow-sm fw-bold"><i class="bi bi-search me-1"></i>Search</a>
            <a href="editGuest.jsp" class="btn btn-outline-warning shadow-sm fw-bold text-dark"><i class="bi bi-pencil-square me-1"></i>Edit</a>
            <a href="ListGuestsServlet" class="btn btn-outline-success shadow-sm fw-bold"><i class="bi bi-list-columns-reverse me-1"></i>Guest List</a>
        </div>
    </div>
</div>
</body>
</html>