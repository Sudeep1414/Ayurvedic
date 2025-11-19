<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Author Login - AVUSCRIPT</title>
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

        /* ===== Login Section ===== */
        .login-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 0;
            background: linear-gradient(135deg, rgba(11, 86, 51, 0.03) 0%, rgba(201, 162, 90, 0.03) 100%);
        }

        .login-container {
            width: 100%;
            max-width: 450px;
        }

        .login-card {
            background: white;
            padding: 50px 40px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            border-top: 5px solid var(--gold);
            transition: var(--transition);
        }

        .login-card:hover {
            box-shadow: 0 15px 40px rgba(11, 86, 51, 0.15);
            transform: translateY(-5px);
        }

        .login-header {
            text-align: center;
            margin-bottom: 35px;
        }

        .login-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--deep-green), var(--leaf));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: white;
            font-size: 2rem;
            box-shadow: 0 8px 20px rgba(11, 86, 51, 0.3);
        }

        .login-title {
            color: var(--deep-green);
            font-family: 'Georgia', serif;
            font-weight: 700;
            font-size: 2.2rem;
            margin-bottom: 8px;
        }

        .login-subtitle {
            color: var(--rust);
            font-size: 1.1rem;
            font-weight: 500;
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
            border-color: var(--leaf);
            box-shadow: 0 0 0 3px rgba(43, 138, 95, 0.1);
            background: white;
        }

        .form-control::placeholder {
            color: #a0a0a0;
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

        .btn-login {
            background: var(--deep-green);
            color: white;
        }

        .btn-login:hover {
            background: var(--leaf);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(11, 86, 51, 0.3);
        }

        .btn-cancel {
            background: transparent;
            color: var(--deep-green);
            border: 2px solid var(--deep-green);
        }

        .btn-cancel:hover {
            background: var(--deep-green);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(11, 86, 51, 0.3);
        }

        .login-links {
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            gap: 12px;
            text-align: center;
        }

        .login-link {
            color: var(--deep-green);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            padding: 8px 0;
        }

        .login-link:hover {
            color: var(--rust);
            text-decoration: underline;
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 25px 0;
            color: var(--rust);
            font-weight: 500;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #e0e0e0;
        }

        .divider::before {
            margin-right: 15px;
        }

        .divider::after {
            margin-left: 15px;
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
            .login-card { padding: 40px 30px; }
        }

        @media (max-width: 768px) {
            .brand-bar .d-flex:last-child { display: none !important; }
            .logo-text { font-size: 24px; }
            .logo-subtitle { display: none; }
            .login-section { padding: 40px 0; }
            .login-card { padding: 30px 25px; margin: 0 15px; }
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
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/published">Current Issue</a></li>
                 
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/submit-article">Submit Article</a></li>
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

    <!-- Login Section -->
    <section class="login-section">
        <div class="login-container">
            <div class="login-card">
                <div class="login-header">
                    <div class="login-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <h1 class="login-title">Author Login</h1>
                    <p class="login-subtitle">Enter your credentials to access your account</p>
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
                
                <!-- Login Form -->
                <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
                    <div class="form-group">
                        <label for="username" class="form-label">
                            <i class="fas fa-envelope me-2"></i>Email Address
                        </label>
                        <input type="email" id="username" name="username" class="form-control" 
                               placeholder="Enter your email address" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="password" class="form-label">
                            <i class="fas fa-key me-2"></i>Password
                        </label>
                        <input type="password" id="password" name="password" class="form-control" 
                               placeholder="Enter your password" required>
                    </div>
                    
                    <div class="btn-group">
                        <button type="submit" class="btn btn-login" id="loginBtn">
                            <i class="fas fa-sign-in-alt me-2"></i>LOGIN
                        </button>
                        <button type="button" class="btn btn-cancel" id="forgotPasswordBtn">
                            <i class="fas fa-question-circle me-2"></i>FORGOT PASSWORD?
                        </button>
                    </div>
                </form>

                <!-- Hidden form for forgot password -->
                <form action="${pageContext.request.contextPath}/forgot-password" method="post" id="forgotPasswordForm" style="display: none;">
                    <input type="hidden" id="forgotEmail" name="email">
                </form>
                
                <div class="divider">OR</div>
                
                <div class="login-links">
                    <a href="${pageContext.request.contextPath}/register" class="login-link">
                        <i class="fas fa-user-plus me-2"></i>Create New Author Account
                    </a>
                    <!-- Removed the old forgot password link since we now have the button -->
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
                        <li><a href="${pageContext.request.contextPath}/published">Current Issue</a></li>
                        <li><a href="${pageContext.request.contextPath}/archives">Archives</a></li>
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
    
    <script>
        // Forgot password functionality
        document.getElementById('forgotPasswordBtn').addEventListener('click', function() {
            const email = document.getElementById('username').value.trim();
            
            if (!email) {
                alert('Please enter your email address first.');
                document.getElementById('username').focus();
                return;
            }
            
            // Basic email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                alert('Please enter a valid email address.');
                document.getElementById('username').focus();
                return;
            }
            
            // Set the email in hidden form and submit
            document.getElementById('forgotEmail').value = email;
            document.getElementById('forgotPasswordForm').submit();
        });

        // Auto-hide alerts after 4 seconds
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(function() {
                const alerts = document.querySelectorAll('.alert');
                alerts.forEach(function(alert) {
                    const bsAlert = new bootstrap.Alert(alert);
                    bsAlert.close();
                });
            }, 4000);
        });

        // Enter key support for forgot password
        document.getElementById('username').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                document.getElementById('loginBtn').click();
            }
        });
    </script>
</body>
</html>