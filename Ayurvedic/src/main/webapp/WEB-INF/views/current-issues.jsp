<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Current Issue • Shree Ayurveda Journal</title>

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Cinzel:wght@600&display=swap" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

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

    .container-main {
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
      padding: 10px 20px;
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
      gap: 8px;
      align-items: center;
      margin-left: 12px;
    }
    .nav-actions a.btn {
      background: transparent;
      color: #fff;
      border: 1px solid rgba(255,255,255,0.12);
      padding: 6px 10px;
      border-radius: 6px;
      text-decoration: none;
      font-weight: 600;
    }
    .nav-actions a.btn:hover {
      background: rgba(255,255,255,0.08);
      color: var(--gold);
      border-color: rgba(255,255,255,0.18);
    }

    header {
      background: linear-gradient(180deg, rgba(11,74,57,0.8), rgba(11,74,57,0.4)),
                  url('https://keralaayurveda.biz/cdn/shop/articles/unnamed_4945cd45-9f24-4af3-9ca8-a643c6589480.jpg?v=1752079420&width=2048') center/cover no-repeat;
      color: white;
      padding: 60px 20px 65px;
      text-align: center;
      position: relative;
      border-bottom: 4px solid rgba(201,162,90,0.25);
      box-shadow: 0 6px 18px rgba(0,0,0,0.25);
    }

    header::after {
      content: "";
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 90px;
      height: 3px;
      background: var(--gold);
      border-radius: 2px;
    }

    header h1 {
      font-family: 'Cinzel', serif;
      font-size: 30px;
      margin: 0;
      color: var(--gold);
      text-shadow: 0 3px 14px rgba(0, 0, 0, 0.6);
      letter-spacing: 0.5px;
    }

    header p {
      margin-top: 10px;
      font-size: 15px;
      color: rgba(255,255,255,0.92);
      text-shadow: 0 1px 6px rgba(0,0,0,0.3);
    }

    section {
      padding: 50px 0;
    }

    /* Current Issue Styles */
    .current-issue-section {
      padding: 40px 0;
    }

    .issue-header {
      text-align: center;
      margin-bottom: 40px;
    }

    .issue-header h1 {
      color: var(--deep-green);
      margin-bottom: 10px;
    }

    .issue-header .lead {
      color: var(--leaf);
      font-size: 1.2rem;
      font-weight: 500;
    }

    .search-section {
      margin-bottom: 30px;
    }

    .search-form {
      display: flex;
      max-width: 600px;
      margin: 0 auto;
    }

    .search-input {
      flex: 1;
      padding: 12px 16px;
      border: 2px solid #e0e0e0;
      border-radius: 8px 0 0 8px;
      font-size: 1rem;
    }

    .search-btn {
      background: var(--deep-green);
      color: white;
      border: none;
      padding: 12px 24px;
      border-radius: 0 8px 8px 0;
      cursor: pointer;
      font-weight: 500;
    }

    .articles-section {
      margin-top: 40px;
    }

    .section-title {
      color: var(--deep-green);
      border-bottom: 2px solid var(--gold);
      padding-bottom: 10px;
      margin-bottom: 30px;
    }

    .article-list {
      display: flex;
      flex-direction: column;
      gap: 25px;
    }

    .article-item {
      background: white;
      border-radius: 12px;
      padding: 25px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      border-left: 4px solid var(--gold);
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .article-item:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(0,0,0,0.12);
    }

    .article-title {
      font-size: 1.3rem;
      font-weight: 600;
      color: var(--deep-green);
      margin-bottom: 12px;
      line-height: 1.4;
    }

    .article-meta {
      display: flex;
      gap: 20px;
      margin-bottom: 15px;
      flex-wrap: wrap;
      font-size: 0.9rem;
      color: #666;
    }

    .article-authors {
      font-weight: 500;
      color: var(--leaf);
    }

    .article-type-badge {
      background: var(--deep-green);
      color: white;
      padding: 4px 12px;
      border-radius: 20px;
      font-size: 0.8rem;
      font-weight: 500;
    }

    .article-abstract {
      color: #555;
      line-height: 1.6;
      margin-bottom: 20px;
    }

    .article-actions {
      display: flex;
      gap: 12px;
      flex-wrap: wrap;
    }

    .btn-abstract, .btn-pdf, .btn-view {
      padding: 8px 16px;
      border-radius: 6px;
      text-decoration: none;
      font-weight: 500;
      font-size: 0.9rem;
      transition: all 0.3s;
      border: none;
      cursor: pointer;
    }

    .btn-view {
      background: var(--leaf);
      color: white;
    }

    .btn-view:hover {
      background: var(--deep-green);
      color: white;
    }

    .btn-pdf {
      background: var(--gold);
      color: white;
    }

    .btn-pdf:hover {
      background: #b8934a;
      color: white;
    }

    .no-articles {
      text-align: center;
      padding: 60px 20px;
      color: #666;
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
      header h1 { font-size: 24px; }
      header { padding: 45px 15px 55px; }
      .nav-inner { padding: 8px 12px; gap: 8px; }
      .nav-links { gap: 10px; flex-wrap: wrap; }
      .article-meta { flex-direction: column; gap: 8px; }
      .article-actions { flex-direction: column; }
      .btn-view, .btn-pdf { text-align: center; }
    }
    .btn-abstract {
    background: var(--leaf);
    color: white;
    padding: 8px 16px;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 500;
    font-size: 0.9rem;
    transition: all 0.3s;
    border: none;
    cursor: pointer;
    display: inline-block;
}

.btn-abstract:hover {
    background: var(--deep-green);
    color: white;
}

.btn-view {
    background: #6c757d;
    color: white;
}

.btn-view:hover {
    background: #5a6268;
    color: white;
}

