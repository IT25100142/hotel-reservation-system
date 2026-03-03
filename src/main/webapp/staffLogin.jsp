<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hotel Admin Portal - Secure Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background: linear-gradient(135deg, #000000 0%, #1a1a1a 100%); min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .login-card { background: rgba(255, 255, 255, 0.95); border-radius: 15px; box-shadow: 0 15px 35px rgba(255,215,0,0.1); overflow: hidden; width: 100%; max-width: 450px; border-top: 5px solid #ffc107; }
        .nav-tabs .nav-link { color: #555; font-weight: bold; border: none; padding: 15px; }
        .nav-tabs .nav-link.active { color: #000; border-bottom: 3px solid #ffc107; background: transparent; }
    </style>
</head>
<body>
<div class="login-card">
    <div class="text-center bg-light p-4 border-bottom">
        <i class="bi bi-shield-lock-fill text-warning" style="font-size: 3rem;"></i>
        <h3 class="fw-bold mt-2 text-dark">Secure Staff Portal</h3>
        <p class="text-muted small mb-0">Authorized Personnel Only</p>
    </div>

    <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-danger m-3 text-center small fw-bold"><i class="bi bi-exclamation-triangle-fill me-2"></i><%= request.getParameter("error") %></div>
    <% } %>
    <% if (request.getParameter("msg") != null) { %>
    <div class="alert alert-info m-3 text-center small fw-bold"><i class="bi bi-info-circle-fill me-2"></i><%= request.getParameter("msg") %></div>
    <% } %>

    <ul class="nav nav-tabs nav-justified" id="loginTabs" role="tablist">
        <li class="nav-item" role="presentation"><button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab">Staff Login</button></li>
        <li class="nav-item" role="presentation"><button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register" type="button" role="tab">Request Access</button></li>
    </ul>

    <div class="tab-content p-4" id="loginTabsContent">
        <div class="tab-pane fade show active" id="login" role="tabpanel">
            <form action="LoginServlet" method="POST">
                <div class="mb-3">
                    <label class="form-label fw-bold text-secondary">Admin Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>
                <div class="mb-4">
                    <label class="form-label fw-bold text-secondary">Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-dark w-100 fw-bold shadow-sm">Secure Login <i class="bi bi-box-arrow-in-right ms-1"></i></button>
            </form>
        </div>

        <div class="tab-pane fade" id="register" role="tabpanel">
            <form action="RegisterUserServlet" method="POST">
                <div class="alert alert-warning small py-2"><i class="bi bi-info-circle-fill me-1"></i>New accounts require Master Admin approval.</div>
                <div class="mb-3">
                    <label class="form-label fw-bold text-secondary">Choose Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>
                <div class="mb-4">
                    <label class="form-label fw-bold text-secondary">Create Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-warning w-100 fw-bold shadow-sm">Submit Request</button>
            </form>
        </div>
    </div>

    <div class="text-center p-3 border-top bg-light">
        <a href="guestLogin.jsp" class="text-decoration-none text-secondary small"><i class="bi bi-arrow-left me-1"></i>Return to Public Site</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>