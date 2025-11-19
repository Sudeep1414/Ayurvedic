<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>${article.title} • Shree Ayurveda Journal</title>

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&family=Cinzel:wght@600;700&display=swap" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <style>
    :root {
      --deep-green: #0b5633;
      --leaf: #2b8a5f;
      --gold: #c9a25a;
      --cream: #fbf6ee;
      --paper: #f7efe6;
      --text: #2d2d2d;
      --rust: #7a4b3a;
      --radius: 12px;
      --shadow: 0 10px 30px rgba(11,74,57,0.06);
      --max-width: 1200px;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: var(--cream);
      color: var(--text);
      line-height: 1.7;
      -webkit-font-smoothing: antialiased;
    }

    .container {
      max-width: var(--max-width);
      margin: 0 auto;
      padding: 0 2rem;
    }

    /* Navigation */
    nav {
      background: linear-gradient(135deg, var(--deep-green), var(--leaf));
      padding: 1rem 0;
      box-shadow: var(--shadow);
      position: sticky;
      top: 0;
      z-index: 1000;
    }

    .nav-inner {
      max-width: var(--max-width);
      margin: 0 auto;
      padding: 0 2rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      gap: 1rem;
    }

    .site-title {
      font-family: 'Cinzel', serif;
      font-size: 1.8rem;
      font-weight: 700;
      color: var(--cream);
    }

    .nav-links {
      display: flex;
      gap: 1.5rem;
      flex-wrap: wrap;
    }

    .nav-links a {
      color: var(--cream);
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s ease;
      padding: 0.5rem 0;
      border-bottom: 2px solid transparent;
    }

    .nav-links a:hover {
      color: var(--gold);
      border-bottom-color: var(--gold);
    }

    .nav-actions {
      display: flex;
      gap: 1rem;
      align-items: center;
    }

    .btn {
      background: rgba(251, 246, 238, 0.2);
      color: var(--cream);
      padding: 0.6rem 1.2rem;
      border-radius: var(--radius);
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s ease;
      border: 1px solid rgba(251, 246, 238, 0.3);
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
    }

    .btn:hover {
      background: rgba(251, 246, 238, 0.3);
      transform: translateY(-2px);
    }

    /* Header */
    header {
      background: var(--paper);
      padding: 3rem 0;
      text-align: center;
      border-bottom: 1px solid rgba(11, 86, 51, 0.1);
    }

    header h1 {
      font-family: 'Cinzel', serif;
      font-size: 2.5rem;
      color: var(--deep-green);
      margin-bottom: 1rem;
      line-height: 1.3;
      font-weight: 700;
    }

    header p {
      font-size: 1.1rem;
      color: var(--rust);
      opacity: 0.9;
    }

    /* Main Content */
    section {
      padding: 3rem 0;
      background: var(--paper);
    }

    .btn-group {
      display: flex;
      justify-content: center;
      margin-bottom: 3rem;
    }

    .btn-group button {
      background: var(--leaf);
      color: var(--cream);
      border: none;
      padding: 1rem 2rem;
      border-radius: var(--radius);
      font-size: 1.1rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      display: inline-flex;
      align-items: center;
      gap: 0.8rem;
      box-shadow: var(--shadow);
    }

    .btn-group button:hover {
      background: var(--deep-green);
      transform: translateY(-3px);
      box-shadow: 0 15px 30px rgba(11, 86, 51, 0.2);
    }

    /* Article Metadata */
    .article-meta-info {
      background: var(--cream);
      padding: 2rem;
      border-radius: var(--radius);
      margin-bottom: 2rem;
      box-shadow: var(--shadow);
      border: 1px solid rgba(11, 86, 51, 0.1);
    }

    .meta-row {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 1.5rem;
      margin-bottom: 1.5rem;
    }

    .meta-row:last-child {
      margin-bottom: 0;
    }

    .meta-item {
      text-align: center;
    }

    .meta-label {
      font-weight: 600;
      color: var(--deep-green);
      font-size: 0.9rem;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-bottom: 0.5rem;
    }

    .meta-value {
      font-size: 1.1rem;
      color: var(--text);
      font-weight: 500;
    }

    /* Authors Section */
    .authors-list {
      background: var(--cream);
      padding: 2rem;
      border-radius: var(--radius);
      margin-bottom: 2rem;
      box-shadow: var(--shadow);
    }

    .authors-list h3 {
      color: var(--deep-green);
      margin-bottom: 1.5rem;
      font-family: 'Cinzel', serif;
      font-size: 1.5rem;
      border-bottom: 2px solid var(--gold);
      padding-bottom: 0.5rem;
      display: inline-block;
    }

    .author-item {
      background: var(--paper);
      padding: 1.5rem;
      border-radius: var(--radius);
      margin-bottom: 1rem;
      border-left: 4px solid var(--leaf);
    }

    .author-item:last-child {
      margin-bottom: 0;
    }

    .author-item strong {
      color: var(--deep-green);
      font-size: 1.1rem;
    }

    /* Content Sections */
    .section-divider {
      height: 2px;
      background: linear-gradient(90deg, transparent, var(--gold), transparent);
      margin: 3rem 0;
    }

    h3 {
      color: var(--deep-green);
      font-family: 'Cinzel', serif;
      font-size: 1.8rem;
      margin: 2rem 0 1.5rem 0;
      border-bottom: 2px solid var(--gold);
      padding-bottom: 0.5rem;
    }

    p {
      margin-bottom: 1.5rem;
      font-size: 1.1rem;
      line-height: 1.8;
    }

    /* Citation Box */
    .citation-box {
      background: var(--cream);
      padding: 2rem;
      border-radius: var(--radius);
      margin: 2rem 0;
      border-left: 4px solid var(--gold);
      box-shadow: var(--shadow);
    }

    .citation-box strong {
      color: var(--deep-green);
      display: block;
      margin-bottom: 1rem;
      font-size: 1.1rem;
    }

    /* Back Link */
    .back-link {
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      color: var(--rust);
      text-decoration: none;
      font-weight: 500;
      margin-top: 3rem;
      padding: 1rem 2rem;
      background: var(--cream);
      border-radius: var(--radius);
      transition: all 0.3s ease;
      border: 1px solid rgba(122, 75, 58, 0.2);
    }

    .back-link:hover {
      background: var(--rust);
      color: var(--cream);
      transform: translateX(-5px);
    }

    /* Footer */
    footer {
      background: var(--deep-green);
      color: var(--cream);
      text-align: center;
      padding: 2rem;
      margin-top: 3rem;
    }

    footer span {
      color: var(--gold);
      font-weight: 600;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .container {
        padding: 0 1rem;
      }

      .nav-inner {
        flex-direction: column;
        text-align: center;
        gap: 1.5rem;
      }

      .nav-links {
        justify-content: center;
      }

      .nav-actions {
        justify-content: center;
      }

      header h1 {
        font-size: 2rem;
      }

      .meta-row {
        grid-template-columns: 1fr;
      }

      .btn-group button {
        width: 100%;
        justify-content: center;
      }

      section {
        padding: 2rem 0;
      }
    }

    @media (max-width: 480px) {
      header h1 {
        font-size: 1.8rem;
      }

      .nav-links {
        flex-direction: column;
        gap: 1rem;
      }

      .nav-actions {
        flex-direction: column;
        width: 100%;
      }

      .btn {
        width: 100%;
        justify-content: center;
      }
    }
  </style>
