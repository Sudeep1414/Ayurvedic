<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard - AVUSCRIPT</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

/* Dashboard Header */
.dashboard-header {
	margin-bottom: 1.5rem;
}

.dashboard-header h1 {
	color: var(--deep-green);
	font-size: 1.8rem;
	margin-bottom: 0.5rem;
}

.dashboard-header p {
	color: var(--rust);
}

/* Stats Cards */
.stats-cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
	gap: 1.5rem;
	margin-bottom: 2rem;
}

.stat-card {
	background: var(--paper);
	padding: 1.5rem;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	display: flex;
	align-items: center;
	transition: transform 0.3s, box-shadow 0.3s;
	border: 1px solid var(--light-gray);
}

.stat-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 15px 35px rgba(11, 74, 57, 0.1);
}

.stat-icon {
	width: 60px;
	height: 60px;
	border-radius: var(--radius);
	display: flex;
	align-items: center;
	justify-content: center;
	margin-right: 1rem;
	font-size: 1.5rem;
}

.stat-icon.total {
	background: rgba(11, 86, 51, 0.1);
	color: var(--deep-green);
}

.stat-icon.pending {
	background: rgba(201, 162, 90, 0.15);
	color: var(--gold);
}

.stat-icon.reviewed {
	background: rgba(43, 138, 95, 0.15);
	color: var(--leaf);
}

.stat-icon.published {
	background: rgba(122, 75, 58, 0.1);
	color: var(--rust);
}

.stat-content {
	flex: 1;
}

.stat-number {
	font-size: 2rem;
	font-weight: 700;
	margin-bottom: 0.2rem;
	color: var(--deep-green);
}

.stat-label {
	color: var(--rust);
	font-size: 0.9rem;
}

.stat-change {
	font-size: 0.8rem;
	margin-top: 0.3rem;
	font-weight: 600;
}

.stat-change.positive {
	color: var(--leaf);
}

.stat-change.negative {
	color: var(--rust);
}

/* Content Area */
.content-area {
	background: var(--paper);
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	overflow: hidden;
	border: 1px solid var(--light-gray);
}

.content-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1.5rem;
	border-bottom: 1px solid var(--light-gray);
	background: rgba(11, 86, 51, 0.03);
}

.content-header h3 {
	color: var(--deep-green);
	font-size: 1.3rem;
}

.content-actions {
	display: flex;
	gap: 0.8rem;
}

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

.btn-primary {
	background: var(--deep-green);
	color: var(--cream);
}

.btn-primary:hover {
	background: var(--primary-dark);
	transform: translateY(-2px);
}

.btn-outline {
	background: transparent;
	border: 1px solid var(--deep-green);
	color: var(--deep-green);
}

.btn-outline:hover {
	background: var(--deep-green);
	color: var(--cream);
	transform: translateY(-2px);
}

.btn-success {
	background: var(--leaf);
	color: var(--cream);
}

.btn-success:hover {
	background: #237a52;
	transform: translateY(-2px);
}

.btn-info {
	background: var(--rust);
	color: var(--cream);
}

.btn-info:hover {
	background: #6a4132;
	transform: translateY(-2px);
}

/* Table */
.table-container {
	overflow-x: auto;
	padding: 0 1.5rem 1.5rem;
}

.table {
	width: 100%;
	border-collapse: collapse;
	min-width: 1000px;
}

.table th, .table td {
	padding: 12px 15px;
	text-align: left;
	border-bottom: 1px solid var(--light-gray);
}

.table th {
	background: rgba(11, 86, 51, 0.05);
	color: var(--deep-green);
	font-weight: 600;
	position: sticky;
	top: 0;
}

.table tr:hover {
	background: rgba(201, 162, 90, 0.05);
}

.status {
	padding: 6px 12px;
	border-radius: 20px;
	font-size: 0.8rem;
	font-weight: bold;
	display: inline-block;
}

.status-submitted {
	background: rgba(201, 162, 90, 0.15);
	color: var(--gold);
}

.status-reviewed {
	background: rgba(43, 138, 95, 0.15);
	color: var(--leaf);
}

.status-published {
	background: rgba(122, 75, 58, 0.1);
	color: var(--rust);
}

.action-buttons {
	display: flex;
	gap: 0.5rem;
	flex-wrap: nowrap;
	align-items: center;
	justify-content: flex-start;
}

.btn-sm {
	padding: 6px 10px;
	font-size: 0.8rem;
	position: relative;
	flex-shrink: 0;
	min-width: 36px;
}

.btn-download {
	background: var(--leaf);
	color: var(--cream);
}

.btn-download:hover {
	background: #237a52;
	transform: translateY(-1px);
}

