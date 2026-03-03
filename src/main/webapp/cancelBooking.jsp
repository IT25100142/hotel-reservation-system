<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cancel Reservation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body style="background-color: #fafafa;">
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
        <div class="col-md-6">
            <div class="card shadow border-0 rounded-4 p-5">

                <div class="text-center mb-4">
                    <i class="bi bi-x-octagon-fill text-danger" style="font-size: 3rem;"></i>
                    <h2 class="fw-bold mt-2">Cancel Reservation</h2>
                    <p class="text-muted">Enter your Booking ID to release your room.</p>
                </div>

                <% if ("true".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success border-0 shadow-sm"><i class="bi bi-check-lg me-2"></i>Reservation has been successfully cancelled.</div>
                <% } else if ("true".equals(request.getParameter("error"))) { %>
                <div class="alert alert-danger border-0 shadow-sm"><i class="bi bi-exclamation-circle me-2"></i>Error: Booking ID not found in system.</div>
                <% } %>

                <form action="CancelReservationServlet" method="POST">
                    <div class="form-floating mb-4">
                        <input type="text" name="bookingId" class="form-control border-danger border-2" id="floatingInput" placeholder="BKG-1234" required>
                        <label for="floatingInput" class="text-danger fw-bold"><i class="bi bi-upc-scan me-2"></i>Booking ID</label>
                    </div>

                    <div class="alert alert-warning border-0 small">
                        <i class="bi bi-info-circle-fill me-2"></i><strong>Warning:</strong> Cancellations are permanent. If you cancel a Corporate booking, cancellation fees may apply to your organization.
                    </div>

                    <button type="submit" class="btn btn-danger btn-lg w-100 fw-bold shadow" onclick="return confirm('WARNING: Are you absolutely sure you want to cancel this booking? This action cannot be undone.');">
                        <i class="bi bi-trash3-fill me-2"></i>Confirm Cancellation
                    </button>
                </form>

                <div class="text-center mt-4">
                    <a href="makeReservation.jsp" class="text-decoration-none text-secondary"><i class="bi bi-arrow-left me-1"></i>Return to Booking Page</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>