</head>
<body>

<!-- Navigation -->
<nav>
  <div class="nav-inner">
    <div class="site-title">Shree Ayurveda Journal</div>

    <div style="display:flex; align-items:center; gap:1.5rem; flex-wrap: wrap;">
      <div class="nav-links">
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/about">About Us</a>
        <a href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a>
        <a href="${pageContext.request.contextPath}/current-issue">Current Issue</a>
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

<!-- Article Header -->
<header>
  <div class="container">
    <h1>${article.title}</h1>
    <p>
      <c:if test="${not empty article.articleType}">${article.articleType} • </c:if>
      <c:if test="${not empty article.volume}">${article.volume}</c:if>
      <c:if test="${not empty article.issue}">, ${article.issue}</c:if>
      <c:if test="${not empty article.publicationDate}"> • Published: ${article.publicationDate}</c:if>
    </p>
  </div>
</header>

<!-- Article Content -->
<section>
  <div class="container">
    <div class="btn-group">
      <button onclick="downloadPdf()">
        <i class="fas fa-download"></i> Download PDF
      </button>
    </div>

    <div id="content">
      <!-- Article Metadata -->
      <div class="article-meta-info">
        <div class="meta-row">
          <div class="meta-item">
            <div class="meta-label">Article ID</div>
            <div class="meta-value">${article.articleId}</div>
          </div>
          <div class="meta-item">
            <div class="meta-label">Article Type</div>
            <div class="meta-value">${article.articleType}</div>
          </div>
          <div class="meta-item">
            <div class="meta-label">Volume & Issue</div>
            <div class="meta-value">${article.volume}, ${article.issue}</div>
          </div>
        </div>
        
        <div class="meta-row">
          <div class="meta-item">
            <div class="meta-label">Publication Date</div>
            <div class="meta-value">
              <c:choose>
                <c:when test="${not empty article.publicationDate}">
                  ${article.publicationDate}
                </c:when>
                <c:otherwise>
                  Not specified
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <div class="meta-item">
            <div class="meta-label">Acceptance Date</div>
            <div class="meta-value">
              <c:choose>
                <c:when test="${not empty article.acceptanceDate}">
                  ${article.acceptanceDate}
                </c:when>
                <c:otherwise>
                  Not specified
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <c:if test="${not empty article.numberOfPages}">
            <div class="meta-item">
              <div class="meta-label">Pages</div>
              <div class="meta-value">${article.numberOfPages}</div>
            </div>
          </c:if>
        </div>
      </div>

      <!-- Authors -->
      <c:if test="${not empty article.authorNames}">
        <div class="authors-list">
          <h3>Authors</h3>
          <c:set var="authorNames" value="${fn:split(article.authorNames, '||')}" />
          <c:set var="authorDetails" value="${fn:split(article.authorDetails, '||')}" />
          <c:forEach var="i" begin="0" end="${fn:length(authorNames) - 1}">
            <div class="author-item">
              <strong>${authorNames[i]}</strong>
              <c:if test="${not empty authorDetails[i]}">
                <br><span style="color: #666; font-size: 0.9rem;">${authorDetails[i]}</span>
              </c:if>
            </div>
          </c:forEach>
        </div>
      </c:if>

      <!-- Citation -->
      <c:if test="${not empty article.citation}">
        <div class="citation-box">
          <strong>How to cite this article:</strong>
          ${article.citation}
        </div>
      </c:if>

      <!-- Abstract -->
      <c:if test="${not empty article.abstractText}">
        <div class="section-divider"></div>
        <h3>Abstract</h3>
        <p>${article.abstractText}</p>
        
        <c:if test="${not empty article.abstractKeywords}">
          <p><strong>Keywords:</strong> ${article.abstractKeywords}</p>
        </c:if>
      </c:if>

      <!-- Introduction -->
      <c:if test="${not empty article.introduction}">
        <div class="section-divider"></div>
        <h3>Introduction</h3>
        <p>${article.introduction}</p>
      </c:if>

      <!-- Section Content -->
      <c:if test="${not empty article.sectionContent}">
        <div class="section-divider"></div>
        <h3>Methods</h3>
        <p>${article.sectionContent}</p>
      </c:if>

      <!-- Discussion -->
      <c:if test="${not empty article.discussionContent}">
        <div class="section-divider"></div>
        <h3>Discussion</h3>
        <p>${article.discussionContent}</p>
      </c:if>

      <!-- Conclusion -->
      <c:if test="${not empty article.conclusionContent}">
        <div class="section-divider"></div>
        <h3>Conclusion</h3>
        <p>${article.conclusionContent}</p>
      </c:if>

      <!-- References -->
      <c:if test="${not empty article.referencesText}">
        <div class="section-divider"></div>
        <h3>References</h3>
        <p style="white-space: pre-wrap;">${article.referencesText}</p>
      </c:if>
    </div>

    <a href="${pageContext.request.contextPath}/current-issue" class="back-link">
      <i class="fas fa-arrow-left"></i> Back to Published Articles
    </a>
  </div>
</section>

<!-- Footer -->
<footer>
  © 2025 <span>Shree Ayurveda Journal</span> • Empowering Ayurvedic Research 🌿
</footer>

<script>
// DOWNLOAD PDF FUNCTION
function downloadPdf() {
    const articleId = "${article.id}";
    const url = "${pageContext.request.contextPath}/download/" + articleId;
    console.log("Downloading PDF from URL:", url);
    
    // Create a temporary anchor element to trigger download
    const link = document.createElement('a');
    link.href = url;
    link.target = '_blank';
    link.download = 'article_' + articleId + '.pdf';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}
</script>

</body>
</html>