.btn-email {
	background: var(--rust);
	color: var(--cream);
}

.btn-email:hover {
	background: #6a4132;
	transform: translateY(-1px);
}

.btn-edit {
	background: var(--gold);
	color: var(--text);
}

.btn-edit:hover {
	background: #b8934f;
	transform: translateY(-1px);
}

/* Tooltip Styles */
.tooltip {
	position: relative;
	display: inline-block;
}

.tooltip .tooltiptext {
	visibility: hidden;
	width: auto;
	background-color: var(--deep-green);
	color: var(--cream);
	text-align: center;
	border-radius: 4px;
	padding: 5px 10px;
	position: absolute;
	z-index: 1;
	bottom: 125%;
	left: 50%;
	transform: translateX(-50%);
	opacity: 0;
	transition: opacity 0.3s;
	font-size: 0.75rem;
	white-space: nowrap;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.tooltip .tooltiptext::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: var(--deep-green) transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
	visibility: visible;
	opacity: 1;
}

.no-submissions {
	text-align: center;
	color: var(--rust);
	padding: 3rem;
	font-style: italic;
}

.no-submissions i {
	color: var(--gold);
}

/* Modal */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(43, 43, 43, 0.8);
	z-index: 2000;
	align-items: center;
	justify-content: center;
}

.modal-content {
	background: var(--paper);
	padding: 2rem;
	border-radius: var(--radius);
	width: 90%;
	max-width: 600px;
	box-shadow: 0 20px 40px rgba(11, 74, 57, 0.2);
	border: 1px solid var(--light-gray);
}

.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 1.5rem;
	padding-bottom: 1rem;
	border-bottom: 1px solid var(--light-gray);
}

.modal-header h3 {
	color: var(--deep-green);
	font-size: 1.5rem;
}

.close-btn {
	background: none;
	border: none;
	font-size: 1.5rem;
	cursor: pointer;
	color: var(--rust);
	transition: color 0.3s;
}

.close-btn:hover {
	color: var(--deep-green);
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
	padding: 10px;
	border: 2px solid var(--light-gray);
	border-radius: var(--radius);
	font-size: 1rem;
	transition: border-color 0.3s;
	background: var(--cream);
	color: var(--text);
}

.form-control:focus {
	outline: none;
	border-color: var(--leaf);
}

textarea.form-control {
	resize: vertical;
	min-height: 120px;
}

.form-actions {
	display: flex;
	justify-content: flex-end;
	gap: 1rem;
	margin-top: 1.5rem;
}

.btn-cancel {
	background: var(--light-gray);
	color: var(--text);
}

.btn-cancel:hover {
	background: #d4c9b9;
	transform: translateY(-1px);
}

/* Responsive */
@media ( max-width : 992px) {
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
}

