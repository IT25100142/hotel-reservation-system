<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Remove Room</title>
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
    <div class="card shadow p-4 mx-auto border-danger" style="max-width: 500px;">
        <h2 class="mb-4 text-center text-danger">Remove a Room</h2>
        <p class="text-center text-muted small">Warning: This action will permanently delete the room from the text file.</p>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success">Room successfully deleted from the system!</div>
        <% } else if ("true".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger">Error: Room ID not found. Deletion failed.</div>
        <% } %>

        <form action="DeleteRoomServlet" method="POST">
            <div class="mb-3">
                <label class="form-label fw-bold">Enter Room ID to Delete:</label>
                <input type="text" name="roomId" class="form-control border-danger" placeholder="E.g., 101" required>
            </div>

            <button type="submit" class="btn btn-danger w-100 fw-bold" onclick="return confirm('Are you absolutely sure you want to delete this room?');">Delete Room</button>
        </form>

        <div class="text-center mt-3">
            <a href="addRoom.jsp" class="text-decoration-none">Back to Room Manager</a>
        </div>
    </div>
</div>
</body>
</html>