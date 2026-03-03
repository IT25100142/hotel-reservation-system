<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Dynamically figure out where the "Home" button should go!
    String userRole = (String) session.getAttribute("role");
    String homeUrl = "GUEST".equals(userRole) ? "guestDashboard.jsp" : "DashboardServlet";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Submit Feedback</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background: url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed; background-size: cover; }
        .overlay { background-color: rgba(255, 255, 255, 0.9); border-radius: 15px; box-shadow: 0 15px 35px rgba(0,0,0,0.1); backdrop-filter: blur(10px); }
        .star-rating { direction: rtl; display: inline-block; }
        .star-rating input[type=radio] { display: none; }
        .star-rating label { color: #ccc; font-size: 2rem; padding: 0; cursor: pointer; display: inline-block; transition: color 0.2s; }
        .star-rating label:hover, .star-rating label:hover ~ label, .star-rating input[type=radio]:checked ~ label { color: #ffc107; }
    </style>
    <script>
        function toggleIdentity() {
            const type = document.getElementById("reviewType").value;
            const verifiedDiv = document.getElementById("verifiedFields");
            const anonDiv = document.getElementById("anonymousFields");

            if (type === "Verified") {
                verifiedDiv.style.display = "block"; anonDiv.style.display = "none";
            } else {
                verifiedDiv.style.display = "none"; anonDiv.style.display = "block";
            }
        }
    </script>
</head>
<body>

<!-- UNIVERSAL NAVIGATION BUTTONS -->
<div class="position-fixed d-flex" style="top: 20px; left: 20px; z-index: 9999;">
    <button onclick="history.back()" class="btn btn-light shadow me-2 d-flex align-items-center" style="border-radius: 10px; font-weight: bold; border: 1px solid #dee2e6;">
        <i class="bi bi-arrow-left-circle-fill text-secondary me-2 fs-5"></i> Back
    </button>
    <a href="<%= homeUrl %>" class="btn btn-dark shadow d-flex align-items-center" style="border-radius: 10px; font-weight: bold;">
        <i class="bi bi-house-door-fill text-warning me-2 fs-5"></i> Home
    </a>
</div>

<div class="container py-5 mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card overlay p-5 border-0">
                <div class="text-center mb-4">
                    <h2 class="fw-bold text-dark mb-1">Rate Your Experience</h2>
                    <p class="text-muted">Your feedback helps us improve our hotel services.</p>
                </div>

                <% if ("true".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success d-flex align-items-center border-0 shadow-sm"><i class="bi bi-balloon-heart-fill fs-4 me-3 text-success"></i><div>Thank you! Your review has been submitted successfully.</div></div>
                <% } %>

                <form action="SubmitReviewServlet" method="POST">
                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold text-secondary">Room ID Stayed In</label>
                            <input type="text" name="roomId" class="form-control" placeholder="E.g., 101" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold text-secondary">Review Type</label>
                            <select id="reviewType" name="reviewType" class="form-select" onchange="toggleIdentity()" required>
                                <option value="Verified">Public (Show Name)</option>
                                <option value="Anonymous">Anonymous (Hide Name)</option>
                            </select>
                        </div>
                    </div>

                    <div id="verifiedFields" class="mb-3">
                        <label class="form-label fw-bold text-secondary">Your Name</label>
                        <!-- Auto-fills the logged in guest's email/name -->
                        <input type="text" name="guestName" class="form-control" value="<%= session.getAttribute("username") != null ? session.getAttribute("username") : "" %>">
                    </div>

                    <div id="anonymousFields" class="mb-3" style="display: none;">
                        <label class="form-label fw-bold text-secondary">Purpose of Stay</label>
                        <select name="stayPurpose" class="form-select">
                            <option value="Leisure">Leisure / Vacation</option>
                            <option value="Business">Business Trip</option>
                        </select>
                    </div>

                    <div class="mb-3 text-center">
                        <label class="form-label fw-bold text-secondary d-block">Overall Rating</label>
                        <div class="star-rating">
                            <input type="radio" id="5-stars" name="rating" value="5" required />
                            <label for="5-stars" class="bi bi-star-fill"></label>
                            <input type="radio" id="4-stars" name="rating" value="4" />
                            <label for="4-stars" class="bi bi-star-fill"></label>
                            <input type="radio" id="3-stars" name="rating" value="3" />
                            <label for="3-stars" class="bi bi-star-fill"></label>
                            <input type="radio" id="2-stars" name="rating" value="2" />
                            <label for="2-stars" class="bi bi-star-fill"></label>
                            <input type="radio" id="1-star" name="rating" value="1" />
                            <label for="1-star" class="bi bi-star-fill"></label>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-secondary">Comments</label>
                        <textarea name="comments" class="form-control" rows="4" placeholder="Tell us what you loved about your stay..." required></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary btn-lg w-100 fw-bold shadow">
                        <i class="bi bi-send-fill me-2"></i>Post Review
                    </button>
                </form>

                <div class="text-center mt-4 pt-3 border-top">
                    <!-- EVERYONE CAN READ REVIEWS -->
                    <a href="ViewReviewsServlet" class="text-decoration-none text-secondary me-3"><i class="bi bi-card-list me-1"></i>Read Reviews</a>

                    <!-- ONLY ADMINS CAN SEE MODERATION LINK -->
                    <% if (!"GUEST".equals(userRole)) { %>
                    <a href="moderateReviews.jsp" class="text-decoration-none text-danger"><i class="bi bi-shield-lock me-1"></i>Admin Moderation</a>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>