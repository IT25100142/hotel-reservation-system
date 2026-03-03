<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add New Room</title>
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
    <div class="card shadow-sm p-4 mx-auto border-top border-primary border-4" style="max-width: 500px;">
        <div class="text-center mb-4">
            <i class="bi bi-door-open text-primary" style="font-size: 3rem;"></i>
            <h2 class="fw-bold mt-2">Add Hotel Room</h2>
        </div>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success"><i class="bi bi-check-circle-fill me-2"></i>Room successfully added to system!</div>
        <% } %>

        <form action="AddRoomServlet" method="POST">
            <div class="mb-3">
                <label class="form-label fw-bold">Room ID (e.g., 101):</label>
                <input type="text" name="roomId" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Base Rate per Night ($):</label>
                <input type="number" step="0.01" name="baseRate" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Room Type:</label>
                <select name="roomType" class="form-select" required>
                    <option value="Standard">Standard</option>
                    <option value="Deluxe">Deluxe (New!)</option>
                    <option value="Suite">Suite</option>
                </select>
            </div>

            <div class="mb-4 form-check bg-light p-3 rounded border">
                <input type="checkbox" name="hasFeature" class="form-check-input ms-1" value="true">
                <label class="form-check-label ms-2 text-muted fw-bold">
                    Has the special feature? <br>
                    <small class="fw-normal">(Standard = Single Bed | Deluxe = Balcony | Suite = Kitchen)</small>
                </label>
            </div>

            <button type="submit" class="btn btn-primary w-100 fw-bold shadow-sm">
                <i class="bi bi-plus-lg me-2"></i>Save Room
            </button>
        </form>

        <div class="text-center mt-4 pt-3 border-top">
            <a href="SearchRoomServlet" class="text-decoration-none text-success me-3"><i class="bi bi-search me-1"></i>View Inventory</a>
            <a href="removeRoom.jsp" class="text-decoration-none text-danger"><i class="bi bi-trash me-1"></i>Remove Room</a>
        </div>
        <div class="d-flex flex-wrap justify-content-center gap-2 mt-4 pt-4 border-top">
            <a href="SearchRoomServlet" class="btn btn-outline-info shadow-sm fw-bold text-dark"><i class="bi bi-search me-1"></i>View Inventory</a>
            <a href="editRoom.jsp" class="btn btn-outline-warning shadow-sm fw-bold text-dark"><i class="bi bi-pencil-square me-1"></i>Edit Room</a>
            <a href="removeRoom.jsp" class="btn btn-outline-danger shadow-sm fw-bold"><i class="bi bi-trash me-1"></i>Delete Room</a>
        </div>
    </div>
</div>
</body>
</html>