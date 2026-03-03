<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
<head>
    <title>Grand Oasis Hotel Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        /* Modern Transitions for Dark Mode */
        body { transition: background-color 0.3s ease, color 0.3s ease; }

        .hero-section {
            background: linear-gradient(rgba(0, 31, 63, 0.8), rgba(0, 31, 63, 0.8)), url('https://images.unsplash.com/photo-1542314831-c6a4d14d8387?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') center/cover;
            color: white; padding: 80px 0; margin-bottom: 40px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .module-card {
            border: none; border-radius: 12px; transition: all 0.3s ease; cursor: pointer; text-decoration: none; display: block; position: relative;
        }
        /* Uses CSS variables to automatically adapt to Dark/Light mode */
        .module-card { background-color: var(--bs-card-bg); color: var(--bs-card-color); box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .module-card:hover { transform: translateY(-8px); box-shadow: 0 12px 25px rgba(0,0,0,0.15); }

        .icon-wrapper { width: 70px; height: 70px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 30px; margin-bottom: 15px; }

        /* Floating Buttons */
        .floating-btn-calc { position: fixed; bottom: 30px; right: 30px; width: 60px; height: 60px; border-radius: 50%; background-color: #ffc107; color: #000; display: flex; align-items: center; justify-content: center; font-size: 24px; box-shadow: 0 4px 15px rgba(0,0,0,0.2); z-index: 1000; cursor: pointer; transition: transform 0.3s; border: none; }
        .floating-btn-calc:hover { transform: scale(1.1) rotate(10deg); background-color: #ffca2c; }
    </style>
</head>
<body class="bg-body-tertiary">

<!-- TOP RIGHT CONTROLS: SIGN OUT & DARK MODE (NEW FIX) -->
<div class="position-fixed d-flex gap-2 align-items-center" style="top: 20px; right: 20px; z-index: 1000;">
    <a href="LogoutServlet" class="btn btn-danger shadow-sm fw-bold rounded-pill px-4 d-flex align-items-center border border-white">
        <i class="bi bi-box-arrow-right me-2"></i> Sign Out
    </a>
    <button class="btn btn-dark shadow-sm d-flex align-items-center justify-content-center border border-secondary" id="themeToggle" title="Toggle Dark Mode" style="border-radius: 50%; width: 42px; height: 42px;">
        <i class="bi bi-moon-stars-fill" id="themeIcon"></i>
    </button>
</div>

<!-- Hero Section -->
<div class="hero-section text-center">
    <div class="container">
        <h1 class="display-4 fw-bold mb-3"><i class="bi bi-buildings-fill me-3"></i>Grand Oasis Hotel System</h1>
        <p class="lead opacity-75">Centralized Management Dashboard</p>
        <!-- NEW LOGGED IN BADGE -->
        <span class="badge bg-light text-dark shadow-sm mt-2 px-3 py-2 border"><i class="bi bi-person-badge-fill me-2"></i>Logged in as: ${sessionScope.username}</span>
    </div>
</div>

<!-- Main Navigation Grid -->
<div class="container pb-5">
    <div class="row g-4">

        <!-- Student 1 -->
        <div class="col-md-4 col-sm-6">
            <a href="guestRegistration.jsp" class="card module-card h-100 p-4 text-center">
                <!-- Live Dynamic Badge -->
                <span class="badge bg-primary position-absolute top-0 end-0 m-3 shadow-sm rounded-pill">
                        ${totalGuests != null ? totalGuests : 0} Total
                    </span>
                <div class="d-flex justify-content-center">
                    <div class="icon-wrapper bg-primary bg-opacity-10 text-primary"><i class="bi bi-person-lines-fill"></i></div>
                </div>
                <h5 class="fw-bold">Guest Management</h5>
                <p class="text-muted small">Register guests, view profiles, and update contact details.</p>
            </a>
        </div>

        <!-- Student 2 -->
        <div class="col-md-4 col-sm-6">
            <a href="SearchRoomServlet" class="card module-card h-100 p-4 text-center">
                <!-- Live Dynamic Badge -->
                <span class="badge bg-success position-absolute top-0 end-0 m-3 shadow-sm rounded-pill">
                        ${availableRooms != null ? availableRooms : 0} Available
                    </span>
                <div class="d-flex justify-content-center">
                    <div class="icon-wrapper bg-success bg-opacity-10 text-success"><i class="bi bi-door-open-fill"></i></div>
                </div>
                <h5 class="fw-bold">Room Inventory</h5>
                <p class="text-muted small">Add, search, and remove hotel rooms from the catalog.</p>
            </a>
        </div>

        <!-- Student 3 -->
        <div class="col-md-4 col-sm-6">
            <a href="makeReservation.jsp" class="card module-card h-100 p-4 text-center">
                <div class="d-flex justify-content-center">
                    <div class="icon-wrapper bg-info bg-opacity-10 text-info"><i class="bi bi-calendar2-check-fill"></i></div>
                </div>
                <h5 class="fw-bold">Reservations & Bookings</h5>
                <p class="text-muted small">Handle check-ins, check-outs, and booking cancellations.</p>
            </a>
        </div>

        <!-- Student 4 -->
        <div class="col-md-4 col-sm-6">
            <a href="generateInvoice.jsp" class="card module-card h-100 p-4 text-center">
                <!-- Live Dynamic Badge -->
                <span class="badge bg-warning text-dark position-absolute top-0 end-0 m-3 shadow-sm rounded-pill">
                        ${pendingInvoices != null ? pendingInvoices : 0} Pending
                    </span>
                <div class="d-flex justify-content-center">
                    <div class="icon-wrapper bg-warning bg-opacity-10 text-warning"><i class="bi bi-receipt-cutoff"></i></div>
                </div>
                <h5 class="fw-bold">Payments & Billing</h5>
                <p class="text-muted small">Generate invoices, track transactions, and update payment status.</p>
            </a>
        </div>

        <!-- Student 5 -->
        <div class="col-md-4 col-sm-6">
            <a href="ViewStaffServlet" class="card module-card h-100 p-4 text-center">
                <div class="d-flex justify-content-center">
                    <div class="icon-wrapper bg-danger bg-opacity-10 text-danger"><i class="bi bi-person-badge-fill"></i></div>
                </div>
                <h5 class="fw-bold">Staff Directory</h5>
                <p class="text-muted small">Manage hotel employees, departments, and onboarding.</p>
            </a>
        </div>

        <!-- Student 6 -->
        <div class="col-md-4 col-sm-6">
            <a href="ViewReviewsServlet" class="card module-card h-100 p-4 text-center">
                <div class="d-flex justify-content-center">
                    <div class="icon-wrapper bg-secondary bg-opacity-10 text-secondary"><i class="bi bi-star-fill"></i></div>
                </div>
                <h5 class="fw-bold">Guest Reviews</h5>
                <p class="text-muted small">Submit feedback, read testimonials, and moderate reviews.</p>
            </a>
        </div>

    </div>
</div>

<!-- Floating Currency Calculator Button -->
<button class="floating-btn-calc" data-bs-toggle="modal" data-bs-target="#currencyModal" title="Currency Calculator">
    <i class="bi bi-currency-exchange"></i>
</button>

<!-- Currency Calculator Modal Popup -->
<div class="modal fade" id="currencyModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg bg-body">
            <div class="modal-header bg-warning border-0">
                <h5 class="modal-title fw-bold text-dark"><i class="bi bi-calculator-fill me-2"></i>LKR ↔ USD Calculator</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4">

                <!-- LKR IS ON TOP -->
                <div class="mb-3">
                    <label class="form-label fw-bold text-secondary">Amount in LKR (Rs)</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-text fw-bold">Rs</span>
                        <input type="number" id="lkrInput" class="form-control" placeholder="0.00" oninput="convertToUSD()" onkeypress="return event.charCode >= 48 && event.charCode <= 57 || event.charCode === 46">
                    </div>
                </div>

                <div class="text-center my-3 text-muted">
                    <i class="bi bi-arrow-down-up fs-3"></i>
                </div>

                <!-- USD IS ON BOTTOM -->
                <div class="mb-3">
                    <label class="form-label fw-bold text-secondary">Amount in USD ($)</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                        <input type="number" id="usdInput" class="form-control" placeholder="0.00" oninput="convertToLKR()" onkeypress="return event.charCode >= 48 && event.charCode <= 57 || event.charCode === 46">
                    </div>
                </div>

                <div class="text-center mt-4">
                    <small class="text-muted fst-italic">*Based on standard conversion rate (1 USD ≈ 305 LKR)</small>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- BOOTSTRAP TOAST CONTAINER (For UI/UX Feedback) -->
<div class="toast-container position-fixed bottom-0 start-0 p-3" style="z-index: 1055">
    <div id="welcomeToast" class="toast align-items-center text-bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body fw-bold">
                <i class="bi bi-check-circle-fill me-2"></i>Welcome back to the Admin Dashboard!
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>

<!-- UPDATED FOOTER HERE -->
<div class="text-center pb-4 text-muted small">
    &copy; 2026 Y1S2 SE1020 Object Oriented Programming Team Project
</div>

<!-- Bootstrap JS (Required for the Modal to open) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Scripts for Toast, Dark Mode, and Currency Calculator -->
<script>
    // 1. SHOW TOAST NOTIFICATION ON LOAD
    window.onload = function() {
        const toastElList = document.querySelectorAll('.toast');
        const toastList = [...toastElList].map(toastEl => new bootstrap.Toast(toastEl, { delay: 3000 }));
        toastList.forEach(toast => toast.show());
    }

    // 2. DARK MODE LOGIC (Saves to LocalStorage)
    const themeToggle = document.getElementById('themeToggle');
    const themeIcon = document.getElementById('themeIcon');
    const htmlElement = document.documentElement;

    if (localStorage.getItem('theme') === 'dark') {
        htmlElement.setAttribute('data-bs-theme', 'dark');
        themeIcon.classList.replace('bi-moon-stars-fill', 'bi-sun-fill');
    }

    themeToggle.addEventListener('click', () => {
        if (htmlElement.getAttribute('data-bs-theme') === 'light') {
            htmlElement.setAttribute('data-bs-theme', 'dark');
            localStorage.setItem('theme', 'dark');
            themeIcon.classList.replace('bi-moon-stars-fill', 'bi-sun-fill');
        } else {
            htmlElement.setAttribute('data-bs-theme', 'light');
            localStorage.setItem('theme', 'light');
            themeIcon.classList.replace('bi-sun-fill', 'bi-moon-stars-fill');
        }
    });

    // 3. UPDATED CURRENCY CALCULATOR (LKR Primary)
    const EXCHANGE_RATE = 305.00;

    function convertToUSD() {
        let lkrValue = document.getElementById("lkrInput").value;
        let usdField = document.getElementById("usdInput");

        if (lkrValue === "") {
            usdField.value = "";
            return;
        }
        // Math: LKR / Rate
        let result = parseFloat(lkrValue) / EXCHANGE_RATE;
        usdField.value = result.toFixed(2);
    }

    function convertToLKR() {
        let usdValue = document.getElementById("usdInput").value;
        let lkrField = document.getElementById("lkrInput");

        if (usdValue === "") {
            lkrField.value = "";
            return;
        }
        // Math: USD * Rate
        let result = parseFloat(usdValue) * EXCHANGE_RATE;
        lkrField.value = result.toFixed(2);
    }
</script>
</body>
</html>