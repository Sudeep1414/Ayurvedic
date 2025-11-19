<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us | AYUJOURNAL</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap + Font Awesome -->
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
          --shadow: 0 10px 30px rgba(11,74,57,0.06);
          --radius: 12px;
        }

        body {
          font-family: 'Segoe UI', sans-serif;
          background-color: var(--cream);
          color: var(--text);
          margin: 0;
          padding: 0;
        }

        /* ===== Header Bar ===== */
        .brand-bar {
          background-color: var(--paper);
          box-shadow: var(--shadow);
          padding: 10px 0;
          border-bottom: 3px solid var(--deep-green);
        }
        .logo-text {
          font-family: 'Georgia', serif;
          font-weight: bold;
          color: var(--deep-green);
          font-size: 32px;
          text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        /* ===== Navbar ===== */
        .topbar {
          background-color: var(--deep-green);
          padding: 0;
        }
        .topbar .nav-link {
          color: #fff !important;
          font-weight: 600;
          text-transform: uppercase;
          transition: 0.3s;
          font-size: 15px;
          padding: 15px 20px !important;
          position: relative;
        }
        .topbar .nav-link:hover {
          color: var(--gold) !important;
          background-color: rgba(255,255,255,0.1);
        }
        .topbar .nav-link::after {
          content: '';
          position: absolute;
          bottom: 0;
          left: 20px;
          right: 20px;
          height: 3px;
          background-color: var(--gold);
          transform: scaleX(0);
          transition: transform 0.3s ease;
        }
        .topbar .nav-link:hover::after {
          transform: scaleX(1);
        }
        .topbar .nav-link.active {
          color: var(--gold) !important;
        }
        .topbar .nav-link.active::after {
          transform: scaleX(1);
        }

        /* ===== Page Header ===== */
        .page-header {
  background: linear-gradient(rgba(11, 86, 51, 0.7), rgba(43, 138, 95, 0.7)),
              url('https://d29rsonz3qynlj.cloudfront.net/joyful_lemur_21286_Close_up_of_Ayurvedic_herbs_Triphala_Guggu_1ebd2889_f72d_40ba_8afb_1db34ca5d161_113bf60414.jpeg');
  background-size: cover;
  background-position: center;
  color: white;
  padding: 100px 0;
  text-align: center;
}

        .page-header h1 {
            font-family: 'Georgia', serif;
            font-size: 48px;
            margin-bottom: 20px;
            color: var(--gold);
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }
        .page-header .breadcrumb {
            background: transparent;
            justify-content: center;
            margin-bottom: 0;
        }
        .page-header .breadcrumb-item a {
            color: var(--gold);
            text-decoration: none;
        }
        .page-header .breadcrumb-item.active {
            color: white;
        }

        /* ===== About Sections ===== */
        .about-section {
            padding: 80px 0;
            background-color: white;
        }
        .about-section h2 {
            color: var(--rust);
            font-family: 'Georgia', serif;
            font-weight: bold;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 15px;
        }
        .about-section h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 80px;
            height: 3px;
            background-color: var(--gold);
        }
        .about-section p {
            line-height: 1.8;
            font-size: 17px;
            margin-bottom: 20px;
        }

        /* ===== Mission Vision Section ===== */
        .mission-vision {
            padding: 80px 0;
            background-color: var(--paper);
        }
        .mv-card {
            background: white;
            border-radius: var(--radius);
            padding: 40px 30px;
            box-shadow: var(--shadow);
            height: 100%;
            text-align: center;
            transition: transform 0.3s ease;
            border-top: 4px solid var(--gold);
        }
        .mv-card:hover {
            transform: translateY(-10px);
        }
        .mv-card i {
            font-size: 48px;
            color: var(--deep-green);
            margin-bottom: 20px;
        }
        .mv-card h3 {
            color: var(--rust);
            font-family: 'Georgia', serif;
            margin-bottom: 20px;
        }

        /* ===== Timeline Section ===== */
        .timeline-section {
            padding: 80px 0;
            background-color: white;
        }
        .timeline {
            position: relative;
            max-width: 1200px;
            margin: 0 auto;
        }
        .timeline::after {
            content: '';
            position: absolute;
            width: 6px;
            background-color: var(--leaf);
            top: 0;
            bottom: 0;
            left: 50%;
            margin-left: -3px;
        }
        .timeline-item {
            padding: 10px 40px;
            position: relative;
            width: 50%;
            box-sizing: border-box;
        }
        .timeline-item::after {
            content: '';
            position: absolute;
            width: 25px;
            height: 25px;
            right: -13px;
            background-color: white;
            border: 4px solid var(--gold);
            top: 15px;
            border-radius: 50%;
            z-index: 1;
        }
        .left {
            left: 0;
        }
        .right {
            left: 50%;
        }
        .right::after {
            left: -13px;
        }
        .timeline-content {
            padding: 20px 30px;
            background-color: var(--paper);
            position: relative;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
        }
        .timeline-content h4 {
            color: var(--deep-green);
            margin-bottom: 10px;
        }
        .timeline-content .year {
            color: var(--gold);
            font-weight: bold;
            font-size: 18px;
        }

        /* ===== Team Section ===== */
        .team-section {
            padding: 80px 0;
            background-color: var(--paper);
        }
        .team-card {
            background: white;
            border-radius: var(--radius);
            padding: 30px;
            box-shadow: var(--shadow);
            text-align: center;
            transition: transform 0.3s ease;
            margin-bottom: 30px;
        }
        .team-card:hover {
            transform: translateY(-10px);
        }
        .team-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid var(--gold);
            margin: 0 auto 20px;
        }
        .team-card h4 {
            color: var(--deep-green);
            margin-bottom: 5px;
        }
        .team-card .position {
            color: var(--rust);
            font-weight: 600;
            margin-bottom: 15px;
        }

        /* ===== Stats Section ===== */
        .stats-section {
            padding: 80px 0;
            background: linear-gradient(rgba(123, 75, 58, 0.85), rgba(123, 75, 58, 0.85)), url('https://img.freepik.com/premium-photo/blurred-vintage-paper-texture-background_10307-1536.jpg');
            color: white;
            text-align: center;
        }
        .stat-item {
            margin-bottom: 30px;
        }
        .stat-number {
            font-size: 48px;
            font-weight: bold;
            color: var(--gold);
            display: block;
        }
        .stat-label {
            font-size: 18px;
            text-transform: uppercase;
        }

        /* ===== Partners Section ===== */
        .partners-section {
            padding: 80px 0;
            background-color: white;
        }
        .partner-logo {
            max-width: 200px;
            filter: grayscale(100%);
            transition: filter 0.3s ease;
            margin: 0 auto;
        }
        .partner-logo:hover {
            filter: grayscale(0%);
        }

        /* ===== Call to Action ===== */
        .cta-section {
            background-color: var(--deep-green);
            padding: 60px 0;
            color: white;
            text-align: center;
        }
        .cta-section h3 {
            margin-bottom: 30px;
            font-family: 'Georgia', serif;
        }
        .btn-cta {
            background-color: var(--gold);
            color: var(--deep-green);
            font-weight: bold;
            padding: 12px 30px;
            border-radius: var(--radius);
            border: none;
            margin: 0 10px;
            transition: all 0.3s ease;
        }
        .btn-cta:hover {
            background-color: white;
            transform: translateY(-3px);
        }
        .btn-cta-outline {
            background-color: transparent;
            color: white;
            border: 2px solid white;
            font-weight: bold;
            padding: 10px 28px;
            border-radius: var(--radius);
            margin: 0 10px;
            transition: all 0.3s ease;
        }
        .btn-cta-outline:hover {
            background-color: white;
            color: var(--deep-green);
            transform: translateY(-3px);
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
            transition: color 0.3s;
        }
        .footer a:hover {
            color: var(--gold);
        }
        .footer .footer-logo img {
            height: 80px;
            margin-bottom: 20px;
        }
        .footer h5 {
            color: var(--gold);
            margin-bottom: 20px;
            font-family: 'Georgia', serif;
        }
        .footer-links {
            list-style: none;
            padding-left: 0;
        }
        .footer-links li {
            margin-bottom: 10px;
        }
        .footer-bottom {
            border-top: 1px solid rgba(255,255,255,0.1);
            padding-top: 20px;
            margin-top: 40px;
            text-align: center;
        }

        /* ===== Responsive Adjustments ===== */
        @media (max-width: 768px) {
            .timeline::after {
                left: 31px;
            }
            .timeline-item {
                width: 100%;
                padding-left: 70px;
                padding-right: 25px;
            }
            .timeline-item::after {
                left: 18px;
            }
            .right {
                left: 0%;
            }
            .page-header h1 {
                font-size: 36px;
            }
            .btn-cta, .btn-cta-outline {
                display: block;
                margin: 10px auto;
                width: 80%;
            }
            .topbar .nav-link {
                padding: 10px 15px !important;
            }
        }
    </style>
