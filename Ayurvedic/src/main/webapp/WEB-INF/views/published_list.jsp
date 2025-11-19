<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Published Articles • Shree Ayurveda Journal</title>

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Cinzel:wght@600&display=swap" rel="stylesheet">

  <style>
    :root {
      --deep-green: #0b5633;
      --leaf: #2b8a5f;
      --gold: #c9a25a;
      --cream: #fbf6ee;
      --paper: #f7efe6;
      --text: #2d2d2d;
      --radius: 12px;
      --shadow: 0 10px 30px rgba(11,74,57,0.06);
      --max-width: 1200px;
    }

    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background: var(--paper);
      color: var(--text);
      -webkit-font-smoothing: antialiased;
    }

    .container {
      max-width: var(--max-width);
      margin: 0 auto;
      padding: 0 20px;
    }

    /* Navbar */
    nav {
      background: rgba(11,74,57,0.96);
      backdrop-filter: blur(6px);
      position: sticky;
      top: 0;
      z-index: 99;
    }

    .nav-inner {
      display: flex;
      align-items: center;
      justify-content: space-between;
      max-width: var(--max-width);
      margin: 0 auto;
      padding: 12px 20px;
    }

    .nav-links {
      display: flex;
      gap: 18px;
      align-items: center;
    }

    .nav-links a {
      color: #fff;
      text-decoration: none;
      font-weight: 600;
      padding: 8px 10px;
      border-radius: 6px;
    }

    .nav-links a:hover {
      background: rgba(201,162,90,0.14);
      color: var(--gold);
    }

    .nav-actions {
      display: flex;
      gap: 10px;
      align-items: center;
    }

    .btn-outline {
      color: #fff;
      border: 1px solid rgba(255,255,255,0.12);
      background: transparent;
      padding: 6px 10px;
      border-radius: 6px;
      text-decoration: none;
      font-weight: 600;
    }

    .btn-light {
      background: #fff;
      color: var(--deep-green);
      padding: 6px 10px;
      border-radius: 6px;
      text-decoration: none;
      font-weight: 600;
    }

    /* Header Bar */
    header {
      background: linear-gradient(180deg, rgba(11,74,57,0.65), rgba(11,74,57,0.35)),
                  url('https://keralaayurveda.biz/cdn/shop/articles/unnamed_4945cd45-9f24-4af3-9ca8-a643c6589480.jpg?v=1752079420&width=2048') center/cover no-repeat;
      color: white;
      padding: 40px 0 80px;
      position: relative;
      text-align: center;
    }

    header h1 {
      font-family: 'Cinzel', serif;
      font-size: 32px;
      color: var(--gold);
      margin: 0;
      text-shadow: 0 4px 14px rgba(0,0,0,0.25);
    }

    header p {
      font-size: 14px;
      margin: 8px 0 0;
      color: rgba(255,255,255,0.9);
    }

    /* Section */
    section {
      padding: 60px 0;
    }

    h2 {
      font-family: 'Cinzel', serif;
      color: var(--deep-green);
      margin-bottom: 20px;
      text-align: center;
    }

    /* Table */
    table {
      border-collapse: collapse;
      width: 100%;
      background: var(--cream);
      border-radius: 12px;
      box-shadow: var(--shadow);
      overflow: hidden;
    }

    th, td {
      border-bottom: 1px solid rgba(11,74,57,0.08);
      padding: 14px;
      text-align: left;
      font-size: 15px;
    }

    th {
      background-color: #f4f9f6;
      color: var(--deep-green);
      font-weight: 600;
    }

    tr:hover {
      background: #fafcfb;
    }

    a.btn-view {
      color: var(--deep-green);
      text-decoration: none;
      background: rgba(11,74,57,0.08);
      padding: 6px 12px;
      border-radius: 6px;
      transition: all 0.3s;
      font-weight: 500;
    }

    a.btn-view:hover {
      background: var(--deep-green);
      color: white;
    }

    p.empty {
      background: var(--cream);
      padding: 16px;
      border-radius: 8px;
      box-shadow: var(--shadow);
      text-align: center;
      font-weight: 500;
      color: var(--deep-green);
    }

    .back-link {
      display: inline-block;
      margin-top: 24px;
      text-decoration: none;
      color: var(--leaf);
      font-weight: 600;
    }

    .back-link:hover {
      text-decoration: underline;
    }

    footer {
      background: var(--deep-green);
      color: white;
      text-align: center;
      padding: 20px;
      margin-top: 60px;
    }

    footer span {
      color: var(--gold);
      font-weight: 600;
    }

    @media (max-width: 768px) {
      th, td { font-size: 14px; padding: 10px; }
      header h1 { font-size: 26px; }
    }
  </style>
