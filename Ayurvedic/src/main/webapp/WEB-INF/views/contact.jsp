<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AVUSCRIPT : Contact Us</title>
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
            --max-width: 1200px;
            --radius: 12px;
            --shadow: 0 10px 30px rgba(11,74,57,0.06);
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

        /* ===== Page Header ===== */
        .page-header {
            background: linear-gradient(rgba(11, 86, 51, 0.8), rgba(11, 86, 51, 0.9)), url('https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0 60px;
            text-align: center;
        }
        .page-header h1 {
            font-family: 'Georgia', serif;
            font-size: 3.5rem;
            margin-bottom: 1rem;
            color: var(--gold);
        }
        .page-header p {
            font-size: 1.2rem;
            max-width: 600px;
            margin: 0 auto;
        }

        /* ===== Contact Section ===== */
        .contact-section {
            padding: 80px 0;
            background-color: white;
        }
        .section-title {
            text-align: center;
            color: var(--rust);
            font-family: 'Georgia', serif;
            font-weight: bold;
            margin-bottom: 50px;
            position: relative;
            padding-bottom: 15px;
        }
        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background-color: var(--gold);
        }

        /* ===== Contact Cards ===== */
        .contact-card {
            background: var(--paper);
            border-radius: var(--radius);
            padding: 40px 30px;
            text-align: center;
            box-shadow: var(--shadow);
            border-top: 4px solid var(--gold);
            transition: transform 0.3s ease;
            height: 100%;
            margin-bottom: 30px;
        }
        .contact-card:hover {
            transform: translateY(-10px);
        }
        .contact-card i {
            font-size: 3rem;
            color: var(--deep-green);
            margin-bottom: 20px;
        }
        .contact-card h4 {
            color: var(--deep-green);
            margin-bottom: 15px;
            font-family: 'Georgia', serif;
        }

        /* ===== Contact Form ===== */
        .contact-form {
            background: var(--paper);
            border-radius: var(--radius);
            padding: 40px;
            box-shadow: var(--shadow);
            border-top: 4px solid var(--leaf);
        }
        .form-group {
            margin-bottom: 25px;
        }
        .form-label {
            color: var(--deep-green);
            font-weight: 600;
            margin-bottom: 8px;
        }
        .form-control {
            border: 2px solid #e9ecef;
            border-radius: var(--radius);
            padding: 12px 15px;
            font-size: 16px;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: var(--deep-green);
            box-shadow: 0 0 0 0.2rem rgba(11, 86, 51, 0.25);
        }
        .form-control.error {
            border-color: #dc3545;
        }
        .error-message {
            color: #dc3545;
            font-size: 0.875em;
            margin-top: 5px;
            display: block;
        }

        /* ===== Submit Button ===== */
        .submit-btn {
            background: var(--deep-green);
            color: white;
            border: none;
            padding: 15px 40px;
            border-radius: var(--radius);
            font-weight: bold;
            font-size: 18px;
            transition: all 0.3s ease;
            width: 100%;
        }
        .submit-btn:hover {
            background: var(--leaf);
            transform: translateY(-2px);
        }
        .submit-btn:disabled {
            background: #6c757d;
            cursor: not-allowed;
            transform: none;
        }

        /* ===== Alert Styles ===== */
        .alert {
            border-radius: var(--radius);
            margin: 20px 0;
            border: none;
            padding: 20px;
        }
        .alert-success {
            background: #e8f5e9;
            color: var(--deep-green);
            border-left: 4px solid var(--leaf);
        }
        .alert-danger {
            background: #ffebee;
            color: #c62828;
            border-left: 4px solid #f44336;
        }

        /* ===== Map Section ===== */
        .map-section {
            padding: 60px 0;
            background: var(--cream);
        }
        .map-container {
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            height: 400px;
        }

        /* ===== FAQ Section ===== */
        .faq-section {
            padding: 80px 0;
            background: white;
        }
        .accordion-item {
            border: none;
            margin-bottom: 15px;
            border-radius: var(--radius) !important;
            overflow: hidden;
        }
        .accordion-button {
            background: var(--paper);
            color: var(--deep-green);
            font-weight: 600;
            padding: 20px;
            border: none;
        }
        .accordion-button:not(.collapsed) {
            background: var(--deep-green);
            color: white;
        }
        .accordion-button:focus {
            box-shadow: none;
            border-color: var(--deep-green);
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

        /* ===== Responsive Design ===== */
        @media (max-width: 768px) {
            .page-header h1 {
                font-size: 2.5rem;
            }
            .contact-form {
                padding: 30px 20px;
            }
            .contact-card {
                padding: 30px 20px;
            }
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
        String success = request.getParameter("success");
        String error = request.getParameter("error");
    %>

    <!-- 🌿 Brand Bar -->
    <div class="brand-bar">
        <div class="container d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/images/logo/logonew.png" alt="logo" style="height:60px;" class="me-2">
                <div class="logo-text">AVUSCRIPT</div>
            </div>
            <div class="d-flex align-items-center">
                <div class="fw-bold text-end me-3" style="color: var(--deep-green);">
                    ISSN: 2583-3677
                </div>
                <c:if test="${not empty sessionScope.username}">
                    <div class="user-info">
                        Welcome, ${sessionScope.username} (${sessionScope.userRole})
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- 🌿 Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark topbar sticky-top">
        <div class="container">
            <a class="navbar-brand d-lg-none" href="#">AVUSCRIPT</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navMain">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/archives">Archives</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/submit-article">Submit Article</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/contact">Contact</a></li>
                    
                </ul>
                
                <!-- Dynamic Login/User Buttons -->
                <div class="d-flex">
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

    <!-- 🌿 Page Header -->
    <section class="page-header">
        <div class="container">
            <h1>Contact Us</h1>
            <p>Get in touch with our team. We're here to help with your queries and support your research journey.</p>
        </div>
    </section>

    <!-- 🌿 Contact Information -->
    <section class="contact-section">
        <div class="container">
            <h2 class="section-title">Get In Touch</h2>
            
            <!-- Success/Error Messages -->
            <%
                if ("true".equals(success)) {
            %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fas fa-check-circle me-2"></i>
                    <strong>Success!</strong> Your message has been sent successfully. We'll get back to you soon.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <%
                } else if ("true".equals(error)) {
            %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    <strong>Error!</strong> There was a problem sending your message. Please try again later.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <%
                }
            %>

            <div class="row mb-5">
                <div class="col-md-4">
                    <div class="contact-card">
                        <i class="fas fa-map-marker-alt"></i>
                        <h4>Our Location</h4>
                        <p>Flat No 604, Raut Arcade<br>Near Mohan Palms, Shirgaon<br>Badlapur, Thane 421503</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="contact-card">
                        <i class="fas fa-envelope"></i>
                        <h4>Email Us</h4>
                        <p>ayuscriptjournal@gmail.com<br>drvcbawane@gmail.com</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="contact-card">
                        <i class="fas fa-phone"></i>
                        <h4>Call Us</h4>
                        <p>+91 9324737097<br>Mon - Fri, 9:00 AM - 6:00 PM</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <div class="contact-form">
                        <h3 class="mb-4" style="color: var(--deep-green);">Send us a Message</h3>
                        <form action="contactCreate" method="post" name="contactForm" id="contactForm" onsubmit="return validateForm()">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Full Name *</label>
                                        <input type="text" name="form_name" id="form_name" class="form-control" placeholder="Enter your full name">
                                        <span class="error-message" id="nameError"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Email Address *</label>
                                        <input type="email" name="form_email" id="form_email" class="form-control" placeholder="Enter your email">
                                        <span class="error-message" id="emailError"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Phone Number *</label>
                                        <input type="tel" name="form_phone" id="form_phone" class="form-control" placeholder="Enter your phone number">
                                        <span class="error-message" id="phoneError"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="form-label">Subject</label>
                                        <input type="text" name="form_subject" id="form_subject" class="form-control" placeholder="Enter subject">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="form-label">Message *</label>
                                        <textarea name="form_message" id="form_message" class="form-control" placeholder="Enter your message..." rows="6"></textarea>
                                        <span class="error-message" id="messageError"></span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="submit-btn" id="submitBtn">
                                        <span id="submitText">Send Message</span>
                                        <span id="loadingSpinner" class="spinner-border spinner-border-sm d-none" role="status"></span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <div class="contact-info" style="background: var(--paper); padding: 30px; border-radius: var(--radius);">
                        <h4 style="color: var(--rust); font-family: Georgia, serif; margin-bottom: 25px;">Publication Details</h4>
                        
                        <div class="mb-4">
                            <h5 style="color: var(--deep-green);">Publisher</h5>
                            <p>Ayurveda Research & Career Academy (ARCA)<br>
                            Flat No 604, Raut Arcade<br>
                            Near Mohan Palms, Shirgaon<br>
                            Badlapur, Thane 421503</p>
                        </div>
                        
                        <div class="mb-4">
                            <h5 style="color: var(--deep-green);">Contact Information</h5>
                            <p><strong>Email:</strong> ayuscriptjournal@gmail.com<br>
                            <strong>Mobile:</strong> +91 9324737097</p>
                        </div>
                        
                        <div>
                            <h5 style="color: var(--deep-green);">Editor-in-Chief</h5>
                            <p><strong>Dr. Vishnu Bawane</strong><br>
                            Email: drvcbawane@gmail.com<br>
                            Mobile: +91 9324737097</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 🌿 Map Section -->
    <section class="map-section">
        <div class="container">
            <h2 class="section-title">Find Us</h2>
            <div class="map-container">
                <iframe 
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3767.123456789012!2d73.12345678901234!3d19.123456789012345!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTnCsDA3JzI0LjQiTiA3M8KwMDcnMjQuNiJF!5e0!3m2!1sen!2sin!4v1234567890123!5m2!1sen!2sin" 
                    width="100%" 
                    height="100%" 
                    style="border:0;" 
                    allowfullscreen="" 
                    loading="lazy" 
                    referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
        </div>
    </section>

    <!-- 🌿 FAQ Section -->
    <section class="faq-section">
        <div class="container">
            <h2 class="section-title">Frequently Asked Questions</h2>
            <div class="accordion" id="faqAccordion">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                            What is the response time for queries?
                        </button>
                    </h2>
                    <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            We typically respond to all queries within 24-48 hours during business days. For urgent matters, please call us directly.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                            How can I submit a research article?
                        </button>
                    </h2>
                    <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            You can submit your research article through our online submission portal. Please visit the "Submit Article" page for detailed guidelines and the submission process.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                            What are the publication charges?
                        </button>
                    </h2>
                    <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            We offer competitive publication charges. For detailed information about fees and payment options, please contact our editorial team directly.
                        </div>
                    </div>
                </div>
            </div>
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
                        <li><a href="${pageContext.request.contextPath}/published">Current Issue</a></li>
                        <li><a href="${pageContext.request.contextPath}/submit-article">Submit Article</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Contact Info</h5>
                    <ul class="footer-links">
                        <li><i class="fas fa-envelope me-2"></i> ayuscriptjournal@gmail.com</li>
                        <li><i class="fas fa-phone me-2"></i> +91-9324737097</li>
                        <li><i class="fas fa-map-marker-alt me-2"></i> Badlapur, Thane 421503</li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; <script>document.write(new Date().getFullYear())</script> AVUSCRIPT - International Journal for Empirical Research in Ayurveda. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
    function validateForm() {
        let isValid = true;
        
        // Clear previous errors
        document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
        document.querySelectorAll('.form-control').forEach(el => el.classList.remove('error'));
        
        // Name validation
        const name = document.getElementById('form_name').value.trim();
        if (name === '') {
            document.getElementById('nameError').textContent = 'Name is required';
            document.getElementById('form_name').classList.add('error');
            isValid = false;
        } else if (name.length < 2) {
            document.getElementById('nameError').textContent = 'Name must be at least 2 characters long';
            document.getElementById('form_name').classList.add('error');
            isValid = false;
        }
        
        // Email validation
        const email = document.getElementById('form_email').value.trim();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email === '') {
            document.getElementById('emailError').textContent = 'Email is required';
            document.getElementById('form_email').classList.add('error');
            isValid = false;
        } else if (!emailRegex.test(email)) {
            document.getElementById('emailError').textContent = 'Please enter a valid email address';
            document.getElementById('form_email').classList.add('error');
            isValid = false;
        }
        
        // Phone validation
        const phone = document.getElementById('form_phone').value.trim();
        const phoneRegex = /^[0-9]{10}$/;
        if (phone === '') {
            document.getElementById('phoneError').textContent = 'Phone number is required';
            document.getElementById('form_phone').classList.add('error');
            isValid = false;
        } else if (!phoneRegex.test(phone)) {
            document.getElementById('phoneError').textContent = 'Please enter a valid 10-digit phone number';
            document.getElementById('form_phone').classList.add('error');
            isValid = false;
        }
        
        // Message validation
        const message = document.getElementById('form_message').value.trim();
        if (message === '') {
            document.getElementById('messageError').textContent = 'Message is required';
            document.getElementById('form_message').classList.add('error');
            isValid = false;
        } else if (message.length < 10) {
            document.getElementById('messageError').textContent = 'Message must be at least 10 characters long';
            document.getElementById('form_message').classList.add('error');
            isValid = false;
        }
        
        if (isValid) {
            // Show loading state
            document.getElementById('submitText').textContent = 'Sending Message...';
            document.getElementById('loadingSpinner').classList.remove('d-none');
            document.getElementById('submitBtn').disabled = true;
        }
        
        return isValid;
    }

    // Real-time validation
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('contactForm');
        const inputs = form.querySelectorAll('input, textarea');
        
        inputs.forEach(input => {
            input.addEventListener('blur', function() {
                validateField(this);
            });
            
            input.addEventListener('input', function() {
                if (this.classList.contains('error')) {
                    validateField(this);
                }
            });
        });
        
        function validateField(field) {
            const value = field.value.trim();
            const fieldId = field.id;
            
            // Clear previous error
            field.classList.remove('error');
            document.getElementById(fieldId + 'Error').textContent = '';
            
            // Validate based on field type
            switch(fieldId) {
                case 'form_name':
                    if (value === '') {
                        showError(field, 'Name is required');
                    } else if (value.length < 2) {
                        showError(field, 'Name must be at least 2 characters long');
                    }
                    break;
                    
                case 'form_email':
                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    if (value === '') {
                        showError(field, 'Email is required');
                    } else if (!emailRegex.test(value)) {
                        showError(field, 'Please enter a valid email address');
                    }
                    break;
                    
                case 'form_phone':
                    const phoneRegex = /^[0-9]{10}$/;
                    if (value === '') {
                        showError(field, 'Phone number is required');
                    } else if (!phoneRegex.test(value)) {
                        showError(field, 'Please enter a valid 10-digit phone number');
                    }
                    break;
                    
                case 'form_message':
                    if (value === '') {
                        showError(field, 'Message is required');
                    } else if (value.length < 10) {
                        showError(field, 'Message must be at least 10 characters long');
                    }
                    break;
            }
        }
        
        function showError(field, message) {
            field.classList.add('error');
            document.getElementById(field.id + 'Error').textContent = message;
        }
    });
    </script>
</body>
</html>