<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Dynamically figure out where the "Home" button should go!
    String userRole = (String) session.getAttribute("role");
    String homeUrl = "GUEST".equals(userRole) ? "guestDashboard.jsp" : "DashboardServlet";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Make a Reservation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background: #fdfbfb; min-height: 100vh; }
        .premium-card { border: none; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.08); transition: transform 0.3s; }
        .icon-box { background: #e3f2fd; color: #0d6efd; padding: 15px; border-radius: 50%; font-size: 24px; display: inline-block; margin-bottom: 15px;}
    </style>
    <script>
        function toggleBookingType() {
            const type = document.getElementById("bookingType").value;
            const personalDiv = document.getElementById("personalDiv");
            const corporateDiv = document.getElementById("corporateDiv");

            if (type === "Corporate") {
                corporateDiv.style.display = "block";
                personalDiv.style.display = "none";
            } else {
                corporateDiv.style.display = "none";
                personalDiv.style.display = "block";
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
        <div class="col-lg-8">
            <div class="card premium-card bg-white p-5 border-top border-primary border-4">
                <div class="text-center">
                    <div class="icon-box"><i class="bi bi-calendar-check-fill"></i></div>
                    <h2 class="fw-bold mb-1 text-primary">Book Your Stay</h2>
                    <p class="text-muted mb-4">Experience luxury and comfort.</p>
                </div>

                <% if ("true".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success border-0 shadow-sm d-flex align-items-center" role="alert">
                    <i class="bi bi-check-circle-fill fs-4 me-3"></i>
                    <div>
                        <strong>Success!</strong> Your reservation is confirmed.<br>
                        Your Booking ID is: <span class="badge bg-success fs-6"><%= request.getParameter("bookingId") %></span> (Save this!)
                    </div>
                </div>
                <% } %>

                <form action="CreateReservationServlet" method="POST">
                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold text-secondary">Guest Full Name</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-person"></i></span>
                                <input type="text" name="guestName" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold text-secondary">Room ID</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-door-closed"></i></span>
                                <input type="text" name="roomId" class="form-control" placeholder="E.g., 101" required>
                            </div>
                        </div>
                    </div>

                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold text-secondary">Check-In Date</label>
                            <input type="date" name="checkInDate" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold text-secondary">Check-Out Date</label>
                            <input type="date" name="checkOutDate" class="form-control" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-secondary">Purpose of Stay (Booking Type)</label>
                        <select id="bookingType" name="bookingType" class="form-select form-select-lg border-primary" onchange="toggleBookingType()" required>
                            <option value="Personal">Personal / Vacation</option>
                            <option value="Corporate">Corporate / Business</option>
                        </select>
                    </div>

                    <!-- Dynamic Fields -->
                    <div id="personalDiv" class="mb-4 p-3 bg-light rounded border">
                        <label class="form-label fw-bold text-primary"><i class="bi bi-people-fill me-2"></i>Number of Guests</label>
                        <input type="number" name="numberOfGuests" class="form-control" min="1" value="1">
                    </div>

                    <div id="corporateDiv" class="mb-4 p-3 bg-light rounded border" style="display: none;">
                        <label class="form-label fw-bold text-primary"><i class="bi bi-building-fill me-2"></i>Company Name</label>
                        <input type="text" name="companyName" class="form-control" placeholder="Enter your organization">
                    </div>

                    <button type="submit" class="btn btn-primary btn-lg w-100 fw-bold shadow-sm">
                        <i class="bi bi-calendar-plus me-2"></i>Confirm Reservation
                    </button>
                </form>

                <!-- ROLE-BASED ACCESS CONTROL FOR BUTTONS -->
                <div class="d-flex flex-wrap justify-content-center gap-2 mt-4 pt-4 border-top">
                    <% if (!"GUEST".equals(userRole)) { %>
                    <!-- ONLY STAFF SEE THESE -->
                    <a href="viewBooking.jsp" class="btn btn-outline-info shadow-sm fw-bold text-dark"><i class="bi bi-search me-1"></i>Search Booking</a>
                    <a href="cancelBooking.jsp" class="btn btn-outline-danger shadow-sm fw-bold"><i class="bi bi-trash3 me-1"></i>Cancel Booking</a>
                    <a href="ListReservationsServlet" class="btn btn-outline-success shadow-sm fw-bold"><i class="bi bi-card-list me-1"></i>View All Reservations</a>
                    <% } else { %>
                    <!-- GUESTS SEE THIS -->
                    <a href="guestDashboard.jsp" class="btn btn-outline-secondary shadow-sm fw-bold"><i class="bi bi-arrow-left-circle me-1"></i>Return to Portal</a>
                    <% } %>
                </div>

            </div>
        </div>
        <!-- ROLE-BASED ACCESS CONTROL FOR BUTTONS -->
        <div class="d-flex flex-wrap justify-content-center gap-2 mt-4 pt-4 border-top">
            <% if (!"GUEST".equals(userRole)) { %>
            <!-- ONLY STAFF SEE THESE -->
            <a href="viewBooking.jsp" class="btn btn-outline-info shadow-sm fw-bold text-dark"><i class="bi bi-search me-1"></i>Search</a>
            <a href="editBooking.jsp" class="btn btn-outline-warning shadow-sm fw-bold text-dark"><i class="bi bi-pencil-square me-1"></i>Edit</a>
            <a href="cancelBooking.jsp" class="btn btn-outline-danger shadow-sm fw-bold"><i class="bi bi-trash3 me-1"></i>Cancel</a>
            <a href="ListReservationsServlet" class="btn btn-outline-success shadow-sm fw-bold"><i class="bi bi-card-list me-1"></i>View All</a>
            <% } else { %>
            <!-- GUESTS SEE THIS -->
            <a href="guestDashboard.jsp" class="btn btn-outline-secondary shadow-sm fw-bold"><i class="bi bi-arrow-left-circle me-1"></i>Return to Portal</a>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>