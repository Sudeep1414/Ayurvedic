<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Current Issue - AVUSCRIPT</title>
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

        /* ===== Section Styling ===== */
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

        /* ===== Current Issue Content ===== */
        .current-issue-section { background-color: white; }
        .current-issue-section h2 { color: var(--rust); }

        .issue-header {
            background: linear-gradient(rgba(122, 75, 58, 0.9), rgba(122, 75, 58, 0.9)), url('https://img.freepik.com/premium-photo/blurred-vintage-paper-texture-background_10307-1536.jpg') no-repeat center center/cover;
            color: #fff;
            padding: 60px 0;
            text-align: center;
            border-radius: var(--radius);
            margin-bottom: 40px;
        }

        .issue-header h1 {
            color: #fff;
            font-family: 'Georgia', serif;
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        .issue-header .lead {
            color: var(--gold);
            font-size: 1.3rem;
            font-weight: 600;
        }

        .search-section {
            background: var(--paper);
            padding: 30px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            margin-bottom: 40px;
        }

        .search-form {
            display: flex;
            gap: 15px;
            max-width: 800px;
            margin: 0 auto;
        }

        .search-input {
            flex: 1;
            padding: 15px 20px;
            border: 2px solid #e0e0e0;
            border-radius: 50px;
            font-size: 1rem;
            transition: var(--transition);
        }

        .search-input:focus {
            outline: none;
            border-color: var(--leaf);
            box-shadow: 0 0 0 3px rgba(43, 138, 95, 0.1);
        }

        .search-btn {
            background: var(--deep-green);
            color: white;
            padding: 15px 35px;
            border: none;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            white-space: nowrap;
        }

        .search-btn:hover {
            background: var(--leaf);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(11, 86, 51, 0.3);
        }

        /* ===== Articles List ===== */
        .articles-section {
            background: white;
            padding: 40px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
        }

        .section-title {
            color: var(--deep-green);
            font-family: 'Georgia', serif;
            font-weight: 700;
            font-size: 2rem;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 3px solid var(--gold);
        }

        .article-list {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .article-item {
            background: var(--paper);
            padding: 30px;
            border: 2px solid #e8f5e8;
            border-radius: var(--radius);
            transition: var(--transition);
            border-left: 5px solid var(--gold);
        }

        .article-item:hover {
            border-color: var(--leaf);
            box-shadow: 0 8px 25px rgba(43, 138, 95, 0.15);
            transform: translateY(-3px);
        }

        .article-title {
            color: var(--deep-green);
            font-size: 1.4rem;
            font-weight: 600;
            margin-bottom: 10px;
            text-decoration: none;
            display: block;
            font-family: 'Georgia', serif;
            transition: var(--transition);
        }

        .article-title:hover {
            color: var(--rust);
        }

        .article-meta {
            color: var(--rust);
            font-size: 0.95rem;
            margin-bottom: 15px;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            align-items: center;
        }

        .article-authors {
            font-weight: 600;
            color: var(--text);
        }

        .article-abstract {
            color: var(--text);
            line-height: 1.7;
            margin-bottom: 20px;
            font-size: 1rem;
        }

        .article-actions {
            display: flex;
            gap: 15px;
            align-items: center;
            flex-wrap: wrap;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 0.95rem;
        }

        .btn-abstract {
            background: #3498db;
            color: white;
        }

        .btn-abstract:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
        }

        .btn-html {
            background: #2ecc71;
            color: white;
        }

        .btn-html:hover {
            background: #27ae60;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
        }

        .btn-pdf {
            background: #e74c3c;
            color: white;
        }

        .btn-pdf:hover {
            background: #c0392b;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.3);
        }

        .doi-badge {
            background: #e3f2fd;
            color: #1565c0;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-family: monospace;
            font-weight: 500;
        }

        .no-articles {
            text-align: center;
            color: var(--rust);
            padding: 60px 20px;
            font-style: italic;
            background: var(--paper);
            border-radius: var(--radius);
        }

        .no-articles h3 {
            color: var(--deep-green);
            margin-bottom: 15px;
            font-family: 'Georgia', serif;
        }

        /* ===== Pagination ===== */
        .pagination {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-top: 40px;
        }

        .pagination-btn {
            padding: 12px 20px;
            border: 2px solid var(--deep-green);
            background: white;
            color: var(--deep-green);
            text-decoration: none;
            border-radius: 6px;
            transition: var(--transition);
            font-weight: 600;
        }

        .pagination-btn:hover {
            background: var(--deep-green);
            color: white;
            transform: translateY(-2px);
        }

        .pagination-btn.active {
            background: var(--deep-green);
            color: white;
            border-color: var(--deep-green);
        }

        /* ===== Footer ===== */
        .footer {
            background-color: var(--deep-green);
            color: var(--cream);
            padding: 60px 0 20px;
            margin-top: 60px;
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
            .search-form { flex-direction: column; }
            .search-btn { width: 100%; }
        }

        @media (max-width: 768px) {
            .brand-bar .d-flex:last-child { display: none !important; }
            .logo-text { font-size: 24px; }
            .logo-subtitle { display: none; }
            .section-padding { padding: 50px 0; }
            .articles-section { padding: 25px; }
            .article-item { padding: 20px; }
            .article-actions { flex-direction: column; align-items: flex-start; }
            .article-actions .btn { width: 100%; justify-content: center; }
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
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                  
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

    <!-- Current Issue Content -->
    <section class="current-issue-section section-padding">
        <div class="container-main">
            <!-- Issue Header -->
            <div class="issue-header">
                <h1>Current Issue</h1>
                <p class="lead">January - March 2025 | Volume ${applicationScope.currentIssue}, Issue 1</p>
                <p>Total Articles Published: <strong>${applicationScope.totalArticles}</strong></p>
            </div>

            <!-- Search Section -->
            <div class="search-section">
                <form class="search-form">
                    <input type="text" class="search-input" placeholder="Search articles by title, author, or keywords...">
                    <button type="submit" class="search-btn">
                        <i class="fas fa-search me-2"></i> Search
                    </button>
                </form>
            </div>

            <!-- Articles List -->
            <div class="articles-section">
                <h2 class="section-title">Published Articles</h2>
                
                <c:choose>
                    <c:when test="${not empty publishedArticles}">
                        <div class="article-list">
                            <c:forEach var="article" items="${publishedArticles}">
                                <div class="article-item">
                                    <div class="article-title">${article.title}</div>
                                    <div class="article-meta">
                                        <span class="article-authors">
                                            <i class="fas fa-user me-1"></i> ${article.author.fullName}
                                        </span> 
                                        <span>
                                            <i class="fas fa-calendar me-1"></i> Published: ${article.updatedAt}
                                        </span>
                                    </div>
                                    <p class="article-abstract">
                                        <c:choose>
                                            <c:when test="${not empty article.content && article.content.length() > 200}">
                                                ${article.content.substring(0, 200)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${article.content}
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                   <div class="article-actions">
    <a href="${pageContext.request.contextPath}/published/abstract/${article.id}" class="btn btn-abstract" target="_blank">
        <i class="fas fa-eye me-1"></i> Abstract
    </a>
    <a href="${pageContext.request.contextPath}/published/html/${article.id}" class="btn btn-html" target="_blank">
        <i class="fas fa-file-alt me-1"></i> HTML Full Text
    </a>
    <a href="${pageContext.request.contextPath}/published/pdf/${article.id}" class="btn btn-pdf">
        <i class="fas fa-download me-1"></i> PDF
    </a>
</div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="no-articles">
                            <h3>No articles published yet.</h3>
                            <p>Check back later for published research articles.</p>
                            <a href="${pageContext.request.contextPath}/submit-article" class="btn btn-pdf mt-3">
                                <i class="fas fa-upload me-1"></i> Submit Your Article
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>

                <!-- Pagination -->
                <div class="pagination">
                    <a href="#" class="pagination-btn active">1</a>
                    <a href="#" class="pagination-btn">2</a>
                    <a href="#" class="pagination-btn">3</a>
                    <a href="#" class="pagination-btn">Next <i class="fas fa-chevron-right ms-1"></i></a>
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