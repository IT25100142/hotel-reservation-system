<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register Guest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script>
        function toggleVIPPoints() {
            const type = document.getElementById("type").value;
            const pointsDiv = document.getElementById("pointsDiv");
            if (type === "VIP") {
                pointsDiv.style.display = "block";
            } else {
                pointsDiv.style.display = "none";
            }
        }
    </script>
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
    <div class="card shadow p-4 mx-auto border-top border-primary border-4" style="max-width: 600px;">
        <div class="text-center mb-4">
            <i class="bi bi-person-badge text-primary" style="font-size: 3rem;"></i>
            <h2 class="fw-bold mt-2 text-primary">Register New Guest</h2>
        </div>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success"><i class="bi bi-check-circle-fill me-2"></i>Guest successfully registered!</div>
        <% } %>

        <form action="RegisterGuestServlet" method="POST">
            <div class="mb-3">
                <label class="form-label fw-bold">Guest ID (e.g., G101):</label>
                <input type="text" name="id" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Full Name:</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Email Address:</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Phone Number:</label>
                <input type="text" name="phone" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Guest Type:</label>
                <select id="type" name="type" class="form-select border-primary" onchange="toggleVIPPoints()" required>
                    <option value="Regular">Regular Guest</option>
                    <option value="VIP">VIP Guest</option>
                </select>
            </div>
            <div class="mb-4 bg-light p-3 rounded border" id="pointsDiv" style="display: none;">
                <label class="form-label fw-bold text-warning"><i class="bi bi-star-fill me-1"></i>Initial Loyalty Points:</label>
                <input type="number" name="points" class="form-control border-warning" value="0">
            </div>
            <button type="submit" class="btn btn-primary btn-lg w-100 fw-bold shadow-sm">
                <i class="bi bi-person-check-fill me-2"></i>Register Guest
            </button>
        </form>

        <!-- STYLED BUTTON MENU -->
        <div class="d-flex flex-wrap justify-content-center gap-2 mt-4 pt-4 border-top">
            <a href="viewGuestProfile.jsp" class="btn btn-outline-info shadow-sm fw-bold"><i class="bi bi-search me-1"></i>Search</a>
            <a href="editGuest.jsp" class="btn btn-outline-warning shadow-sm fw-bold text-dark"><i class="bi bi-pencil-square me-1"></i>Edit</a>
            <a href="removeGuest.jsp" class="btn btn-outline-danger shadow-sm fw-bold"><i class="bi bi-person-x-fill me-1"></i>Delete</a>
            <a href="ListGuestsServlet" class="btn btn-outline-success shadow-sm fw-bold"><i class="bi bi-list-columns-reverse me-1"></i>Guest List</a>
        </div>
    </div>
</div>
</body>
</html>