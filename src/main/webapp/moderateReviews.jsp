<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Review Moderation (Admin)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body style="background-color: #fff5f5;">
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
        <div class="col-md-6 col-lg-5">
            <div class="card shadow-lg border-danger border-2 rounded-4 p-5">

                <div class="text-center mb-4">
                    <i class="bi bi-shield-lock-fill text-danger" style="font-size: 3.5rem;"></i>
                    <h2 class="fw-bold mt-2 text-danger">Admin Moderation</h2>
                    <p class="text-muted small">Remove inappropriate, spam, or abusive guest reviews from the public system.</p>
                </div>

                <% if ("true".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success border-0 shadow-sm"><i class="bi bi-check2-circle me-2"></i>Review successfully deleted from the system.</div>
                <% } else if ("true".equals(request.getParameter("error"))) { %>
                <div class="alert alert-danger border-0 shadow-sm"><i class="bi bi-exclamation-octagon me-2"></i>Error: Review ID not found.</div>
                <% } %>

                <form action="DeleteReviewServlet" method="POST">
                    <div class="form-floating mb-4">
                        <input type="text" name="reviewId" class="form-control" id="floatingId" placeholder="REV-12345" required>
                        <label for="floatingId" class="fw-bold"><i class="bi bi-tag-fill me-2"></i>Target Review ID</label>
                        <div class="form-text mt-2"><i class="bi bi-info-circle me-1"></i>Find the Review ID at the bottom right of the review cards on the public page.</div>
                    </div>

                    <button type="submit" class="btn btn-danger btn-lg w-100 fw-bold shadow" onclick="return confirm('Admin Action: Are you sure you want to permanently delete this review? This action cannot be reversed.');">
                        <i class="bi bi-trash3-fill me-2"></i>Delete Review
                    </button>
                </form>

                <div class="text-center mt-4">
                    <a href="ViewReviewsServlet" class="btn btn-link text-decoration-none text-muted">Cancel & Return to Public Reviews</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>