</head>
<body>

    <!-- 🌿 Brand Bar -->
    <div class="brand-bar">
      <div class="container d-flex align-items-center justify-content-between">
        <div class="d-flex align-items-center">
          <img src="${pageContext.request.contextPath}/images/logo/logonew.png" alt="logo" style="height:60px;" class="me-2">
          <div class="logo-text">AYUJOURNAL</div>
        </div>
        <div class="fw-bold text-end" style="color: var(--deep-green);">ISSN: 2583-3677</div>
      </div>
    </div>

    <!-- 🌿 Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark topbar sticky-top">
      <div class="container">
        <a class="navbar-brand d-lg-none" href="#">AYUJOURNAL</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMain">
          <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
            <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/about">About Us</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/published">Current Issue</a></li>

            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/submit-article">Submit Article</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a></li>
          </ul>
          <div class="d-flex">
            <a class="btn btn-outline-light btn-sm me-2" href="${pageContext.request.contextPath}/login"><i class="fas fa-sign-in-alt"></i> Login</a>
            <a class="btn btn-light btn-sm" href="${pageContext.request.contextPath}/register"><i class="fas fa-user-plus"></i> Register</a>
          </div>
        </div>
      </div>
    </nav>

    <!-- 🌿 Page Header -->
    <section class="page-header">
        <div class="container">
            <h1>About AYUJOURNAL</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li class="breadcrumb-item active">About Us</li>
                </ol>
            </nav>
        </div>
    </section>

    <!-- 🌿 About Journal Section -->
    <section class="about-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h2>About Our Journal</h2>
                    <p>
                        AYUJOURNAL is an International, peer-reviewed, Quarterly Journal for Publication of Researches in Ayurveda. 
                        As the official publication of Ayurveda Research and Career Academy (ARCA), we are committed to advancing 
                        empirical research in Ayurveda and traditional medicine.
                    </p>
                    <p>
                        Our journal provides free open access to all content and permits authors to self-archive final accepted 
                        versions of articles on any OAI-compliant institutional or subject-based repository. This approach ensures 
                        maximum visibility and accessibility for groundbreaking research in Ayurveda.
                    </p>
                    <p>
                        Since our inception, AYUJOURNAL has continuously contributed to original research, education, and the 
                        propagation of Ayurvedic knowledge on both national and international platforms, bridging the gap between 
                        traditional wisdom and modern scientific validation.
                    </p>
                </div>
               <div class="col-lg-6">
    <img src="https://ayurhridayam.com/wp-content/uploads/2023/01/flat-lay-natural-medicinal-spices-herbs-scaled.jpg" 
         alt="Ayurvedic Herbs" class="img-fluid rounded shadow">
