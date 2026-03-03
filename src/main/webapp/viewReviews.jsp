<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%
    // Dynamically figure out where the "Home" button should go!
    String userRole = (String) session.getAttribute("role");
    String homeUrl = "GUEST".equals(userRole) ? "guestDashboard.jsp" : "DashboardServlet";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Guest Testimonials</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; }
        .review-card { border-radius: 15px; border: none; box-shadow: 0 4px 15px rgba(0,0,0,0.05); transition: 0.3s; }
        .review-card:hover { transform: translateY(-5px); box-shadow: 0 10px 25px rgba(0,0,0,0.1); }
        .stars { color: #ffc107; font-size: 1.2rem; }
    </style>
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
    <div class="text-center mb-5">
        <h1 class="fw-bold text-dark">Guest Testimonials</h1>
        <p class="text-muted fs-5">See what our previous guests have to say about their stay.</p>
    </div>

    <!-- Success/Error Messages -->
    <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-danger shadow-sm text-center mx-auto" style="max-width: 600px;"><i class="bi bi-trash-fill me-2"></i>Review was permanently deleted.</div>
    <% } %>
    <% if ("true".equals(request.getParameter("replySuccess"))) { %>
    <div class="alert alert-success shadow-sm text-center mx-auto" style="max-width: 600px;"><i class="bi bi-reply-fill me-2"></i>Your reply has been posted!</div>
    <% } %>

    <!-- Filter Form -->
    <div class="row justify-content-center mb-5">
        <div class="col-md-6">
            <form action="ViewReviewsServlet" method="GET" class="d-flex shadow-sm rounded">
                <input type="text" name="roomId" class="form-control form-control-lg border-0 bg-white" placeholder="Filter by Room ID (e.g., 101)">
                <button type="submit" class="btn btn-primary px-4 fw-bold"><i class="bi bi-funnel-fill me-2"></i>Filter</button>
            </form>
        </div>
    </div>

    <div class="row g-4">
        <%
            List<String> reviewList = (List<String>) request.getAttribute("reviewList");
            if (reviewList != null && !reviewList.isEmpty()) {
                for (String reviewData : reviewList) {
                    String[] data = reviewData.split(",");
                    if(data.length < 6) continue; // Safety check
                    int rating = Integer.parseInt(data[2]);
                    boolean isVerified = "Verified".equals(data[4]);
        %>
        <div class="col-md-6 col-lg-4">
            <div class="card review-card h-100 p-4 bg-white d-flex flex-column">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="stars">
                        <% for(int i=0; i<5; i++) {
                            if(i < rating) { out.print("<i class='bi bi-star-fill'></i>"); }
                            else { out.print("<i class='bi bi-star text-muted opacity-25'></i>"); }
                        } %>
                    </div>
                    <span class="badge bg-light text-secondary border">Room <%= data[1] %></span>
                </div>

                <p class="card-text text-dark">"<%= data[3] %>"</p>

                <!-- DISPLAY MANAGEMENT REPLY (If it exists) -->
                <% if (data.length > 6 && data[6] != null && !data[6].trim().isEmpty()) { %>
                <div class="mt-2 mb-3 p-3 bg-light rounded border-start border-4 border-primary">
                    <strong class="text-primary small"><i class="bi bi-building-fill-check me-1"></i>Response from Management:</strong>
                    <p class="mb-0 mt-1 small text-dark fst-italic"><%= data[6] %></p>
                </div>
                <% } %>

                <div class="mt-auto"> <!-- Pushes footer content to bottom -->
                    <hr class="text-muted opacity-25">
                    <div class="d-flex align-items-center mb-2">
                        <div class="rounded-circle bg-primary bg-opacity-10 text-primary d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px;">
                            <i class="bi <%= isVerified ? "bi-person-check-fill" : "bi-person-fill-lock" %> fs-5"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold"><%= isVerified ? data[5] : "Anonymous Guest" %></h6>
                            <small class="text-muted"><%= isVerified ? "Verified Stay" : data[5] + " Trip" %></small>
                        </div>
                    </div>
                    <div class="text-end">
                        <small class="text-muted opacity-50" style="font-size: 0.7rem;">Review ID: <%= data[0] %></small>
                    </div>

                    <!-- ROLE-BASED ACCESS CONTROL: ADMIN TOOLS ONLY -->
                    <% if (!"GUEST".equals(userRole)) { %>
                    <div class="d-flex justify-content-between align-items-center mt-3 pt-3 border-top">
                        <!-- Reply Toggle Button -->
                        <button class="btn btn-sm btn-outline-primary fw-bold" data-bs-toggle="collapse" data-bs-target="#reply-<%= data[0] %>">
                            <i class="bi bi-reply-fill me-1"></i>Reply
                        </button>

                        <!-- Delete Button -->
                        <form action="DeleteReviewServlet" method="POST" style="margin: 0;">
                            <input type="hidden" name="reviewId" value="<%= data[0] %>">
                            <input type="hidden" name="source" value="list">
                            <button type="submit" class="btn btn-sm btn-outline-danger" title="Delete Review" onclick="return confirm('Permanently delete this review?');">
                                <i class="bi bi-trash-fill"></i>
                            </button>
                        </form>
                    </div>

                    <!-- Hidden Collapsible Reply Box -->
                    <div class="collapse mt-2" id="reply-<%= data[0] %>">
                        <form action="ReplyReviewServlet" method="POST">
                            <input type="hidden" name="reviewId" value="<%= data[0] %>">
                            <div class="input-group input-group-sm">
                                <input type="text" name="replyText" class="form-control" placeholder="Type response..." required>
                                <button class="btn btn-primary" type="submit">Send</button>
                            </div>
                        </form>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12 text-center py-5">
            <i class="bi bi-chat-square-text text-muted opacity-25" style="font-size: 5rem;"></i>
            <h3 class="text-muted mt-3">No reviews found yet.</h3>
            <a href="submitReview.jsp" class="btn btn-outline-primary mt-3">Be the first to review</a>
        </div>
        <% } %>
    </div>

    <div class="text-center mt-5">
        <a href="submitReview.jsp" class="text-decoration-none text-secondary"><i class="bi bi-arrow-left me-1"></i>Back to Feedback Form</a>
    </div>
</div>

<!-- Required for the Collapsible Reply Box to open -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>