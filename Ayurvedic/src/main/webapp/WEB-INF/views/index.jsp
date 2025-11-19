<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AVUSCRIPT | Home</title>
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

        .article-count {
            background: rgba(255,255,255,0.25);
            backdrop-filter: blur(5px);
            padding: 18px;
            border-radius: var(--radius);
            text-align: center;
            margin: 1.5rem 0;
            border: 1px solid rgba(255,255,255,0.4);
            color: #fff;
            font-weight: 500;
        }
        .article-count strong { color: var(--gold); }

        /* ===== Navbar (Top Bar) ===== */
        .topbar {
            background-color: var(--deep-green);
            padding: 0;
            z-index: 1020; /* Above regular content */
        }
        .topbar .navbar-nav {
            /* Ensures proper centering */
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

        /* ===== Hero Slider ===== */
        #heroCarousel {
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        }
        #heroCarousel img {
            height: 60vh;
            min-height: 400px;
            max-height: 700px;
            object-fit: cover;
            filter: brightness(70%);
        }
        .carousel-caption {
            background: rgba(11, 86, 51, 0.85);
            border-radius: var(--radius);
            padding: 30px;
            max-width: 800px;
            margin: 0 auto;
            bottom: 15%;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
        }
        .carousel-caption h1 {
            color: var(--gold);
            font-family: 'Georgia', serif;
            font-weight: 800;
            font-size: clamp(30px, 5vw, 48px);
            text-shadow: 2px 2px 6px rgba(0,0,0,0.7);
            margin-bottom: 15px;
        }
        .carousel-caption p {
            color: #fff;
            font-size: clamp(16px, 2vw, 18px);
            line-height: 1.6;
        }
        .carousel-control-prev, .carousel-control-next { width: 8%; opacity: 1; }
        .carousel-control-prev-icon, .carousel-control-next-icon {
            background-color: rgba(255,255,255,0.9);
            border-radius: 50%;
            width: 50px;
            height: 50px;
            background-size: 50%;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }

        /* ===== Image Under Hero (Banner) ===== */
        .hero-secondary {
            background: var(--paper);
            padding: 40px 0;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }
        .banner-side {
            max-width: 100%;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            transition: var(--transition);
        }
        .banner-side:hover {
            transform: scale(1.01);
            box-shadow: 0 15px 40px rgba(11,74,57,0.15);
        }

        /* ===== Moving Article Invitation (Marquee) ===== */
        .invitation-section {
            background-color: var(--gold);
            border-top: 3px solid var(--deep-green);
            border-bottom: 3px solid var(--deep-green);
            overflow: hidden;
            white-space: nowrap;
            padding: 10px 0;
        }
        .invitation-text {
            display: inline-block;
            color: var(--deep-green);
            font-weight: 700;
            font-size: 16px;
            padding-left: 100%;
            animation: scroll-left 25s linear infinite;
        }
        @keyframes scroll-left {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100%); }
        }

        /* ===== Section Styling (Common) ===== */
        .section-padding { padding: 80px 0; }
        .section-heading {
            text-align: center;
            font-family: 'Georgia', serif;
            font-weight: 700;
            margin-bottom: 40px;
            position: relative;
            padding-bottom: 15px;
        }
        .section-heading::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 120px;
            height: 4px;
            background-color: var(--gold);
            border-radius: 2px;
        }

        /* ===== About Section ===== */
        .about { background-color: white; }
        .about h2 { color: var(--rust); }
        .about p {
            max-width: 1000px;
            margin: 0 auto 25px;
            font-size: 16px;
            text-align: justify;
        }
        .about a {
            color: var(--deep-green);
            font-weight: 600;
            text-decoration: none;
            transition: var(--transition);
        }
        .about a:hover { color: var(--rust); text-decoration: underline; }

        /* ===== Objectives Section ===== */
        .objectives { background-color: var(--paper); }
        .objectives h2 { color: var(--deep-green); }
        .objective-card {
            background: white;
            border-radius: var(--radius);
            padding: 30px;
            box-shadow: var(--shadow);
            height: 100%;
            transition: var(--transition);
            border-top: 5px solid var(--gold);
        }
        .objective-card:hover { transform: translateY(-5px); box-shadow: 0 15px 40px rgba(0,0,0,0.1); }
        .objective-card h4 {
            color: var(--deep-green);
            margin-bottom: 15px;
            font-family: 'Georgia', serif;
            font-weight: 600;
            font-size: 20px;
        }
        .objective-card .number {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            background-color: var(--gold);
            color: white;
            border-radius: 50%;
            margin-right: 10px;
            font-weight: bold;
            font-size: 1.2rem;
        }

        /* ===== Current Issue Section (Rust Background) ===== */
        .current-issue {
            background: linear-gradient(rgba(122, 75, 58, 0.9), rgba(122, 75, 58, 0.9)), url('https://img.freepik.com/premium-photo/blurred-vintage-paper-texture-background_10307-1536.jpg') no-repeat center center/cover;
            color: #fff;
        }
        .current-issue h2 { color: #fff; }
        .issue-block {
            background: rgba(255,255,255,0.1);
            border-radius: var(--radius);
            padding: 25px;
            margin-bottom: 20px;
            border-left: 5px solid var(--gold);
            transition: var(--transition);
        }
        .issue-block:hover { background: rgba(255,255,255,0.18); transform: translateX(5px); }
        .issue-block h4 { color: var(--gold); margin-bottom: 10px; font-weight: 600; }
        .issue-block strong { font-weight: 700; color: #fff; }
        .issue-block a {
            color: var(--cream);
            text-decoration: none;
            margin-right: 15px;
            padding: 6px 12px;
            background-color: rgba(255,255,255,0.15);
            border-radius: 6px;
            transition: var(--transition);
            font-size: 14px;
        }
        .issue-block a:hover {
            background-color: rgba(255,255,255,0.3);
            text-decoration: none;
            color: white;
        }

        /* ===== Author Guidelines ===== */
        .guidelines { background-color: white; }
        .guidelines h2 { color: var(--rust); }
        .guidelines-card {
            background: var(--paper);
            border-radius: var(--radius);
            padding: 30px;
            height: 100%;
            box-shadow: var(--shadow);
            border-top: 5px solid var(--leaf);
            transition: var(--transition);
        }
        .guidelines-card:hover { transform: translateY(-5px); box-shadow: 0 15px 40px rgba(0,0,0,0.1); }
        .guidelines-card h4 {
            color: var(--deep-green);
            margin-bottom: 15px;
            font-weight: 600;
        }
        .guidelines-card ul {
            padding-left: 20px;
            list-style: none;
        }
        .guidelines-card li {
            margin-bottom: 10px;
            position: relative;
            padding-left: 20px;
        }
        .guidelines-card li::before {
            content: "\f058"; /* Check-circle solid */
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            color: var(--leaf);
            position: absolute;
            left: 0;
        }

        /* ===== Call to Action (CTA) ===== */
        .cta-section {
            background-color: var(--deep-green);
            padding: 60px 0;
            color: white;
            text-align: center;
        }
        .cta-section h3 {
            margin-bottom: 30px;
            font-family: 'Georgia', serif;
            font-weight: 700;
            font-size: clamp(24px, 3vw, 36px);
        }
        .btn-cta {
            background-color: var(--gold);
            color: var(--deep-green) !important;
            font-weight: 700;
            padding: 12px 30px;
            border-radius: 50px;
            border: none;
            margin: 0 10px;
            text-decoration: none;
            transition: var(--transition);
        }
        .btn-cta:hover {
            background-color: white;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        .btn-cta-outline {
            background-color: transparent;
            color: white !important;
            border: 2px solid white;
            font-weight: 600;
            padding: 10px 28px;
            border-radius: 50px;
            margin: 0 10px;
            text-decoration: none;
            transition: var(--transition);
        }
        .btn-cta-outline:hover {
            background-color: white;
            color: var(--deep-green) !important;
            border-color: white;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        /* ===== Footer ===== */
        .footer {
            background-color: var(--deep-green);
            color: var(--cream);
            padding: 60px 0 20px;
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
            margin-top: 40px;
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
            .carousel-caption { padding: 20px; bottom: 5%; }
            .carousel-caption h1 { font-size: 32px; }
            .carousel-caption p { font-size: 16px; }
            .btn-cta, .btn-cta-outline { display: block; margin: 10px auto; width: 90%; }
        }

        @media (max-width: 768px) {
            .brand-bar .d-flex:last-child { display: none !important; } /* Hide ISSN/User on small screens */
            .logo-text { font-size: 24px; }
            .logo-subtitle { display: none; }
            .section-padding { padding: 50px 0; }
            #heroCarousel img { height: 350px; min-height: 300px; }
            .carousel-caption { max-width: 90%; padding: 15px; bottom: 5%; }
            .carousel-caption h1 { font-size: 24px; }
            .carousel-caption p { font-size: 14px; }
            .article-count { padding: 10px; margin: 1rem 0; font-size: 14px; }
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
        
        // Application context data
        Integer totalArticles = (Integer) application.getAttribute("totalArticles");
        Integer currentIssue = (Integer) application.getAttribute("currentIssue");
        String submissionDeadline = (String) application.getAttribute("submissionDeadline");
        
        // Initialize default values if null
        if (totalArticles == null) totalArticles = 0;
        if (currentIssue == null) currentIssue = 1;
        if (submissionDeadline == null) submissionDeadline = "March 31, 2025";
        
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
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">Submit Article</a></li>
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

    <section id="heroCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://media.post.rvohealth.io/wp-content/uploads/2024/02/Ayurvedic-header.jpg" class="d-block w-100" alt="Ayurveda Herbs">
                <div class="carousel-caption">
                    <h1>Welcome to AVUSCRIPT</h1>
                    <p>INTERNATIONAL JOURNAL FOR EMPIRICAL RESEARCH IN AYURVEDA</p>
                    
                    <div class="article-count">
                        <p class="mb-1"><strong>Total Articles Published:</strong> ${applicationScope.totalArticles}</p>
                        <p class="mb-0"><strong>Current Issue:</strong> Volume ${applicationScope.currentIssue}, 2024</p>
                    </div>
                    
                    <c:choose>
                        <c:when test="${sessionScope.userRole == 'admin'}">
                            <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-cta mt-3">Admin Panel <i class="fas fa-arrow-right ms-2"></i></a>
                        </c:when>
                        <c:when test="${sessionScope.userRole == 'author'}">
                            <a href="${pageContext.request.contextPath}/author/submit" class="btn btn-cta mt-3">Submit Article <i class="fas fa-upload ms-2"></i></a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/about" class="btn btn-cta mt-3">Learn More <i class="fas fa-info-circle ms-2"></i></a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="carousel-item">
                <img src="https://www.drjasnasayurveda.com/images/blog/image45.jpg" class="d-block w-100" alt="Ayurvedic Healing">
                <div class="carousel-caption">
                    <h1>Ancient Knowledge, Modern Science</h1>
                    <p>Bridging Ayurveda with Global Health Innovations</p>
                    
                    <c:choose>
                        <c:when test="${sessionScope.isLoggedIn}">
                            <p>Welcome back! Continue your research journey with us.</p>
                            <a href="${pageContext.request.contextPath}/submit-article" class="btn btn-cta mt-3">Submit Your Research <i class="fas fa-flask ms-2"></i></a>
                        </c:when>
                        <c:otherwise>
                            <p>Join our community of Ayurvedic researchers and scholars.</p>
                            <a href="${pageContext.request.contextPath}/register" class="btn btn-cta mt-3">Become an Author <i class="fas fa-user-plus ms-2"></i></a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="carousel-item">
                <img src="https://assets.clevelandclinic.org/transform/LargeFeatureImage/2d536049-b17c-4b88-b1e3-85f78f7d9fea/Ayurveda-173877738-770x533-1_jpg" class="d-block w-100" alt="Ayurveda Research">
                <div class="carousel-caption">
                    <h1>Empowering Ayurvedic Research</h1>
                    <p>Publishing authentic and evidence-based Ayurvedic studies</p>
                    <p><strong>Submission Deadline:</strong> ${applicationScope.submissionDeadline}</p>
                    
                    <c:choose>
                        <c:when test="${sessionScope.isLoggedIn}">
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-cta mt-3">Submit Article <i class="fas fa-paper-plane ms-2"></i></a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/register" class="btn btn-cta mt-3">Register to Submit <i class="fas fa-lock ms-2"></i></a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>

        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </section>

    <section class="hero-secondary">
        <div class="container-main text-center">
            <img src="${pageContext.request.contextPath}/images/banner-side.jpg" alt="Ayurvedic Banner" class="img-fluid banner-side">
        </div>
    </section>

    <div class="invitation-section">
        <div class="invitation-text">
            <i class="fas fa-star me-2"></i> Article Invitation: Articles are invited for <strong>Jan – March 2025 issue</strong> | Submission Deadline: ${applicationScope.submissionDeadline} <i class="fas fa-star ms-2"></i>
        </div>
    </div>

    <section class="about section-padding">
        <div class="container-main">
            <h2 class="section-heading">Welcome To AVUSCRIPT</h2>
            <p>
                AVUSCRIPT is an **International, peer-reviewed, Quarterly Journal** dedicated to the publication of research in Ayurveda. It serves as the official 
                publication of the **Ayurveda Research and Career Academy (ARCA)**. The full text of the journal is freely accessible on our website 
                <a href="http://www.ayuscript.com/" target="_blank">www.ayuscript.com</a>. We operate on an **open-access** model, allowing authors to self-archive the final accepted version of their articles on any OAI-compliant repository. This journal is committed to promoting original research, education, and the propagation 
                of Ayurveda on both national and international platforms.
            </p>
            <p>
                **About ARCA:** Ayurveda Research & Career Academy (ARCA) was founded with the mission to develop essential research skills, particularly among undergraduate and postgraduate students in the field of Indian System of Medicine (AYUSH). While India boasts a large infrastructure for Indian Medicine, the scientific validation of many traditional therapies often remains to be done on a wider scale. ARCA provides a critical platform for emerging Ayurveda aspirants, encouraging research work through active assistance from a team of seasoned experts.
            </p>
            <p>
                ARCA has initiated a series of programs and interventions, offering training and support to acquire profound knowledge of **research methodology** specific to the field of Ayurveda (<a href="http://www.ayuscript.com/" target="_blank">www.ayuscript.com</a>).
            </p>
            <div class="text-center mt-5">
                <a href="${pageContext.request.contextPath}/about" class="btn btn-cta-outline">Read The Full Story <i class="fas fa-book-open ms-2"></i></a>
            </div>
        </div>
    </section>

    <hr class="m-0">

    <section class="objectives section-padding">
        <div class="container-main">
            <h2 class="section-heading" style="color: var(--deep-green);">Our Core Objectives</h2>
            <div class="row g-4">
                <div class="col-md-6 col-lg-4">
                    <div class="objective-card">
                        <h4><span class="number">1</span> Promote Empirical Research</h4>
                        <p>To promote empirical research in Ayurveda, including rigorous clinical trials and drug research for evidence-based scientific validation.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="objective-card">
                        <h4><span class="number">2</span> Bridge Traditional & Modern Science</h4>
                        <p>To meet present-day requirements by incorporating advances of basic sciences research, ensuring Ayurveda serves global healthcare needs.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="objective-card">
                        <h4><span class="number">3</span> Increase AYUSH Visibility</h4>
                        <p>To significantly increase the global visibility and awareness of AYUSH's scientific contributions through high-quality, peer-reviewed publications.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="objective-card">
                        <h4><span class="number">4</span> Encourage Original Research</h4>
                        <p>To actively encourage Ayurveda scholars to conduct and publish original research grounded in classical theory and fundamental Ayurvedic principles.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="objective-card">
                        <h4><span class="number">5</span> Develop Human Resources</h4>
                        <p>To foster the development of prospective Human Resources in Indian Medical Systems with a strong scientific aptitude and professional research expertise.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="objective-card">
                        <h4><span class="number">6</span> Knowledge Dissemination</h4>
                        <p>To efficiently disseminate authentic Ayurvedic knowledge worldwide through open-access publishing models and various focused educational initiatives.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <hr class="m-0">

    <section class="current-issue section-padding">
        <div class="container-main">
            <h2 class="section-heading">Current Issue Highlights</h2>

            <div class="issue-block">
                <div class="d-flex flex-wrap mb-2 fs-6">
                    <span class="me-3"><i class="fas fa-calendar-alt me-1"></i> <strong>Year:</strong> 2025</span>
                    <span class="me-3"><i class="fas fa-layer-group me-1"></i> <strong>Volume:</strong> 4</span>
                    <span class="me-3"><i class="fas fa-file-alt me-1"></i> <strong>Issue:</strong> 03</span>
                    <span><i class="fas fa-list-ol me-1"></i> <strong>Pages:</strong> 1-5</span>
                </div>
                <h4>Udvartan with Kolkulathadi churna in management of Sthaulya: A case study</h4>
                <p class="mb-3"><strong>Author:</strong> Ajmera N.</p>
                <div class="d-flex flex-wrap">
                    <a href="abstractPage?id=176" target="_blank" class="mb-2 mb-md-0"><i class="fas fa-eye me-1"></i> ABSTRACT</a> 
                    <a href="htmlFullText?id=176" target="_blank" class="mb-2 mb-md-0"><i class="fas fa-book-open me-1"></i> HTML Full Text</a> 
                    <a href="submission/ad_43542.pdf" target="_blank"><i class="fas fa-download me-1"></i> Download (PDF)</a>
                </div>
            </div>

            <div class="issue-block">
                <div class="d-flex flex-wrap mb-2 fs-6">
                    <span class="me-3"><i class="fas fa-calendar-alt me-1"></i> <strong>Year:</strong> 2025</span>
                    <span class="me-3"><i class="fas fa-layer-group me-1"></i> <strong>Volume:</strong> 4</span>
                    <span class="me-3"><i class="fas fa-file-alt me-1"></i> <strong>Issue:</strong> 02</span>
                    <span><i class="fas fa-list-ol me-1"></i> <strong>Pages:</strong> 69-75</span>
                </div>
                <h4>Pathogenesis of Mutraghata and Mutrashmari & its preventive Management</h4>
                <p class="mb-3"><strong>Author:</strong> Airi K.</p>
                <div class="d-flex flex-wrap">
                    <a href="abstractPage?id=174" target="_blank" class="mb-2 mb-md-0"><i class="fas fa-eye me-1"></i> ABSTRACT</a> 
                    <a href="htmlFullText?id=174" target="_blank" class="mb-2 mb-md-0"><i class="fas fa-book-open me-1"></i> HTML Full Text</a> 
                    <a href="submission/ad_42347.pdf" target="_blank"><i class="fas fa-download me-1"></i> Download (PDF)</a>
                </div>
            </div>

            <div class="text-center mt-5">
                <a href="${pageContext.request.contextPath}/current-issue" class="btn btn-cta">Explore All Current Articles <i class="fas fa-chevron-circle-right ms-2"></i></a>
            </div>
        </div>
    </section>

    <hr class="m-0">

    <section class="guidelines section-padding">
        <div class="container-main">
            <h2 class="section-heading">Author Guidelines</h2>
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="guidelines-card">
                        <h4>Manuscript Preparation</h4>
                        <ul>
                            <li>Manuscripts must be in **English** and follow a clear, concise structure.</li>
                            <li>Include a descriptive title, full author names, and affiliations.</li>
                            <li>The abstract should be **structured** (e.g., Background, Methods, Results, Conclusion) and no more than 250 words.</li>
                            <li>Use Vancouver citation style for all references.</li>
                            <li>Ensure all Ayurvedic terms are accurately transliterated and explained.</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="guidelines-card">
                        <h4>Submission Process</h4>
                        <ul>
                            <li>All submissions must be made **online** through our submission portal.</li>
                            <li>Include a **cover letter** stating the manuscript is original and not under consideration elsewhere.</li>
                            <li>Ensure the manuscript is completely anonymized for **double-blind peer review**.</li>
                            <li>Provide ethical approval/consent details for all studies involving human subjects or animals.</li>
                            <li>Review time is typically **4-6 weeks**. Accepted articles are published promptly.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="text-center mt-5">
                <a href="${pageContext.request.contextPath}/author-guideline" class="btn btn-cta-outline">View Complete Guidelines <i class="fas fa-file-alt ms-2"></i></a>
            </div>
        </div>
    </section>

    <hr class="m-0">

    <section class="cta-section">
        <div class="container-main">
            <h3 class="mb-4">Ready to Publish Your Ayurvedic Research?</h3>
            <p class="lead">Submit your high-quality, empirical research article today and contribute to the advancement of Ayurveda.</p>
            <div class="mt-4">
                <a href="${pageContext.request.contextPath}/submit-article" class="btn btn-cta">Submit Article Now <i class="fas fa-upload ms-2"></i></a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-cta-outline">Register as Author <i class="fas fa-user-plus ms-2"></i></a>
            </div>
        </div>
    </section>

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
                        <li><a href="${pageContext.request.contextPath}/published_list">Current Issue</a></li>
                        
                    </ul>
                </div>

                <div class="col-6 col-lg-3">
                    <h5>Author Zone</h5>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/login">Submit Article</a></li>
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