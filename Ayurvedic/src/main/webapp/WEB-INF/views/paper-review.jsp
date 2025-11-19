<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>Paper Review - AVUSCRIPT</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>

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
      --shadow: 0 10px 30px rgba(11, 74, 57, 0.06);
      --primary: var(--deep-green);
      --primary-dark: #083c23;
      --primary-light: var(--leaf);
      --secondary: var(--rust);
      --success: var(--leaf);
      --warning: var(--gold);
      --info: #4a7c59;
      --light: var(--paper);
      --dark: var(--text);
      --gray: #6b6b6b;
      --light-gray: #e8e0d5;
      --white: var(--cream);
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background-color: var(--cream);
      color: var(--text);
      line-height: 1.6;
      display: flex;
      min-height: 100vh;
    }

    /* Sidebar */
    .sidebar {
      width: 250px;
      background: var(--deep-green);
      color: var(--cream);
      height: 100vh;
      position: fixed;
      transition: all 0.3s;
      z-index: 1000;
      box-shadow: var(--shadow);
    }

    .sidebar-header {
      padding: 1.5rem 1rem;
      border-bottom: 1px solid rgba(251, 246, 238, 0.1);
      text-align: center;
      background: var(--primary-dark);
    }

    .sidebar-header h2 {
      font-size: 1.5rem;
      font-weight: 600;
      color: var(--gold);
    }

    .sidebar-menu {
      padding: 1rem 0;
      height: calc(100vh - 80px);
      overflow-y: auto;
    }

    .sidebar-menu ul {
      list-style: none;
    }

    .sidebar-menu li {
      margin-bottom: 0.5rem;
    }

    .sidebar-menu a {
      display: flex;
      align-items: center;
      padding: 0.8rem 1.5rem;
      color: rgba(251, 246, 238, 0.9);
      text-decoration: none;
      transition: all 0.3s;
    }

    .sidebar-menu a:hover, .sidebar-menu a.active {
      background: rgba(201, 162, 90, 0.15);
      color: var(--gold);
      border-left: 4px solid var(--gold);
    }

    .sidebar-menu i {
      margin-right: 0.8rem;
      font-size: 1.2rem;
      width: 20px;
      text-align: center;
    }

    /* Main Content */
    .main-content {
      flex: 1;
      margin-left: 250px;
      padding: 1.5rem;
      transition: all 0.3s;
      background: var(--cream);
    }

    /* Top Bar */
    .top-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: var(--paper);
      padding: 1rem 1.5rem;
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      margin-bottom: 1.5rem;
      border: 1px solid var(--light-gray);
    }

    .search-box {
      display: flex;
      align-items: center;
      background: var(--cream);
      border-radius: 30px;
      padding: 0.5rem 1rem;
      width: 300px;
      border: 1px solid var(--light-gray);
    }

    .search-box input {
      border: none;
      background: transparent;
      outline: none;
      width: 100%;
      padding: 0.3rem;
      color: var(--text);
    }

    .search-box input::placeholder {
      color: var(--gray);
    }

    .user-info {
      display: flex;
      align-items: center;
      gap: 1rem;
    }

    .user-details {
      text-align: right;
    }

    .user-details .user-name {
      font-weight: 600;
      color: var(--deep-green);
    }

    .user-details .user-role {
      font-size: 0.8rem;
      color: var(--rust);
    }

    .user-avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: var(--deep-green);
      color: var(--gold);
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      border: 2px solid var(--gold);
    }

    /* Paper Review Content */
    .paper-review-content {
      max-width: 1200px;
      margin: 0 auto;
      background: var(--paper);
      padding: 2rem;
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      border: 1px solid var(--light-gray);
    }

    h1 {
      text-align: center;
      color: var(--deep-green);
      margin-bottom: 2rem;
      font-size: 2rem;
      font-weight: 600;
    }

    h3 {
      margin: 0;
      padding-bottom: 10px;
      color: var(--deep-green);
      font-size: 1.3rem;
      border-bottom: 2px solid var(--gold);
      display: inline-block;
    }

    .content-area {
      margin-top: 2rem;
      padding: 1.5rem;
      border: 1px solid var(--light-gray);
      border-radius: var(--radius);
      background: var(--cream);
    }

    .form-container {
      margin-top: 1.5rem;
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 500;
      color: var(--deep-green);
    }

    .form-control {
      width: 100%;
      padding: 12px;
      border-radius: var(--radius);
      border: 2px solid var(--light-gray);
      font-size: 1rem;
      transition: border-color 0.3s;
      background: var(--paper);
      color: var(--text);
    }

    .form-control:focus {
      outline: none;
      border-color: var(--leaf);
    }

    textarea.form-control {
      resize: vertical;
    }

    input[type="date"] {
      padding: 12px;
    }

    .readonly-input {
      background: var(--light-gray);
      border: 2px solid var(--light-gray);
      color: var(--gray);
    }

    /* ------------ GRID ROWS ------------- */
    .form-row-3 {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 1.5rem;
    }

    .form-row {
      display: grid;
      grid-template-columns: 60px 1fr 2fr 70px;
      align-items: center;
      gap: 1rem;
      margin-bottom: 1rem;
    }

    .author-no {
      width: 60px;
      padding: 12px;
      background: var(--light-gray);
      border-radius: var(--radius);
      text-align: center;
      font-weight: bold;
      border: 2px solid var(--light-gray);
      color: var(--deep-green);
    }

    /* ------------ BUTTONS ------------- */
    .btn {
      padding: 0.6rem 1.2rem;
      border: none;
      border-radius: var(--radius);
      font-size: 0.9rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
    }

    .mini-btn {
      padding: 8px 14px;
      background: var(--deep-green);
      color: var(--cream);
      border-radius: var(--radius);
      border: none;
      cursor: pointer;
      font-size: 0.8rem;
      font-weight: 600;
      transition: all 0.3s;
    }

    .mini-btn:hover {
      background: var(--primary-dark);
      transform: translateY(-1px);
    }

    .remove-btn {
      background: var(--rust) !important;
    }

    .remove-btn:hover {
      background: #6a4132 !important;
      transform: translateY(-1px);
    }

    /* ------------ Action Buttons ------------- */
    .action-row {
      margin: 2.5rem 0 1rem;
      display: flex;
      gap: 1rem;
      justify-content: center;
    }

    .publish-btn {
      background: var(--leaf);
      color: var(--cream);
      padding: 12px 30px;
      border-radius: var(--radius);
      border: none;
      cursor: pointer;
      font-size: 1rem;
      font-weight: 600;
      transition: all 0.3s;
    }

    .publish-btn:hover {
      background: #237a52;
      transform: translateY(-2px);
    }

    .cancel-btn {
      background: var(--rust);
      color: var(--cream);
      padding: 12px 30px;
      border-radius: var(--radius);
      border: none;
      cursor: pointer;
      font-size: 1rem;
      font-weight: 600;
      transition: all 0.3s;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      justify-content: center;
    }

    .cancel-btn:hover {
      background: #6a4132;
      transform: translateY(-2px);
    }

    /* File Upload */
    input[type="file"] {
      padding: 10px;
      border-radius: var(--radius);
      border: 2px solid var(--light-gray);
      background: var(--paper);
      width: 100%;
    }

    /* Small text */
    small {
      font-size: 0.8rem;
      color: var(--rust);
    }

    /* Paper Review Tabs */
    .paper-review-tabs {
      background: var(--paper);
      padding: 15px 20px;
      border-radius: var(--radius);
      border: 1px solid var(--light-gray);
      margin-bottom: 20px;
      display: flex;
      gap: 20px;
      font-size: 16px;
      font-weight: 600;
      overflow-x: auto;
      box-shadow: var(--shadow);
    }

    .paper-review-tabs a {
      text-decoration: none;
      color: var(--deep-green);
      padding: 8px 12px;
      border-radius: 6px;
      transition: all 0.3s;
      white-space: nowrap;
      position: relative;
    }

    .paper-review-tabs a:hover {
      background: rgba(11, 86, 51, 0.1);
    }

    .paper-review-tabs a.active {
      background: var(--deep-green);
      color: var(--cream);
    }

    /* Tab Content */
    .tab-content {
      display: none;
    }

    .tab-content.active {
      display: block;
    }

    /* Responsive */
    @media (max-width: 992px) {
      .sidebar {
        width: 70px;
        overflow: hidden;
      }
      .sidebar-header h2, .sidebar-menu span {
        display: none;
      }
      .sidebar-menu a {
        justify-content: center;
        padding: 1rem;
      }
      .sidebar-menu i {
        margin-right: 0;
        font-size: 1.5rem;
      }
      .main-content {
        margin-left: 70px;
      }
      .form-row-3 {
        grid-template-columns: 1fr;
      }
      .form-row {
        grid-template-columns: 50px 1fr 1fr 50px;
        gap: 0.8rem;
      }
    }

    @media (max-width: 768px) {
      .sidebar {
        width: 0;
      }
      .main-content {
        margin-left: 0;
      }
      .sidebar.active {
        width: 250px;
      }
      .sidebar.active .sidebar-header h2, .sidebar.active .sidebar-menu span {
        display: block;
      }
      .form-row {
        grid-template-columns: 1fr;
        gap: 0.5rem;
      }
      .author-no {
        width: 100%;
      }
    }

    /* Mobile menu toggle */
    .menu-toggle {
      display: none;
      position: fixed;
      top: 1rem;
      left: 1rem;
      z-index: 3000;
      background: var(--deep-green);
      color: var(--gold);
      border: none;
      border-radius: 5px;
      padding: 0.5rem;
      font-size: 1.2rem;
      cursor: pointer;
    }

    @media (max-width: 768px) {
      .menu-toggle {
        display: block;
      }
    }
  </style>