@media ( max-width : 768px) {
	.stats-cards {
		grid-template-columns: 1fr;
	}
	.top-bar {
		flex-direction: column;
		gap: 1rem;
		align-items: flex-start;
	}
	.search-box {
		width: 100%;
	}
	.content-header {
		flex-direction: column;
		align-items: flex-start;
		gap: 1rem;
	}
	.content-actions {
		width: 100%;
		justify-content: space-between;
	}
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

@media ( max-width : 768px) {
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
				<li><a href="#" class="active"> <i class="fas fa-home"></i> 
					<span>Dashboard</span>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/paper-review"> 
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

				<!-- Submissions -->
				<li><a href="${pageContext.request.contextPath}/admin/submissions"> 
					<i class="fas fa-file"></i> <span>Submissions</span>
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
				<input type="text" placeholder="Search submissions...">
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

		<!-- Dashboard Header -->
		<div class="dashboard-header">
			<h1>Submission Management</h1>
			<p>Manage and review all manuscript submissions</p>
		</div>

		<!-- Stats Cards -->
		<div class="stats-cards">
			<div class="stat-card">
				<div class="stat-icon total">
					<i class="fas fa-file-alt"></i>
				</div>
				<div class="stat-content">
					<div class="stat-number">${totalSubmissions}</div>
					<div class="stat-label">Total Submissions</div>
					<div class="stat-change positive">
						<i class="fas fa-arrow-up"></i> 12% from last month
					</div>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon pending">
					<i class="fas fa-clock"></i>
				</div>
				<div class="stat-content">
					<div class="stat-number">${pendingSubmissions}</div>
					<div class="stat-label">Pending Review</div>
					<div class="stat-change negative">
						<i class="fas fa-arrow-up"></i> 5% from last week
					</div>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon reviewed">
					<i class="fas fa-check-circle"></i>
				</div>
				<div class="stat-content">
					<div class="stat-number">${reviewedSubmissions}</div>
					<div class="stat-label">Reviewed</div>
					<div class="stat-change positive">
						<i class="fas fa-arrow-up"></i> 8% from last week
					</div>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon published">
					<i class="fas fa-book"></i>
				</div>
				<div class="stat-content">
					<div class="stat-number">${publishedSubmissions}</div>
					<div class="stat-label">Published</div>
					<div class="stat-change positive">
						<i class="fas fa-arrow-up"></i> 3% from last week
					</div>
				</div>
			</div>
		</div>

		<!-- Submissions Table -->
		<div class="content-area">
			<div class="content-header">
				<h3>All Submissions</h3>
				<div class="content-actions">
					<button class="btn btn-outline">
						<i class="fas fa-filter"></i> Filter
					</button>
					<button class="btn btn-primary">
						<i class="fas fa-download"></i> Export
					</button>
				</div>
			</div>

			<c:choose>
				<c:when test="${not empty submissions}">
					<div class="table-container">
						<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Author Name</th>
									<th>Email</th>
									<th>Phone</th>
									<th>Title</th>
									<th>Filename</th>
									<th>Posted At</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${submissions}">
									<tr>
										<td>${s.id}</td>
										<td>${s.author.fullName}</td>
										<td>${s.author.email}</td>
										<td>${s.author.mobileNumber}</td>
										<td>${s.title}</td>
										<td>${s.fileName}</td>
										<td>${s.submittedAt}</td>
										<td>
											<span class="status status-${s.status.toLowerCase()}">
												${s.status} 
											</span>
										</td>
										<td>
											<div class="action-buttons">
												<!-- Download Original File with Tooltip -->
												<div class="tooltip">
													<a href="${pageContext.request.contextPath}/admin/download/${s.id}"
														class="btn btn-sm btn-download"> 
														<i class="fas fa-download"></i>
													</a> 
													<span class="tooltiptext">Download File</span>
												</div>

												<!-- EMAIL Button with Tooltip -->
												<div class="tooltip">
													<button class="btn btn-sm btn-email"
														onclick="openComposeMail('${s.author.id}', '${s.author.email}')">
														<i class="fas fa-envelope"></i>
													</button>
													<span class="tooltiptext">Send Email</span>
												</div>

												<!-- Edit Button with Tooltip -->
												<div class="tooltip">
													<a href="${pageContext.request.contextPath}/admin/edit/${s.id}"
														class="btn btn-sm btn-edit"> 
														<i class="fas fa-edit"></i>
													</a> 
													<span class="tooltiptext">Edit Submission</span>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<div class="no-submissions">
						<i class="fas fa-inbox" style="font-size: 3rem; margin-bottom: 1rem;"></i>
						<p>No submissions found.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<!-- Compose Mail Modal -->
	<div id="mailModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h3>
					<i class="fas fa-envelope"></i> Compose Email
				</h3>
				<button class="close-btn" onclick="closeMailModal()">&times;</button>
			</div>
			<form action="${pageContext.request.contextPath}/admin/send-mail"
				method="post" enctype="multipart/form-data">

				<input type="hidden" id="mailSubmissionId" name="id">

				<div class="form-group">
					<label for="mailTo">To:</label> 
					<input type="email" id="mailTo" name="to" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="mailSubject">Subject:</label> 
					<input type="text" id="mailSubject" name="subject" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="mailMessage">Message:</label>
					<textarea id="mailMessage" name="message" class="form-control" required></textarea>
				</div>

				<div class="form-group">
					<label for="mailAttachments">Attachments:</label> 
					<input type="file" id="mailAttachments" name="attachments" multiple class="form-control">
				</div>

				<div class="form-actions">
					<button type="button" class="btn btn-cancel" onclick="closeMailModal()">Cancel</button>
					<button type="submit" class="btn btn-success">
						<i class="fas fa-paper-plane"></i> Send Email
					</button>
				</div>
			</form>
		</div>
	</div>

	<script>
    // Open Compose Mail Modal
    function openComposeMail(authorId, authorEmail) {
        document.getElementById('mailTo').value = authorEmail;
        document.getElementById('mailSubmissionId').value = authorId;
        document.getElementById('mailModal').style.display = 'flex';
    }

    // Close Compose Mail Modal
    function closeMailModal() {
        document.getElementById('mailModal').style.display = 'none';
    }

    // Close modal when clicking outside
    window.addEventListener('click', function(event) {
        const mailModal = document.getElementById('mailModal');
        if (event.target === mailModal) {
            closeMailModal();
        }
    });

    // Mobile menu toggle
    document.getElementById('menuToggle').addEventListener('click', function() {
        const sidebar = document.getElementById('sidebar');
        sidebar.classList.toggle('active');
    });
    </script>
</body>
</html>