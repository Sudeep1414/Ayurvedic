<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Registration - AVUSCRIPT</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        :root {
            --deep-green: #0b5633;
            --leaf: #2b8a5f;
            --rust: #7a4b3a;
            --gold: #c9a25a;
            --cream: #fbf6ee;
            --paper: #f7efe6;
            --text: #2d2d2d;
            --max-width: 1200px;
            --radius: 12px;
            --shadow: 0 10px 30px rgba(11,74,57,0.06);
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
            background-color: var(--cream);
            color: var(--text);
            margin: 0;
            padding: 0;
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Utility Classes */
        .container-main {
            max-width: var(--max-width);
            margin: 0 auto;
            padding: 0 15px;
        }

        /* ===== Header Bar & Logo ===== */
        .brand-bar {
            background-color: var(--paper);
            box-shadow: var(--shadow);
            padding: 10px 0;
            border-bottom: 4px solid var(--deep-green);
        }
        .logo-text {
            font-family: 'Georgia', serif;
            font-weight: 700;
            color: var(--deep-green);
            font-size: 34px;
            letter-spacing: 1px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }
        .logo-subtitle {
            font-size: 11px;
            font-weight: 600;
            color: var(--rust);
            text-transform: uppercase;
            display: block;
            margin-top: -5px;
        }

        /* ===== User Info & Alerts ===== */
        .user-info {
            background: #e8f5e9;
            padding: 8px 18px;
            border-radius: 25px;
            border: 1px solid var(--leaf);
            color: var(--deep-green);
            font-weight: 600;
            font-size: 15px;
            white-space: nowrap;
        }

        .alert {
            padding: 15px 25px;
            border-radius: var(--radius);
            margin: 1.5rem 0;
            font-weight: 500;
            border: none;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        .alert-success { background: #e8f5e9; color: var(--deep-green); border-left: 5px solid var(--leaf); }
        .alert-error { background: #ffebee; color: #c62828; border-left: 5px solid #f44336; }
        .alert-info { background: #e3f2fd; color: #1565c0; border-left: 5px solid #2196f3; }

        /* ===== Navbar (Top Bar) ===== */
        .topbar {
            background-color: var(--deep-green);
            padding: 0;
            z-index: 1020;
        }
        .topbar .navbar-nav {
            width: 100%;
            justify-content: space-between;
        }
        .topbar .nav-link {
            color: #fff !important;
            font-weight: 600;
            text-transform: uppercase;
            transition: var(--transition);
            font-size: 14px;
            padding: 15px 18px !important;
            position: relative;
        }
        .topbar .nav-link:hover, .topbar .nav-link.active {
            color: var(--gold) !important;
            background-color: rgba(255,255,255,0.1);
        }
        .topbar .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%) scaleX(0);
            width: calc(100% - 40px);
            height: 3px;
            background-color: var(--gold);
            transition: transform 0.3s ease;
        }
        .topbar .nav-link:hover::after, .topbar .nav-link.active::after {
            transform: translateX(-50%) scaleX(1);
        }

        /* ===== Admin Registration Section ===== */
        .admin-register-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 0;
            background: linear-gradient(135deg, rgba(122, 75, 58, 0.03) 0%, rgba(201, 162, 90, 0.03) 100%);
        }

        .admin-register-container {
            width: 100%;
            max-width: 600px;
        }

        .admin-register-card {
            background: white;
            padding: 50px 40px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            border-top: 5px solid var(--rust);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .admin-register-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--rust), var(--gold));
        }

        .admin-register-card:hover {
            box-shadow: 0 15px 40px rgba(122, 75, 58, 0.15);
            transform: translateY(-5px);
        }

        .admin-register-header {
            text-align: center;
            margin-bottom: 35px;
        }

        .admin-register-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--rust), var(--gold));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: white;
            font-size: 2rem;
            box-shadow: 0 8px 20px rgba(122, 75, 58, 0.3);
        }

        .admin-register-title {
            color: var(--rust);
            font-family: 'Georgia', serif;
            font-weight: 700;
            font-size: 2.2rem;
            margin-bottom: 8px;
        }

        .admin-register-subtitle {
            color: var(--deep-green);
            font-size: 1.1rem;
            font-weight: 500;
        }

        .admin-badge {
            background: var(--rust);
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            margin-left: 10px;
            vertical-align: middle;
        }

        /* ===== Form Styling ===== */
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 25px;
            text-align: left;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: var(--deep-green);
            font-weight: 600;
            font-size: 1rem;
        }

        .form-control {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e8f5e9;
            border-radius: var(--radius);
            font-size: 1rem;
            transition: var(--transition);
            background: var(--cream);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--rust);
            box-shadow: 0 0 0 3px rgba(122, 75, 58, 0.1);
            background: white;
        }

        .form-control::placeholder {
            color: #a0a0a0;
        }

        .required {
            color: #d32f2f;
            font-weight: bold;
        }

        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            flex: 1;
            padding: 15px 25px;
            border: none;
            border-radius: var(--radius);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            text-decoration: none;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-admin-register {
            background: var(--rust);
            color: white;
        }

        .btn-admin-register:hover {
            background: #8a5a4a;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(122, 75, 58, 0.3);
        }

        .btn-cancel {
            background: transparent;
            color: var(--rust);
            border: 2px solid var(--rust);
        }

        .btn-cancel:hover {
            background: var(--rust);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(122, 75, 58, 0.3);
        }

        .security-notice {
            background: #fff3e0;
            border: 1px solid #ffb74d;
            border-radius: var(--radius);
            padding: 15px;
            margin-top: 25px;
            text-align: center;
        }

        .security-notice i {
            color: #f57c00;
            margin-right: 8px;
        }

        .security-notice p {
            color: #e65100;
            font-size: 0.9rem;
            margin: 0;
            font-weight: 500;
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #e8f5e9;
        }

        .login-link p {
            color: var(--text);
            margin-bottom: 0;
        }

        .login-link a {
            color: var(--deep-green);
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
        }

        .login-link a:hover {
            color: var(--rust);
            text-decoration: underline;
        }

        /* ===== Footer ===== */
        .footer {
            background-color: var(--deep-green);
            color: var(--cream);
            padding: 40px 0 20px;
            margin-top: auto;
        }
        .footer a {
            color: #fff;
            text-decoration: none;
            transition: var(--transition);
        }
        .footer a:hover { color: var(--gold); }
        .footer h5 {
            color: var(--gold);
            margin-bottom: 20px;
            font-family: 'Georgia', serif;
            font-weight: 600;
            font-size: 1.3rem;
        }
        .footer-links {
            list-style: none;
            padding-left: 0;
        }
        .footer-links li { margin-bottom: 10px; }
        .footer-bottom {
            border-top: 1px solid rgba(255,255,255,0.15);
            padding-top: 20px;
            margin-top: 30px;
            text-align: center;
            font-size: 14px;
        }
        .social-icons a {
            font-size: 1.5rem;
            margin-right: 15px;
        }

        /* ===== Responsive Adjustments ===== */
        @media (max-width: 992px) {
            .logo-text { font-size: 28px; }
            .topbar .navbar-nav { justify-content: flex-start; }
            .topbar .nav-link { padding: 10px 15px !important; font-size: 14px; }
            .topbar .nav-item { margin: 0 5px; }
            .topbar .nav-link::after { width: calc(100% - 30px); }
            .admin-register-card { padding: 40px 30px; }
        }

        @media (max-width: 768px) {
            .brand-bar .d-flex:last-child { display: none !important; }
            .logo-text { font-size: 24px; }
            .logo-subtitle { display: none; }
            .admin-register-section { padding: 40px 0; }
            .admin-register-card { padding: 30px 25px; margin: 0 15px; }
            .form-row { grid-template-columns: 1fr; gap: 0; }
            .btn-group { flex-direction: column; }
            .topbar .navbar-collapse {
                background-color: var(--deep-green);
                border-top: 1px solid rgba(255,255,255,0.1);
            }
            .topbar .nav-link { padding: 10px 20px !important; }
            .topbar .nav-link::after { display: none; }
            .topbar .d-flex {
                flex-direction: column;
                padding: 10px;
            }
            .topbar .d-flex .btn-sm { width: 100%; margin: 5px 0 !important; }
        }

        @media (max-width: 480px) {
            .admin-register-card { padding: 25px 20px; }
            .admin-register-title { font-size: 1.8rem; }
        }
    </style>