.btn-pdf {
    background: var(--gold);
    color: white;
}

.btn-pdf:hover {
    background: #b8934a;
    color: white;
}
  </style>
</head>
<body>

<!-- Navbar -->
<nav>
  <div class="nav-inner">
    <div class="site-title" style="color:white;font-weight:600;">Shree Ayurveda Journal</div>

    <div style="display:flex; align-items:center; gap:12px;">
      <div class="nav-links">
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/about">About Us</a>
        <a href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a>
        <a href="${pageContext.request.contextPath}/current-issue" class="active">Current Issue</a>
        <a href="${pageContext.request.contextPath}/submit-article">Submit Article</a>
        <a href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a>
        <a href="${pageContext.request.contextPath}/contact">Contact</a>
      </div>

      <div class="nav-actions">
        <c:choose>
          <c:when test="${sessionScope.isLoggedIn}">
            <a class="btn" href="${pageContext.request.contextPath}/dashboard">
              <i class="fas fa-tachometer-alt"></i> Dashboard
            </a>
            <a class="btn" href="${pageContext.request.contextPath}/logout">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </c:when>
          <c:otherwise>
            <a class="btn" href="${pageContext.request.contextPath}/login">
              <i class="fas fa-sign-in-alt"></i> Login
            </a>
            <a class="btn" href="${pageContext.request.contextPath}/register">
              <i class="fas fa-user-plus"></i> Register
            </a>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</nav>

<header>
  <h1>Current Issue</h1>
  <p>Latest Published Research Articles in Ayurveda</p>
</header>

<!-- Current Issue Content -->
<section class="current-issue-section">
  <div class="container-main">
    <!-- Issue Header -->
    <div class="issue-header">
      <h1>Current Issue</h1>
      <p class="lead">January - March 2025 | Volume 1, Issue 1</p>
      <p>Total Articles Published: <strong>${not empty publishedArticles ? publishedArticles.size() : 0}</strong></p>
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
                    <i class="fas fa-user me-1"></i> 
                    <c:choose>
                      <c:when test="${not empty article.authorNames}">
                        ${fn:split(article.authorNames, '||')[0]}
                        <c:if test="${fn:length(fn:split(article.authorNames, '||')) > 1}">
                          et al.
                        </c:if>
                      </c:when>
                      <c:otherwise>
                        No Author
                      </c:otherwise>
                    </c:choose>
                  </span> 
                 <span>
    <i class="fas fa-calendar me-1"></i> 
    <c:choose>
        <c:when test="${not empty article.publicationDate}">
            ${article.publicationDate.month} ${article.publicationDate.dayOfMonth}, ${article.publicationDate.year}
        </c:when>
        <c:otherwise>
            <c:if test="${not empty article.updatedAt}">
                ${article.updatedAt.month} ${article.updatedAt.dayOfMonth}, ${article.updatedAt.year}
            </c:if>
        </c:otherwise>
    </c:choose>
</span>
                  <span class="article-type-badge">${article.articleType}</span>
                </div>
                <p class="article-abstract">
                  <c:if test="${not empty article.abstractText}">
                    <c:set var="abstractText" value="${article.abstractText}" />
                    <c:choose>
                      <c:when test="${fn:length(abstractText) > 200}">
                        ${fn:substring(abstractText, 0, 200)}...
                      </c:when>
                      <c:otherwise>
                        ${abstractText}
                      </c:otherwise>
                    </c:choose>
                  </c:if>
                  <c:if test="${empty article.abstractText}">
                    No abstract available.
                  </c:if>
                </p>
                <div class="article-actions">
    <!-- 1. View Abstract Button - Opens only abstract -->
    <a href="${pageContext.request.contextPath}/article/${article.id}/abstract" class="btn-abstract" target="_blank">
        <i class="fas fa-eye me-1"></i> View Abstract
    </a>
    
    <!-- 2. View Full HTML Button - Opens complete article with all fields -->
    <a href="${pageContext.request.contextPath}/article/${article.id}" class="btn-view" target="_blank">
        <i class="fas fa-file-alt me-1"></i> View Full Article
    </a>
    
    <!-- 3. Download PDF Button -->
    <c:if test="${not empty article.referencePdfPath}">
        <a href="${pageContext.request.contextPath}/download/${article.id}" class="btn-pdf">
            <i class="fas fa-download me-1"></i> Download PDF
        </a>
    </c:if>
</div>
              </div>
            </c:forEach>
          </div>
        </c:when>
        <c:otherwise>
          <div class="no-articles">
            <h3>No articles published yet.</h3>
            <p>Check back later for published research articles.</p>
            <a href="${pageContext.request.contextPath}/submit-article" class="btn-view" style="display:inline-block; margin-top:15px;">
              <i class="fas fa-upload me-1"></i> Submit Your Article
            </a>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</section>

<!-- Footer -->
<footer>
  © 2025 <span>Shree Ayurveda Journal</span> • Empowering Ayurvedic Research 🌿
</footer>

<script>
// Simple search functionality
document.querySelector('.search-form').addEventListener('submit', function(e) {
  e.preventDefault();
  const searchTerm = document.querySelector('.search-input').value.toLowerCase();
  const articles = document.querySelectorAll('.article-item');
  
  articles.forEach(article => {
    const title = article.querySelector('.article-title').textContent.toLowerCase();
    const authors = article.querySelector('.article-authors').textContent.toLowerCase();
    const abstract = article.querySelector('.article-abstract').textContent.toLowerCase();
    
    if (title.includes(searchTerm) || authors.includes(searchTerm) || abstract.includes(searchTerm)) {
      article.style.display = 'block';
    } else {
      article.style.display = 'none';
    }
  });
});
</script>

</body>
</html>