</div>

            </div>
        </div>
    </section>

    <!-- 🌿 Mission & Vision Section -->
    <section class="mission-vision">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="mv-card">
                        <i class="fas fa-bullseye"></i>
                        <h3>Our Mission</h3>
                        <p>
                            To promote empirical research in Ayurveda through high-quality publications that bridge traditional 
                            knowledge with modern scientific methodologies. We aim to create a global platform for evidence-based 
                            Ayurvedic research that serves healthcare needs worldwide.
                        </p>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="mv-card">
                        <i class="fas fa-eye"></i>
                        <h3>Our Vision</h3>
                        <p>
                            To become the leading international journal for Ayurvedic research, recognized for scientific rigor, 
                            ethical standards, and contribution to global healthcare. We envision a world where traditional medicine 
                            is fully integrated into mainstream healthcare through validated research.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 🌿 History Timeline -->
    <section class="timeline-section">
        <div class="container">
            <h2 class="text-center mb-5" style="color: var(--deep-green); font-family: 'Georgia', serif;">Our Journey</h2>
            <div class="timeline">
                <div class="timeline-item left">
                    <div class="timeline-content">
                        <span class="year">2018</span>
                        <h4>Foundation</h4>
                        <p>AYUJOURNAL was established as the official publication of Ayurveda Research and Career Academy (ARCA) with a vision to promote empirical research in Ayurveda.</p>
                    </div>
                </div>
                <div class="timeline-item right">
                    <div class="timeline-content">
                        <span class="year">2019</span>
                        <h4>First Publication</h4>
                        <p>Launched our inaugural issue featuring groundbreaking research in Ayurvedic clinical trials and drug research methodologies.</p>
                    </div>
                </div>
                <div class="timeline-item left">
                    <div class="timeline-content">
                        <span class="year">2020</span>
                        <h4>International Recognition</h4>
                        <p>Gained recognition in the global Ayurvedic research community and established partnerships with international institutions.</p>
                    </div>
                </div>
                <div class="timeline-item right">
                    <div class="timeline-content">
                        <span class="year">2022</span>
                        <h4>Digital Transformation</h4>
                        <p>Implemented advanced digital publishing platform and open access model to increase global accessibility of Ayurvedic research.</p>
                    </div>
                </div>
                <div class="timeline-item left">
                    <div class="timeline-content">
                        <span class="year">2024</span>
                        <h4>Expanded Reach</h4>
                        <p>Reached milestone of publishing research from over 15 countries and established indexing in major academic databases.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 🌿 Editorial Team -->
    <section class="team-section">
        <div class="container">
            <h2 class="text-center mb-5" style="color: var(--deep-green); font-family: 'Georgia', serif;">Editorial Leadership</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="team-card">
                        <img src="https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&auto=format&fit=crop&w=300&q=80" 
                             alt="Editor-in-Chief" class="team-img">
                        <h4>Dr. Vishnu Bawane</h4>
                        <p class="position">Editor-in-Chief</p>
                        <p>MD (Ayurveda), PhD with over 15 years of experience in Ayurvedic research and education.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-card">
                        <img src="https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-4.0.3&auto=format&fit=crop&w=300&q=80" 
                             alt="Managing Editor" class="team-img">
                        <h4>Dr. Priya Sharma</h4>
                        <p class="position">Managing Editor</p>
                        <p>Specialized in Ayurvedic pharmacology and clinical research methodology with numerous publications.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-card">
                        <img src="https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-4.0.3&auto=format&fit=crop&w=300&q=80" 
                             alt="Associate Editor" class="team-img">
                        <h4>Dr. Rajesh Kumar</h4>
                        <p class="position">Associate Editor</p>
                        <p>Expert in Panchakarma and Ayurvedic therapeutic procedures with international research collaborations.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 🌿 Statistics Section -->
    <section class="stats-section">
        <div class="container">
            <h2 class="text-center mb-5">AYUJOURNAL by Numbers</h2>
            <div class="row">
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">250+</span>
                        <span class="stat-label">Published Articles</span>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">45+</span>
                        <span class="stat-label">Countries Reached</span>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">1500+</span>
                        <span class="stat-label">Research Citations</span>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">98%</span>
                        <span class="stat-label">Author Satisfaction</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 🌿 About ARCA -->
    <section class="about-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 order-lg-2">
                    <h2>About ARCA</h2>
                    <p>
                        Ayurveda Research & Career Academy (ARCA) was founded to develop research skills among undergraduate 
                        and postgraduate students in the stream of Indian System of Medicine (AYUSH). India has extensive 
                        infrastructure in terms of Colleges, Hospitals, and institutions dedicated to Indian Medicine for 
                        both teaching and clinical care.
                    </p>
                    <p>
                        However, the scientific validation of various Ayurvedic, Siddha and Unani therapies mentioned in 
                        classical texts remains to be done on a wider scale. ARCA has created a platform for upcoming 
                        Ayurveda aspirants to encourage research work through active assistance from our team of experts.
                    </p>
                    <p>
                        ARCA also provides comprehensive information about future opportunities and important events in 
                        AYUSH and related fields, serving as a centralized resource for career development in traditional medicine.
                    </p>
                </div>
                <div class="col-lg-6 order-lg-1">
                    <img src="https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" 
                         alt="ARCA Initiatives" class="img-fluid rounded shadow">
                </div>
            </div>
        </div>
    </section>

    <!-- 🌿 Partners Section -->
    <section class="partners-section">
        <div class="container">
            <h2 class="text-center mb-5" style="color: var(--deep-green); font-family: 'Georgia', serif;">Our Partners</h2>
            <div class="row align-items-center">
                <div class="col-md-3 col-6 mb-4">
                    <img src="https://via.placeholder.com/150x80/0b5633/ffffff?text=ARCA" alt="ARCA" class="img-fluid partner-logo">
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <img src="https://via.placeholder.com/150x80/7a4b3a/ffffff?text=AYUSH" alt="AYUSH" class="img-fluid partner-logo">
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <img src="https://via.placeholder.com/150x80/2b8a5f/ffffff?text=Research" alt="Research Institute" class="img-fluid partner-logo">
                </div>
                <div class="col-md-3 col-6 mb-4">
                    <img src="https://via.placeholder.com/150x80/c9a25a/2d2d2d?text=University" alt="University" class="img-fluid partner-logo">
                </div>
            </div>
        </div>
    </section>

    <!-- 🌿 Call to Action -->
    <section class="cta-section">
        <div class="container">
            <h3>Join Our Mission to Advance Ayurvedic Research</h3>
            <p class="mb-4">Contribute to the growing body of evidence-based Ayurvedic knowledge and help shape the future of traditional medicine.</p>
            <a href="${pageContext.request.contextPath}/submit-article" class="btn btn-cta">Submit Your Research</a>
            <a href="${pageContext.request.contextPath}/contact" class="btn btn-cta-outline">Contact Our Team</a>
        </div>
    </section>

    <!-- 🌿 Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 text-center text-md-start">
                    <div class="footer-logo">
                        <img src="${pageContext.request.contextPath}/images/logo/logonew.png" alt="Logo">
                    </div>
                    <p>An International Journal for Empirical Research in Ayurveda and Traditional Medicine</p>
                </div>
                <div class="col-md-4">
                    <h5>Quick Links</h5>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                        <li><a href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                        <li><a href="${pageContext.request.contextPath}/submit-article">Submit Article</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Contact Us</h5>
                    <ul class="footer-links">
                        <li><i class="fas fa-envelope me-2"></i> ayuscriptjournal@gmail.com</li>
                        <li><i class="fas fa-phone me-2"></i> +91-9324737097</li>
                        <li><i class="fas fa-map-marker-alt me-2"></i> Badlapur, Thane 421503</li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; <script>document.write(new Date().getFullYear())</script> AYUJOURNAL. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <!-- 🌿 Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>