</head>

<body>
  <!-- Mobile Menu Toggle -->
  <button class="menu-toggle" id="menuToggle">
    <i class="fas fa-bars"></i>
  </button>

  <!-- Sidebar -->
  <div class="sidebar" id="sidebar">
    <div class="sidebar-header">
      <h2>AVUSCRIPT</h2>
    </div>

    <nav class="sidebar-menu">
      <ul>
        <li><a href="${pageContext.request.contextPath}/admin/dashboard"> 
          <i class="fas fa-home"></i> <span>Dashboard</span>
        </a></li>
        
        <!-- Submissions -->
        <li><a href="${pageContext.request.contextPath}/admin/submissions"> 
          <i class="fas fa-file"></i> <span>Submissions</span>
        </a></li>
        
        <li><a href="${pageContext.request.contextPath}/admin/paper-review" class="active"> 
          <i class="fas fa-file-alt"></i> <span>Paper Review</span>
        </a></li>

        <li><a href="${pageContext.request.contextPath}/admin/conferences"> 
          <i class="fas fa-calendar"></i> <span>Conferences</span>
        </a></li>

        <li><a href="${pageContext.request.contextPath}/admin/editorial-board"> 
          <i class="fas fa-users"></i> <span>Editorial Board</span>
        </a></li>

        <li><a href="${pageContext.request.contextPath}/admin/about-contact"> 
          <i class="fas fa-info-circle"></i> <span>About & Contact Us</span>
        </a></li>

        <li><a href="${pageContext.request.contextPath}/admin/author-login-details"> 
          <i class="fas fa-user-lock"></i> <span>Author Login Details</span>
        </a></li>

        <li><a href="${pageContext.request.contextPath}/admin/submit-article"> 
          <i class="fas fa-upload"></i> <span>Submit Article</span>
        </a></li>

        <li><a href="${pageContext.request.contextPath}/admin/previous-volumes"> 
          <i class="fas fa-book"></i> <span>Previous Volumes And Issues</span>
        </a></li>

        <li><a href="${pageContext.request.contextPath}/admin/contact-enquiries"> 
          <i class="fas fa-envelope-open"></i> <span>Contact Enquires</span>
        </a></li>

        <li><a href="${pageContext.request.contextPath}/admin/visit-website"> 
          <i class="fas fa-globe"></i> <span>Visit Website</span>
        </a></li>


        <li><a href="${pageContext.request.contextPath}/logout"> 
          <i class="fas fa-sign-out-alt"></i> <span>Logout</span>
        </a></li>
      </ul>
    </nav>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <!-- Top Bar -->
    <div class="top-bar">
      <div class="search-box">
        <i class="fas fa-search" style="color: var(--rust);"></i> 
        <input type="text" placeholder="Search...">
      </div>
      <div class="user-info">
        <div class="user-details">
          <div class="user-name">Administrator</div>
          <div class="user-role">Super Admin</div>
        </div>
        <div class="user-avatar">
          <i class="fas fa-user"></i>
        </div>
      </div>
    </div>

    <!-- Paper Review Tabs -->
    <div class="paper-review-tabs">
      <a href="#" class="tab-link active" data-tab="titleAuthorTab">
        Title and Author 
      </a> 
      <a href="#" class="tab-link" data-tab="abstractIntroTab">
        Abstract and Introduction 
      </a> 
      <a href="#" class="tab-link" data-tab="referenceTab">
        Reference 
      </a>
    </div>

    <!-- Paper Review Content -->
    <div class="paper-review-content">
      <h1>Paper Review</h1>

      <form id="paperReviewForm" method="post"
            action="${pageContext.request.contextPath}/admin/paper-review/save"
            enctype="multipart/form-data">

        <input type="hidden" id="submissionIdHidden" value="${submissionId}">
        <input type="hidden" id="authorIdHidden" name="authorId" value="${authorId}" />

        <!-- ======================== TITLE & AUTHOR TAB ============================== -->
        <div class="tab-content active" id="titleAuthorTab">
          <div class="content-area">
            <div class="content-header"><h3>Title and Author</h3></div>

            <div class="form-container">
              <!-- Article Id + Type + Volume -->
              <div class="form-row-3">
                <div class="form-group">
                  <label>Article Id</label>
                  <input type="text" id="articleId" name="articleId"
                         class="form-control readonly-input" readonly
                         value="${articleId != null ? articleId : '' }" />
                  <small>
                    Auto-generated: Ayush_{authorId}_{MM}_{YYYY}
                  </small>
                </div>

                <div class="form-group">
                  <label>Article Type *</label>
                  <select id="articleType" name="articleType" class="form-control"
                          required onchange="handleDynamicOption(this, 'articleTypes')">
                    <option value="">Select Article Type</option>
                    <c:forEach var="at" items="${articleTypes}">
                      <option value="${at}" ${selectedArticleType == at ? 'selected' : ''}>${at}</option>
                    </c:forEach>
                    <option value="__add_new__">+ Add New</option>
                  </select>
                </div>

                <div class="form-group">
                  <label>Volume *</label>
                  <select id="volume" name="volume" class="form-control"
                          required onchange="handleDynamicOption(this, 'volumes')">
                    <option value="">Select Volume</option>
                    <c:forEach var="v" items="${volumes}">
                      <option value="${v}" ${selectedVolume == v ? 'selected' : ''}>${v}</option>
                    </c:forEach>
                    <option value="__add_new__">+ Add New</option>
                  </select>
                </div>
              </div>

              <!-- Issue + Dates -->
              <div class="form-row-3" style="margin-top:1rem;">
                <div class="form-group">
                  <label>Issue *</label>
                  <select id="issue" name="issue" class="form-control"
                          required onchange="handleDynamicOption(this, 'issues')">
                    <option value="">Select Issue</option>
                    <c:forEach var="i" items="${issues}">
                      <option value="${i}" ${selectedIssue == i ? 'selected' : ''}>${i}</option>
                    </c:forEach>
                    <option value="__add_new__">+ Add New</option>
                  </select>
                </div>

                <div class="form-group">
                  <label>Date of Publication *</label>
                  <input type="date" id="publicationDate" name="publicationDate"
                         class="form-control" required />
                </div>

                <div class="form-group">
                  <label>Date of Acceptance *</label>
                  <input type="date" id="acceptanceDate" name="acceptanceDate"
                         class="form-control" required />
                </div>
              </div>

              <!-- Title -->
              <div class="form-group" style="margin-top:1rem;">
                <label>Title *</label>
                <textarea id="paperTitle" name="title" class="form-control" rows="2" required></textarea>
              </div>

              <!-- Citation -->
              <div class="form-group" style="margin-top:1rem;">
                <label>How to Cite This Article *</label>
                <textarea id="citation" name="citation" class="form-control" rows="2" required></textarea>
              </div>

              <!-- Authors -->
              <div class="form-group" style="margin-top:1rem;">
                <label>Authors *</label>
                <div id="authorsContainer">
                  <div class="author-row" data-index="0">
                    <div class="form-row">
                      <div><div class="author-no">1</div></div>
                      <div><input type="text" name="authorNames" class="form-control" placeholder="Author's Name" required></div>
                      <div><input type="text" name="authorDetails" class="form-control" placeholder="Author's Details" required></div>
                      <div><button type="button" class="mini-btn" onclick="addAuthorRow()">+</button></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- ======================== ABSTRACT & INTRODUCTION TAB ============================== -->
        <div class="tab-content" id="abstractIntroTab">
          <div class="content-area">
            <div class="content-header"><h3>Abstract & Introduction</h3></div>

            <div class="form-container">
              <div class="form-group">
                <label>Abstract *</label>
                <textarea id="abstract" name="abstractText" class="form-control" rows="6" required></textarea>
              </div>

              <div class="form-group">
                <label>Abstract Keywords</label>
                <input type="text" id="abstractKeywords" name="abstractKeywords" class="form-control" />
              </div>

              <div class="form-group">
                <label>Introduction *</label>
                <textarea id="introduction" name="introduction" class="form-control" rows="6" required></textarea>
              </div>
            </div>
          </div>
        </div>

        <!-- ======================== REFERENCE TAB ============================== -->
        <div class="tab-content" id="referenceTab">
          <div class="content-area">
            <div class="content-header"><h3>References</h3></div>

            <div class="form-container">
              <div class="form-group">
                <label>References</label>
                <textarea id="references" name="references" class="form-control" rows="6"></textarea>
              </div>

              <div class="form-group">
                <label>Submit PDF copy only</label>
                <input type="file" name="referencePdf" accept=".pdf" class="form-control" />
              </div>

              <div class="form-group">
                <label>Number of Pages (PDF)</label>
                <input type="number" name="numberOfPages" class="form-control" min="1" />
              </div>
            </div>
          </div>
        </div>

        <!-- ======================== ACTION BUTTONS ============================== -->
        <div class="action-row">
          <a href="${pageContext.request.contextPath}/submit" class="publish-btn">
            <i class="fas fa-paper-plane"></i> Publish
          </button>

          <a href="${pageContext.request.contextPath}/admin/dashboard" class="cancel-btn">
            <i class="fas fa-times"></i> Cancel
          </a>
        </div>

      </form>
    </div>
  </div>

  <!-- ======================== JAVASCRIPT ============================== -->

  <script>
  // Initialize CKEditor for all textareas
  CKEDITOR.replace('abstract');
  CKEDITOR.replace('introduction');
  CKEDITOR.replace('references');

  // Tab navigation functionality
  document.querySelectorAll('.tab-link').forEach(tab => {
    tab.addEventListener('click', function(e) {
      e.preventDefault();
      
      // Remove active class from all tabs and contents
      document.querySelectorAll('.tab-link').forEach(t => t.classList.remove('active'));
      document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
      
      // Add active class to clicked tab and corresponding content
      this.classList.add('active');
      const tabId = this.getAttribute('data-tab');
      document.getElementById(tabId).classList.add('active');
    });
  });

  // Add author dynamic row
  function addAuthorRow(){
    const container=document.getElementById('authorsContainer');
    const idx=container.querySelectorAll('.author-row').length;
    const row=document.createElement('div');
    row.className='author-row';
    row.setAttribute('data-index',idx);
    row.innerHTML=`
      <div class="form-row">
        <div><div class="author-no">${idx+1}</div></div>
        <div><input type="text" name="authorNames" class="form-control" required></div>
        <div><input type="text" name="authorDetails" class="form-control" required></div>
        <div><button type="button" class="mini-btn remove-btn" onclick="removeAuthorRow(this)">-</button></div>
      </div>`;
    container.appendChild(row);
    updateAuthorNumbers();
  }

  function removeAuthorRow(btn){
    btn.closest('.author-row').remove();
    updateAuthorNumbers();
  }

  function updateAuthorNumbers(){
    document.querySelectorAll('.author-no').forEach((el,i)=>el.textContent=i+1);
  }

  // Auto-generate Article ID
  function generateArticleIdIfPossible(){
    const submissionId = document.getElementById('submissionIdHidden').value;
    const pub = document.getElementById('publicationDate');
    const out = document.getElementById('articleId');

    function compute(){
      const d = pub.value ? new Date(pub.value) : new Date();
      const mm = String(d.getMonth() + 1).padStart(2, '0');
      const yyyy = d.getFullYear();

      // NEW FORMAT
      out.value = 'Ayush_' + submissionId + '_' + mm + '_' + yyyy;
    }

    compute();
    pub.addEventListener('change', compute);
  }

  generateArticleIdIfPossible();

  // Dynamic dropdown option add
  function handleDynamicOption(selectEl, type) {
    if(selectEl.value === '__add_new__') {
      const newVal = prompt('Enter new value to add:');
      if(newVal && newVal.trim() !== '') {
        const opt = document.createElement('option');
        opt.value = newVal;
        opt.textContent = newVal;
        selectEl.insertBefore(opt, selectEl.lastElementChild);
        selectEl.value = newVal;
      } else {
        selectEl.value = '';
      }
    }
  }

  // Mobile menu toggle
  document.getElementById('menuToggle').addEventListener('click', function() {
    const sidebar = document.getElementById('sidebar');
    sidebar.classList.toggle('active');
  });
  </script>

</body>
</html>