</head>
<body>

<!-- Top Nav (from index.jsp, implemented here) -->
<nav>
  <div class="nav-inner">
    <div class="d-flex" style="align-items:center; gap:12px;">
      <img src="${pageContext.request.contextPath}/images/logo/logonew.png" alt="logo" style="height:40px;">
      <div style="color:white;font-weight:700;font-size:18px;">AVUSCRIPT</div>
    </div>

    <div class="nav-links">
      <a href="${pageContext.request.contextPath}/">HOME</a>
      <a href="${pageContext.request.contextPath}/about">ABOUT US</a>
      <a href="${pageContext.request.contextPath}/editorial-board">EDITORIAL BOARD</a>
      <a href="${pageContext.request.contextPath}/published">CURRENT ISSUE</a>
      <a href="${pageContext.request.contextPath}/submit-article">SUBMIT ARTICLE</a>
      <a href="${pageContext.request.contextPath}/author-guideline">AUTHOR GUIDELINE</a>
      <a href="${pageContext.request.contextPath}/contact">CONTACT</a>
    </div>

    <div class="nav-actions">
      <c:choose>
        <c:when test="${sessionScope.isLoggedIn}">
          <a class="btn-outline" href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
          <a class="btn-light" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </c:when>
        <c:otherwise>
          <a class="btn-outline" href="${pageContext.request.contextPath}/login"><i class="fas fa-sign-in-alt"></i> Login</a>
          <a class="btn-light" href="${pageContext.request.contextPath}/register"><i class="fas fa-user-plus"></i> Register</a>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>

<!-- Header -->
<header>
  <h1>Published Articles</h1>
  <p>Explore peer-reviewed papers from the <strong>International Journal of Indian Medicine</strong></p>
</header>

<!-- Articles Section -->
<section class="container">
  <h2>All Published Articles</h2>

  <c:if test="${empty articles}">
    <p class="empty">No published articles yet. Stay tuned for upcoming research papers!</p>
  </c:if>

  <%
      DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd MMM yyyy, hh:mm a");
      request.setAttribute("fmt", fmt);
  %>

  <c:if test="${not empty articles}">
    <table>
      <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Published At</th>
        <th>View</th>
      </tr>
      <c:forEach var="a" items="${articles}">
        <tr>
          <td>${a.id}</td>
          <td>${a.title}</td>
          <td>
            <%
              // preserve original approach: invoke getter via reflection on the current 'a' attribute
              java.time.LocalDateTime publishedAt = (java.time.LocalDateTime)
                pageContext.getAttribute("a").getClass()
                .getMethod("getPublishedAt")
                .invoke(pageContext.getAttribute("a"));
              if (publishedAt != null) {
                out.print(publishedAt.format((java.time.format.DateTimeFormatter) request.getAttribute("fmt")));
              }
            %>
          </td>
          <td><a href="${pageContext.request.contextPath}/published/${a.id}" class="btn-view">Open</a></td>
        </tr>
      </c:forEach>
    </table>
  </c:if>

</section>

<!-- Footer -->
<footer>
  © 2025 <span>Shree Ayurveda Journal</span> • Empowering Ayurvedic Research 🌿
</footer>

<!-- Font Awesome (icons used in buttons) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/js/all.min.js"></script>

</body>
</html>