</head>

<body>
    <%
        // JSP Logic - Session and Application Data
        String username = (String) session.getAttribute("username");
        Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
        String userRole = (String) session.getAttribute("userRole");
        
        // Message handling
        String message = (String) request.getAttribute("message");
        String messageType = (String) request.getAttribute("messageType");
    %>

    <header class="brand-bar">
        <div class="container-main d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/images/logo/logonew.png" alt="logo" style="height:60px;" class="me-3">
                <div class="d-flex flex-column align-items-start">
                    <div class="logo-text">AVUSCRIPT</div>
                    <span class="logo-subtitle">Research in Ayurveda</span>
                </div>
            </div>
            <div class="d-flex align-items-center">
                <div class="fw-bold text-end me-4 d-none d-md-block" style="color: var(--deep-green);">
                    <i class="fas fa-barcode"></i> <strong class="fs-6">ISSN:</strong> 2583-3677
                </div>
                <c:if test="${not empty sessionScope.username}">
                    <div class="user-info">
                        <i class="fas fa-user-circle me-1"></i> Welcome, <strong>${sessionScope.username}</strong> (${sessionScope.userRole})
                    </div>
                </c:if>
            </div>
        </div>
    </header>

    <div class="container-main">
        <c:if test="${not empty requestScope.message}">
            <div class="alert alert-${requestScope.messageType} fade show" role="alert">
                <i class="fas fa-info-circle me-2"></i> ${requestScope.message}
            </div>
        </c:if>
    </div>

    <nav class="navbar navbar-expand-lg navbar-dark topbar sticky-top">
        <div class="container-main">
            <a class="navbar-brand d-lg-none" href="${pageContext.request.contextPath}/">AVUSCRIPT</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain" aria-controls="navMain" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navMain">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
               
                   
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a></li>
                   
                </ul>
                
                <div class="d-flex ms-lg-auto">
                    <c:choose>
                        <c:when test="${sessionScope.isLoggedIn}">
                            <a class="btn btn-outline-light btn-sm me-2" href="${pageContext.request.contextPath}/dashboard">
                                <i class="fas fa-tachometer-alt"></i> Dashboard
                            </a>
                            <a class="btn btn-light btn-sm" href="${pageContext.request.contextPath}/logout">
                                <i class="fas fa-sign-out-alt"></i> Logout
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-outline-light btn-sm me-2" href="${pageContext.request.contextPath}/login">
                                <i class="fas fa-sign-in-alt"></i> Login
                            </a>
                            <a class="btn btn-light btn-sm" href="${pageContext.request.contextPath}/register">
                                <i class="fas fa-user-plus"></i> Register
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <!-- Admin Registration Section -->
    <section class="admin-register-section">
        <div class="admin-register-container">
            <div class="admin-register-card">
                <div class="admin-register-header">
                    <div class="admin-register-icon">
                        <i class="fas fa-user-shield"></i>
                    </div>
                    <h1 class="admin-register-title">
                        Admin Registration
                        <span class="admin-badge">SECURE</span>
                    </h1>
                    <p class="admin-register-subtitle">Create administrator account for system management</p>
                </div>

                <!-- Error/Success Messages -->
                <c:if test="${not empty error}">
                    <div class="alert alert-error fade show" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i> ${error}
                    </div>
                </c:if>
                <c:if test="${not empty success}">
                    <div class="alert alert-success fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i> ${success}
                    </div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/admin/register" method="post">
                    <div class="form-group">
                        <label for="email" class="form-label">
                            <i class="fas fa-envelope me-2"></i>Email Address <span class="required">*</span>
                        </label>
                        <input type="email" id="email" name="email" class="form-control" 
                               placeholder="Enter admin email address" required value="admin@avuscript.com">
                    </div>

                    <div class="form-group">
                        <label for="password" class="form-label">
                            <i class="fas fa-lock me-2"></i>Password <span class="required">*</span>
                        </label>
                        <input type="password" id="password" name="password" class="form-control" 
                               placeholder="Create secure password" required value="admin123">
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="fullName" class="form-label">
                                <i class="fas fa-user me-2"></i>Full Name <span class="required">*</span>
                            </label>
                            <input type="text" id="fullName" name="fullName" class="form-control" 
                                   placeholder="Enter full name" required value="System Administrator">
                        </div>
                        
                        <div class="form-group">
                            <label for="mobileNumber" class="form-label">
                                <i class="fas fa-phone me-2"></i>Mobile Number <span class="required">*</span>
                            </label>
                            <input type="text" id="mobileNumber" name="mobileNumber" class="form-control" 
                                   placeholder="Enter mobile number" required value="0000000000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="instituteName" class="form-label">
                            <i class="fas fa-university me-2"></i>Institute Name <span class="required">*</span>
                        </label>
                        <input type="text" id="instituteName" name="instituteName" class="form-control" 
                               placeholder="Enter institute name" required value="Avuscript">
                    </div>
                    
                    <div class="form-group">
                        <label for="address" class="form-label">
                            <i class="fas fa-map-marker-alt me-2"></i>Address <span class="required">*</span>
                        </label>
                        <input type="text" id="address" name="address" class="form-control" 
                               placeholder="Enter complete address" required value="Default Address">
                    </div>
                    
                    <div class="btn-group">
                        <button type="submit" class="btn btn-admin-register">
                            <i class="fas fa-user-shield me-2"></i>CREATE ADMIN ACCOUNT
                        </button>
                        <a href="${pageContext.request.contextPath}/" class="btn btn-cancel">
                            <i class="fas fa-times me-2"></i>CANCEL
                        </a>
                    </div>
                </form>
                
                <div class="security-notice">
                    <i class="fas fa-exclamation-triangle"></i>
                    <p>This registration is for system administrators only. Unauthorized registration attempts will be logged.</p>
                </div>
                
                <div class="login-link">
                    <p>Already have an account? <a href="${pageContext.request.contextPath}/login">
                        <i class="fas fa-sign-in-alt me-2"></i>Login here
                    </a></p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container-main">
            <div class="row">
                <div class="col-lg-4 mb-4 mb-lg-0">
                    <div class="footer-logo">
                        <div class="d-flex align-items-center mb-3">
                            <img src="${pageContext.request.contextPath}/images/logo/logonew.png" alt="logo" style="height:50px;" class="me-2">
                            <div class="logo-text" style="font-size: 28px; color: var(--gold);">AVUSCRIPT</div>
                        </div>
                    </div>
                    <p class="small">International Journal for Empirical Research in Ayurveda, dedicated to open-access scholarly publishing.</p>
                    <div class="social-icons mt-3">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>

                <div class="col-6 col-lg-2">
                    <h5>Quick Links</h5>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                        <li><a href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                        
                    </ul>
                </div>

                <div class="col-6 col-lg-3">
                    <h5>Author Zone</h5>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/submit-article">Submit Article</a></li>
                        <li><a href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                        <li><a href="${pageContext.request.contextPath}/login">Login / Register</a></li>
                        
                    </ul>
                </div>

                <div class="col-lg-3">
                    <h5>Contact</h5>
                    <ul class="footer-links">
                        <li><i class="fas fa-envelope me-2"></i> <a href="mailto:editor@ayuscript.com">editor@ayuscript.com</a></li>
                        <li><i class="fas fa-globe me-2"></i> <a href="http://www.ayuscript.com/">www.ayuscript.com</a></li>
                        <li><i class="fas fa-barcode me-2"></i> ISSN: 2583-3677</li>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                &copy; <%= java.time.Year.now().getValue() %> AVUSCRIPT | All Rights Reserved. | <a href="#">Privacy Policy</a>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>