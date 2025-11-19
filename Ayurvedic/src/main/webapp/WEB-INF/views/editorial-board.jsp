<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AYUSCRIPT | Editorial Board</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap + Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        :root {
            --deep-green:#0b5633;
            --leaf:#2b8a5f;
            --rust:#7a4b3a;
            --gold:#c9a25a;
            --cream:#fbf6ee;
            --paper:#f7efe6;
            --text:#2d2d2d;
            --shadow: 0 10px 30px rgba(11,74,57,0.06);
        }

        body {
            background-color: var(--cream);
            font-family: 'Segoe UI', sans-serif;
            color: var(--text);
        }

        /* ===== Top Header (White) ===== */
        .brand-bar {
            background-color: white;
            color: var(--text);
            padding: 15px 0;
            box-shadow: var(--shadow);
        }
        .logo-text {
            font-size: 34px;
            font-weight: 700;
            color: var(--rust);
            font-family: Georgia, serif;
        }
        .brand-bar .fw-bold {
            color: var(--deep-green);
        }

        /* ===== Navbar (Green) ===== */
        .navbar {
            background-color: var(--deep-green);
        }
        .navbar-nav .nav-link {
            color: #fff !important;
            font-weight: 600;
            text-transform: uppercase;
            margin: 0 10px;
        }
        .navbar-nav .nav-link:hover,
        .navbar-nav .nav-link.active {
            color: var(--gold) !important;
        }
        .btn-outline-light {
            color: var(--gold);
            border-color: var(--gold);
        }
        .btn-outline-light:hover {
            background-color: var(--gold);
            color: var(--deep-green);
        }

        /* ===== Banner ===== */
        .inner-banner {
            position: relative;
            background: linear-gradient(rgba(11,86,51,0.6), rgba(11,86,51,0.6)),
            url('https://ayurhridayam.com/wp-content/uploads/2023/01/flat-lay-natural-medicinal-spices-herbs-scaled.jpg') 
            center/cover no-repeat;
            text-align: center;
            color: white;
            padding: 100px 0;
        }
        .inner-banner h1 {
            position: relative;
            z-index: 2;
            font-family: 'Georgia', serif;
            font-size: 42px;
            letter-spacing: 1.5px;
            color: var(--gold);
            text-shadow: 2px 2px 4px rgba(0,0,0,0.4);
        }

        /* ===== Section Titles ===== */
        .section-title {
            text-align: center;
            color: var(--deep-green);
            font-family: 'Georgia', serif;
            margin-top: 50px;
            margin-bottom: 30px;
            font-weight: bold;
        }

        /* ===== Team Card ===== */
        .team-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: var(--shadow);
            padding: 20px;
            text-align: center;
            transition: transform 0.3s;
        }
        .team-card:hover {
            transform: translateY(-5px);
        }
        .team-card img {
            width: 220px;
            height: 220px;
            border-radius: 8px;
            object-fit: cover;
        }
        .team-card h5 {
            margin-top: 15px;
            color: var(--deep-green);
            font-weight: 700;
        }
        .team-card p {
            font-size: 14px;
            margin-bottom: 5px;
        }

        /* ===== Horizontal Cards ===== */
        .horizontal-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: white;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 20px;
            box-shadow: var(--shadow);
        }
        .horizontal-card img {
            width: 160px;
            height: 160px;
            border-radius: 8px;
            object-fit: cover;
        }
        .horizontal-card h5 {
            color: var(--deep-green);
            font-weight: 700;
        }

        /* ===== Footer ===== */
        footer {
            background-color: var(--deep-green);
            color: var(--cream);
            padding: 40px 0 20px;
            text-align: center;
        }
        footer h5 {
            color: var(--gold);
            margin-bottom: 15px;
        }
        footer a {
            color: #fff;
            text-decoration: none;
        }
        footer a:hover {
            color: var(--gold);
        }

        /* ===== Scroll Top ===== */
        .scroll-top {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: var(--deep-green);
            border: none;
            color: white;
            border-radius: 50%;
            padding: 10px 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
    </style>
</head>

<body>

<!-- ===== Header (White) ===== -->
<div class="brand-bar">
    <div class="container d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <img src="${pageContext.request.contextPath}/images/logo/logonew.png" alt="logo" height="60">
            <span class="ms-2 logo-text">AYUSCRIPT</span>
        </div>
        <div class="fw-bold">ISSN: 2583-3677</div>
    </div>
</div>

<!-- ===== Navbar (Green Only) ===== -->
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMain">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a></li>
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/published">Current Issue</a></li>
              
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/submitArticle">Submit Article</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/guideline">Author Guideline</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a></li>
               
            </ul>
            <a href="${pageContext.request.contextPath}/authorLogin" class="btn btn-outline-light">
                <i class="fa fa-user"></i>
            </a>
        </div>
    </div>
</nav>

<!-- ===== Banner ===== -->
<section class="inner-banner">
    <h1>EDITORIAL BOARD</h1>
</section>

<!-- ===== Become Author Button ===== -->
<div class="text-end p-3">
    <a href="${pageContext.request.contextPath}/authorLogin" class="btn btn-outline-success fw-bold">
        <i class="fa fa-arrow-circle-right"></i> Become an Author
    </a>
</div>

<!-- ===== Meet Our Team ===== -->
<section class="container">
    <h2 class="section-title">Meet Our Team</h2>
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="team-card">
                <img src="${pageContext.request.contextPath}/images/background/bawne-sir.jpg" alt="Dr Vishnu Bawane">
                <h5>Dr. Vishnu Bawane</h5>
                <p><b>Editor In Chief</b></p>
                <p>M.D.(Prasutitantra-Striroga), Ph.D.(Sch), PGDCR, EMBA</p>
                <p>Associate Professor, B.R. Harne Ayurvedic Medical College, Thane</p>
                <a href="mailto:drvcbawane@gmail.com">drvcbawane@gmail.com</a>
            </div>
        </div>
    </div>
</section>

<!-- ===== Footer ===== -->
<footer>
    <div class="container">
        <img src="${pageContext.request.contextPath}/images/logo/logonew.png" height="60" alt="Logo">
        <p class="mt-3 mb-2">
            Flat No 604, Raut Arcade, Near Mohan Palms, Shirgaon, Badlapur, Thane 421503
        </p>
        <p>
            Email: <a href="mailto:ayuscriptjournal@gmail.com">ayuscriptjournal@gmail.com</a> | Mobile: 9324737097
        </p>
        <div class="mt-3">
            &copy; <%= java.time.Year.now() %> AYUSCRIPT. All Rights Reserved.
        </div>
    </div>
</footer>

<button class="scroll-top" onclick="window.scrollTo({top:0, behavior:'smooth'})">
    <i class="fa fa-angle-up"></i>
</button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
