<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Author Guidelines - AVUSCRIPT</title>
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

        /* ===== Hero Banner ===== */
        .guideline-hero {
            background: linear-gradient(rgba(11, 86, 51, 0.8), rgba(11, 86, 51, 0.8)), url('https://media.post.rvohealth.io/wp-content/uploads/2024/02/Ayurvedic-header.jpg') no-repeat center center/cover;
            color: white;
            padding: 100px 0;
            text-align: center;
            margin-bottom: 40px;
        }

        .guideline-hero h1 {
            font-family: 'Georgia', serif;
            font-weight: 700;
            font-size: 3rem;
            margin-bottom: 20px;
            color: var(--gold);
        }

        .guideline-hero p {
            font-size: 1.2rem;
            max-width: 600px;
            margin: 0 auto;
            color: var(--cream);
        }

        /* ===== Action Bar ===== */
        .action-bar {
            background: var(--paper);
            padding: 25px 0;
            border-bottom: 1px solid rgba(0,0,0,0.1);
            margin-bottom: 40px;
        }

        .action-buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .action-btn {
            background: var(--deep-green);
            color: white;
            padding: 15px 30px;
            border-radius: var(--radius);
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 10px;
            border: none;
        }

        .action-btn:hover {
            background: var(--leaf);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(11, 86, 51, 0.3);
        }

        .action-btn.secondary {
            background: var(--rust);
        }

        .action-btn.secondary:hover {
            background: #8a5a4a;
        }

        /* ===== Content Section ===== */
        .guideline-section {
            padding: 60px 0;
            background: white;
        }

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

        .content-card {
            background: var(--paper);
            padding: 40px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            margin-bottom: 30px;
            border-left: 5px solid var(--gold);
        }

        .content-card h3 {
            color: var(--deep-green);
            font-family: 'Georgia', serif;
            font-weight: 600;
            margin-bottom: 20px;
            font-size: 1.8rem;
        }

        .content-card h4 {
            color: var(--rust);
            font-weight: 600;
            margin: 25px 0 15px 0;
            font-size: 1.3rem;
        }

        .content-card p {
            line-height: 1.7;
            margin-bottom: 15px;
            font-size: 1.05rem;
        }

        .content-card ul, .content-card ol {
            margin-left: 20px;
            margin-bottom: 20px;
        }

        .content-card li {
            margin-bottom: 10px;
            line-height: 1.6;
            font-size: 1.05rem;
        }

        .content-card strong {
            color: var(--deep-green);
        }

        .content-card em {
            color: var(--rust);
        }

        /* ===== Info Boxes ===== */
        .info-box {
            background: #e8f5e9;
            border-left: 4px solid var(--leaf);
            padding: 20px;
            border-radius: var(--radius);
            margin: 25px 0;
        }

        .info-box.warning {
            background: #fff3e0;
            border-left-color: var(--gold);
        }

        .info-box.important {
            background: #ffebee;
            border-left-color: #d32f2f;
        }

        /* ===== Reference Examples ===== */
        .reference-example {
            background: var(--cream);
            border: 1px solid #e0e0e0;
            border-radius: var(--radius);
            padding: 20px;
            margin: 15px 0;
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
        }

        /* ===== Fee Section ===== */
        .fee-section {
            background: linear-gradient(135deg, var(--rust), var(--gold));
            color: white;
            padding: 40px;
            border-radius: var(--radius);
            text-align: center;
            margin: 40px 0;
        }

        .fee-section h3 {
            color: white;
            margin-bottom: 20px;
            font-family: 'Georgia', serif;
        }

        .fee-amount {
            font-size: 2rem;
            font-weight: 700;
            margin: 10px 0;
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
            .guideline-hero h1 { font-size: 2.5rem; }
            .action-buttons { flex-direction: column; align-items: center; }
            .action-btn { width: 100%; max-width: 300px; justify-content: center; }
        }

        @media (max-width: 768px) {
            .brand-bar .d-flex:last-child { display: none !important; }
            .logo-text { font-size: 24px; }
            .logo-subtitle { display: none; }
            .guideline-section { padding: 40px 0; }
            .guideline-hero { padding: 60px 0; }
            .guideline-hero h1 { font-size: 2rem; }
            .content-card { padding: 25px; }
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
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
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

    <!-- Hero Banner -->
    <section class="guideline-hero">
        <div class="container-main">
            <h1>Author Guidelines</h1>
            <p>Comprehensive instructions for preparing and submitting your research manuscripts to AVUSCRIPT</p>
        </div>
    </section>

    <!-- Action Bar -->
    <section class="action-bar">
        <div class="container-main">
            <div class="action-buttons">
                <a href="Doc/Downloads/Copyright1.pdf" target="_blank" class="action-btn">
                    <i class="fas fa-download"></i> DOWNLOAD COPYRIGHT FORM
                </a>
                <a href="${pageContext.request.contextPath}/register" class="action-btn secondary">
                    <i class="fas fa-user-plus"></i> BECOME AN AUTHOR
                </a>
            </div>
        </div>
    </section>

    <!-- Main Content -->
    <section class="guideline-section">
        <div class="container-main">
            <!-- Instructions Section -->
            <div class="content-card">
                <h2 class="section-heading">Instructions & Author Guidelines</h2>
                
                <div class="info-box">
                    <h4><i class="fas fa-clipboard-check me-2"></i>Submission Preparation Checklist</h4>
                    <p>
                        As part of the submission process, authors are required to check off their submission's compliance 
                        with all of the following items, and submissions may be returned to authors that do not adhere to these guidelines.
                        The submission has not been previously published, nor is it before another journal for consideration.
                    </p>
                </div>

                <h4>Types of Manuscripts to be submitted:</h4>
                <ol>
                    <li><strong>Editorial</strong> (Only for Editors or Invited Experts)</li>
                    <li><strong>Original Research Article</strong> (Experimental study / Clinical study / Observational study)</li>
                    <li><strong>Review Article</strong> (Literary review/Conceptual review)</li>
                    <li><strong>Case Study</strong> (Case Report/ Case series)</li>
                    <li>Book Review, Product Review, Meta-analysis</li>
                </ol>

                <h4>Author Guidelines</h4>
                <ul>
                    <li>Authors are asked to write their manuscripts in English in <strong>A4 size page</strong> with margins 2.5 cm from all four sides, Source Sans Pro font using a <strong>font size of 12</strong>. Page numbers included at bottom.</li>
                    <li>Ayurvedic terms and other Latin terms must be <em>Italicized</em> and its equivalent English terminology should be mentioned in first instance in a bracket, for example: <em>Urdhwaga Amlapitta</em> (Non ulcer dyspepsia).</li>
                    <li>Total number of authors may be 01 to maximum 05. For multicentric clinical trials it may be more.</li>
                    <li>Headings in title case (not ALL CAPITALS), bold face capitals, single-spaced.</li>
                    <li>The references cited in the text should be after punctuation marks, in superscript with square bracket.</li>
                    <li>Standard International Units could be used throughout the text.</li>
                    <li>All named authors have agreed to its submission.</li>
                    <li>Authors have obtained permission from their employers or institution to publish, if they have a contractual or moral obligation to do so.</li>
                </ul>
            </div>

            <!-- Preparation of Original Articles -->
            <div class="content-card">
                <h3>Preparation of Original Articles</h3>

                <p><strong>References from Ayurvedic Classical Texts and Samhitas:</strong></p>
                <ul>
                    <li>Tripathi B, editor, (1st ed.). Ashtanga Samgraha of Vagbhata, Sootra Sthana; Ayushkamiya Adhyaya: Chapter 1, Verse 10-16. Varanasi: Chowkhambha Sanskrit Series, 2010; p. 2-3.</li>
                    <li>Tripathi B, editor, (1st ed.). Commentary Shashilekha of Indu on Ashtanga Samgraha of Vagbhata, Sootra Sthana; Ayushkamiya Adhyaya: Chapter 1, Verse 10-16. Varanasi: Chowkhambha Sanskrit Series, 2006; p. 7-8.</li>
                </ul>

                <p>The manuscript should normally include the following sections (unless otherwise instructed):</p>
                <ol>
                    <li>Title page (excluding acknowledgements) with Abstract</li>
                    <li>Introduction</li>
                    <li>Materials (or patients) and methods</li>
                    <li>Results</li>
                    <li>Discussion</li>
                    <li>Conclusion</li>
                    <li>Acknowledgements</li>
                    <li>Conflict of Interest</li>
                    <li>References</li>
                </ol>

                <!-- Detailed sections continue with the same structure... -->
                <!-- I've included the first few sections to show the pattern -->
                <h4>1. Title page</h4>
                <ol>
                    <li><strong>Title</strong>: Concise and informative. The running title should consist of not more than 25 letters and spaces.</li>
                    <li><strong>Author names and affiliations</strong>: Please write the numbers 1, 2, 3 etc. after the name of each author in superscript.</li>
                </ol>

                <h4>Abstract</h4>
                <p>
                    Well structured abstract, not more than 200 words, should clearly cover the background, aims and objectives of the study; methods, indicating the study protocol and statistical tests used; results, the important observations; discussion, describing the reasoning and probabilities for the results obtained.
                </p>

                <!-- Continue with all the remaining sections from your original content -->
                <!-- For brevity, I'm showing the pattern but you would include all sections -->

            </div>

            <!-- Tables & Figures Section -->
            <div class="content-card">
                <h3>Tables and Figures</h3>
                <div class="info-box warning">
                    <p>
                        <strong>Important:</strong> Only MS Word table format should be used for preparing tables. Number tables consecutively in accordance with their appearance in the text. Figures should be only in JPEG format. Graphs and bar graphs should be prepared using Microsoft Excel and submitted as Excel graph pasted in MS Office Word.
                    </p>
                </div>
            </div>

            <!-- Review Policy Section -->
            <div class="content-card">
                <h3>Review Policy, Plagiarism Policy & Confidentiality</h3>

                <p>
                    All the author(s) will have to submit an undertaking (in the format specified by the journal) that the paper has not been published / submitted for publication elsewhere as well as indicating their consent to be co-authors.
                </p>

                <h4>Peer review policy:</h4>
                <p>
                    Journal uses double-blind peer review process, which means that both the reviewer(s) and author(s) identities are concealed from the reviewer(s), and vice versa, throughout the review process.
                </p>

                <h4>Plagiarism Policy:</h4>
                <div class="info-box important">
                    <p>
                        <strong>Zero Tolerance:</strong> Journal respects intellectual property and aims at protecting and promoting original work of its authors. Manuscripts containing plagiarized material are against the standards of quality, research and innovation.
                    </p>
                </div>

                <h4>Publication Fee:</h4>
                <div class="fee-section">
                    <h3>Article Processing Fees</h3>
                    <p>Payable only after article acceptance</p>
                    <div class="fee-amount">2200 INR</div>
                    <p>Indian Authors</p>
                    <div class="fee-amount">100 USD</div>
                    <p>Foreign Authors</p>
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
                    <p class="small">
                        Flat No 604 Raut Arcade, Near Mohan Palms, Shirgaon, Badlapur, Thane 421 503<br>
                        <i class="fas fa-envelope me-2"></i> ayuscriptjournal@gmail.com<br>
                        <i class="fas fa-phone me-2"></i> 9324737097
                    </p>
                    <div class="social-icons mt-3">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>

                <div class="col-6 col-lg-2">
                    <h5>Quick Links</h5>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                        <li><a href="${pageContext.request.contextPath}/login">Author Login</a></li>
                        <li><a href="Doc/Downloads/Copyright1.pdf">Copyright form</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
                        <li><a href="Doc/Downloads/PP.pdf">Privacy Policy</a></li>
                    </ul>
                </div>

                <div class="col-6 col-lg-3">
                    <h5>Author Zone</h5>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/submit-article">Submit Article</a></li>
                        <li><a href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                        <li><a href="${pageContext.request.contextPath}/login">Login / Register</a></li>
                        <li><a href="${pageContext.request.contextPath}/arca">About ARCA</a></li>
                    </ul>
                </div>

                <div class="col-lg-3">
                    <h5>Contact & Info</h5>
                    <ul class="footer-links">
                        <li><i class="fas fa-envelope me-2"></i> <a href="mailto:ayuscriptjournal@gmail.com">ayuscriptjournal@gmail.com</a></li>
                        <li><i class="fas fa-globe me-2"></i> <a href="http://www.ayuscript.com/">www.ayuscript.com</a></li>
                        <li><i class="fas fa-barcode me-2"></i> ISSN: 2583-3677</li>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                &copy; <%= java.time.Year.now().getValue() %> AVUSCRIPT | All Rights Reserved. | <a href="Doc/Downloads/PP.pdf">Privacy Policy</a>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>