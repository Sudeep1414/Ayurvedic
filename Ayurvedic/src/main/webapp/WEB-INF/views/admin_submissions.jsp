<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Submissions - AVUSCRIPT Admin</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

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
	font-family: 'Arial', sans-serif;
}

body {
	background-color: var(--cream);
	color: var(--text);
	line-height: 1.6;
	display: flex;
	min-height: 100vh;
}

/* ---------------- SIDEBAR ---------------- */
.sidebar {
	width: 260px;
	background: var(--deep-green);
	color: var(--cream);
	height: 100vh;
	position: fixed;
	left: 0;
	top: 0;
	overflow-y: auto;
	padding-bottom: 40px;
	transition: all 0.3s ease;
	z-index: 1000;
}

.sidebar.collapsed {
	width: 70px;
}

.sidebar-header {
	padding: 20px;
	text-align: center;
	background: var(--primary-dark);
	border-bottom: 1px solid rgba(251, 246, 238, 0.1);
	transition: all 0.3s ease;
}

.sidebar.collapsed .sidebar-header {
	padding: 15px;
}

.sidebar-header h2 {
	margin: 0;
	color: var(--gold);
	font-size: 1.5rem;
	transition: all 0.3s ease;
}

.sidebar.collapsed .sidebar-header h2 {
	display: none;
}

.sidebar-menu ul {
	list-style: none;
	margin-top: 10px;
}

.sidebar-menu ul li {
	border-bottom: 1px solid rgba(251, 246, 238, 0.1);
}

.sidebar-menu ul li a {
	display: flex;
	align-items: center;
	gap: 12px;
	color: rgba(251, 246, 238, 0.9);
	padding: 12px 20px;
	text-decoration: none;
	transition: all 0.3s ease;
	white-space: nowrap;
}

.sidebar.collapsed .sidebar-menu ul li a {
	padding: 15px;
	justify-content: center;
}

.sidebar-menu ul li a:hover, .sidebar-menu ul li a.active {
	background: rgba(201, 162, 90, 0.15);
	color: var(--gold);
	border-left: 4px solid var(--gold);
}

.sidebar-menu span {
	transition: all 0.3s ease;
}

.sidebar.collapsed .sidebar-menu span {
	display: none;
}

.sidebar-menu i {
	font-size: 1.2rem;
	min-width: 20px;
	text-align: center;
}

/* ---------------- CONTENT AREA ---------------- */
.content {
	margin-left: 260px;
	width: calc(100% - 260px);
	transition: all 0.3s ease;
	padding: 0;
	min-height: 100vh;
}

.content.expanded {
	margin-left: 70px;
	width: calc(100% - 70px);
}

header {
	background: linear-gradient(135deg, var(--deep-green), var(--leaf));
	color: var(--cream);
	padding: 1rem 0;
	box-shadow: var(--shadow);
	width: 100%;
	position: sticky;
	top: 0;
	z-index: 100;
}

.header-container {
	max-width: 100%;
	margin: 0 auto;
	padding: 0 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo h1 {
	font-size: 1.7rem;
	font-weight: bold;
}

.admin-badge {
	background: rgba(251, 246, 238, 0.2);
	padding: 5px 10px;
	border-radius: 15px;
	font-size: 0.9rem;
}

.logout-btn {
	background: rgba(251, 246, 238, 0.2);
	color: var(--cream);
	padding: 8px 16px;
	text-decoration: none;
	border-radius: 5px;
	transition: background 0.3s;
}

.logout-btn:hover {
	background: rgba(251, 246, 238, 0.3);
}

.container {
	max-width: 100%;
	margin: 2rem auto;
	padding: 0 20px;
	width: 100%;
}

.dashboard-header {
	margin-bottom: 1.5rem;
}

.dashboard-header h2 {
	color: var(--deep-green);
	font-size: 2rem;
	margin-bottom: 0.5rem;
}

/* Dashboard Cards */
.stats-cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 1.5rem;
	margin-bottom: 2rem;
}

.stat-card {
	background: var(--paper);
	padding: 1.5rem;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	text-align: center;
	border: 1px solid var(--light-gray);
}

.stat-number {
	font-size: 2.5rem;
	font-weight: bold;
	color: var(--deep-green);
}

.stat-label {
	color: var(--rust);
}

/* Submissions table */
.submissions-section {
	background: var(--paper);
	padding: 2rem;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	border: 1px solid var(--light-gray);
	width: 100%;
	overflow: visible;
}

.table-responsive {
	width: 100%;
	overflow: visible;
}

.table {
	width: 100%;
	border-collapse: collapse;
	min-width: auto;
}

.table th, .table td {
	padding: 12px 15px;
	border-bottom: 1px solid var(--light-gray);
	text-align: left;
	word-wrap: break-word;
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

/* Compact table styling for better fit */
.table th:nth-child(1), .table td:nth-child(1) { /* ID */
	width: 60px;
	max-width: 80px;
}

.table th:nth-child(2), .table td:nth-child(2) { /* Author */
	width: 120px;
	max-width: 150px;
}

.table th:nth-child(3), .table td:nth-child(3) { /* Email */
	width: 180px;
	max-width: 200px;
}

.table th:nth-child(4), .table td:nth-child(4) { /* Phone */
	width: 120px;
	max-width: 130px;
}

.table th:nth-child(5), .table td:nth-child(5) { /* Title */
	min-width: 200px;
	flex: 1;
}

.table th:nth-child(6), .table td:nth-child(6) { /* File */
	width: 120px;
	max-width: 150px;
}

.table th:nth-child(7), .table td:nth-child(7) { /* Posted */
	width: 120px;
	max-width: 130px;
}

.table th:nth-child(8), .table td:nth-child(8) { /* Status */
	width: 100px;
	max-width: 120px;
}

.table th:nth-child(9), .table td:nth-child(9) { /* Actions */
	width: 160px;
	max-width: 180px;
}

/* Action Buttons */
.action-buttons {
	display: flex;
	gap: 0.5rem;
	flex-wrap: nowrap;
	align-items: center;
	justify-content: flex-start;
}

.btn {
	padding: 8px;
	border-radius: var(--radius);
	font-size: 0.9rem;
	cursor: pointer;
	text-decoration: none;
	border: none;
	transition: all 0.3s;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 36px;
	height: 36px;
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

.btn-review {
	background: var(--deep-green);
	color: var(--cream);
}

.btn-review:hover {
	background: var(--primary-dark);
	transform: translateY(-1px);
}

.btn-save {
	background: var(--leaf);
	color: var(--cream);
	padding: 10px 20px;
	border-radius: 5px;
	width: auto;
	height: auto;
}

.btn-cancel {
	background: var(--gray);
	color: var(--cream);
	padding: 10px 20px;
	border-radius: 5px;
	width: auto;
	height: auto;
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

.form-control {
	border: 1px solid var(--light-gray);
	background: var(--cream);
	color: var(--text);
	padding: 10px;
	border-radius: var(--radius);
	width: 100%;
	margin-bottom: 1rem;
}

.form-control:focus {
	border-color: var(--leaf);
	outline: none;
}

.no-submissions {
	text-align: center;
	color: var(--rust);
	padding: 2rem;
	font-style: italic;
}

/* Toggle Button */
.sidebar-toggle {
	position: fixed;
	top: 20px;
	left: 20px;
	z-index: 3000;
	background: var(--deep-green);
	color: var(--gold);
	border: none;
	border-radius: 5px;
	padding: 10px;
	font-size: 1.2rem;
	cursor: pointer;
	transition: all 0.3s ease;
}

.sidebar-toggle:hover {
	background: var(--primary-dark);
	transform: scale(1.1);
}

/* Responsive Design */
@media (max-width: 1400px) {
	.container {
		padding: 0 15px;
	}
	
	.table th, .table td {
		padding: 10px 12px;
		font-size: 0.9rem;
	}
}

@media (max-width: 1200px) {
	.content {
		margin-left: 70px;
		width: calc(100% - 70px);
	}
	
	.sidebar {
		width: 70px;
	}
	
	.sidebar-header h2, .sidebar-menu span {
		display: none;
	}
	
	.sidebar-menu ul li a {
		padding: 15px;
		justify-content: center;
	}
	
	.sidebar-menu i {
		margin-right: 0;
	}
}

@media (max-width: 992px) {
	.stats-cards {
		grid-template-columns: repeat(2, 1fr);
	}
	
	.table th:nth-child(4), .table td:nth-child(4), /* Phone */
	.table th:nth-child(7), .table td:nth-child(7) { /* Posted */
		display: none;
	}
}

@media (max-width: 768px) {
	.stats-cards {
		grid-template-columns: 1fr;
	}
	
	.header-container {
		flex-direction: column;
		gap: 1rem;
		text-align: center;
	}
	
	.table th:nth-child(3), .table td:nth-child(3), /* Email */
	.table th:nth-child(6), .table td:nth-child(6) { /* File */
		display: none;
	}
	
	.submissions-section {
		padding: 1rem;
	}
}

@media (max-width: 576px) {
	.table th:nth-child(2), .table td:nth-child(2) { /* Author */
		display: none;
	}
	
	.action-buttons {
		gap: 0.3rem;
	}
	
	.btn {
		width: 32px;
		height: 32px;
		padding: 6px;
	}
}
</style>
</head>

<body>
	<!-- Sidebar Toggle Button -->
	<button class="sidebar-toggle" id="sidebarToggle">
		<i class="fas fa-bars"></i>
	</button>

	<!-- ---------------- SIDEBAR START ---------------- -->
	<div class="sidebar" id="sidebar">
		<div class="sidebar-header">
			<h2>AVUSCRIPT</h2>
		</div>

		<nav class="sidebar-menu">
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/dashboard">
					<i class="fas fa-home"></i> <span>Dashboard</span>
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
					<i class="fas fa-book"></i> <span>Previous Volumes</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/admin/contact-enquiries">
					<i class="fas fa-envelope-open"></i> <span>Contact Enquiries</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/admin/visit-website">
					<i class="fas fa-globe"></i> <span>Visit Website</span>
				</a></li>

				<!-- Submissions -->
				<li><a href="${pageContext.request.contextPath}/admin/submissions" class="active">
					<i class="fas fa-file"></i> <span>Submissions</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/logout">
					<i class="fas fa-sign-out-alt"></i> <span>Logout</span>
				</a></li>
			</ul>
		</nav>
	</div>
	<!-- ---------------- SIDEBAR END ---------------- -->

	<div class="content" id="mainContent">
		<!-- HEADER -->
		<header>
			<div class="header-container">
				<div class="logo">
					<h1>AVUSCRIPT - Submissions</h1>
					<div class="admin-badge">Administrator</div>
				</div>
				<div class="user-info">
					<span>Welcome, Admin</span> 
					<a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
				</div>
			</div>
		</header>

		<div class="container">
			<div class="dashboard-header">
				<h2>All Submissions</h2>
			</div>

			<!-- Stats Cards -->
			<div class="stats-cards">
				<div class="stat-card">
					<div class="stat-number">${totalSubmissions}</div>
					<div class="stat-label">Total Submissions</div>
				</div>

				<div class="stat-card">
					<div class="stat-number">${pendingSubmissions}</div>
					<div class="stat-label">Pending</div>
				</div>

				<div class="stat-card">
					<div class="stat-number">${reviewedSubmissions}</div>
					<div class="stat-label">Reviewed</div>
				</div>

				<div class="stat-card">
					<div class="stat-number">${publishedSubmissions}</div>
					<div class="stat-label">Published</div>
				</div>
			</div>

			<!-- Submissions Table -->
			<div class="submissions-section">
				<div class="table-responsive">
					<c:choose>
						<c:when test="${not empty submissions}">
							<table class="table">
								<thead>
									<tr>
										<th>ID</th>
										<th>Author</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Title</th>
										<th>File</th>
										<th>Posted</th>
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
											<td>${s.status}</td>

											<td>
												<div class="action-buttons">
													<!-- Download Button with Tooltip -->
													<div class="tooltip">
														<a href="${pageContext.request.contextPath}/admin/download/${s.id}"
															class="btn btn-download">
															<i class="fas fa-download"></i>
														</a>
														<span class="tooltiptext">Download File</span>
													</div>

													<!-- EMAIL Button with Tooltip -->
													<div class="tooltip">
														<button class="btn btn-email"
															onclick="openComposeMail('${s.author.id}', '${s.author.email}')">
															<i class="fas fa-envelope"></i>
														</button>
														<span class="tooltiptext">Send Email</span>
													</div>

													<!-- Paper Review Button with Tooltip -->
													<div class="tooltip">
														<a href="${pageContext.request.contextPath}/admin/paper-review?submissionId=${s.id}"
															class="btn btn-review">
															<i class="fas fa-file-alt"></i>
														</a>
														<span class="tooltiptext">Paper Review</span>
													</div>

													<!-- Edit Button with Tooltip -->
													<div class="tooltip">
														<a href="${pageContext.request.contextPath}/admin/edit/${s.id}"
															class="btn btn-edit">
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
						</c:when>

						<c:otherwise>
							<div class="no-submissions">No submissions found.</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<!-- MAIL MODAL -->
	<div id="mailModal" class="modal">
		<div class="modal-content">
			<h3 style="margin-bottom:1rem; color: var(--deep-green);">
				<i class="fas fa-envelope"></i> Compose Email
			</h3>

			<form action="${pageContext.request.contextPath}/admin/send-mail"
				method="post" enctype="multipart/form-data">

				<input type="hidden" id="mailSubmissionId" name="id">

				<div style="margin-bottom: 1rem;">
					<label style="color: var(--deep-green); display: block; margin-bottom: 0.5rem;">To:</label>
					<input type="email" id="mailTo" name="to" class="form-control" required>
				</div>

				<div style="margin-bottom: 1rem;">
					<label style="color: var(--deep-green); display: block; margin-bottom: 0.5rem;">Subject:</label>
					<input type="text" id="mailSubject" name="subject" class="form-control" required>
				</div>

				<div style="margin-bottom: 1rem;">
					<label style="color: var(--deep-green); display: block; margin-bottom: 0.5rem;">Message:</label>
					<textarea id="mailMessage" name="message" rows="6" class="form-control" required></textarea>
				</div>

				<div style="margin-bottom: 1rem;">
					<label style="color: var(--deep-green); display: block; margin-bottom: 0.5rem;">Attachments:</label>
					<input type="file" name="attachments" multiple class="form-control">
				</div>

				<div style="display: flex; gap: 1rem; justify-content: flex-end;">
					<button type="button" class="btn-cancel" onclick="closeMailModal()">Cancel</button>
					<button type="submit" class="btn-save">Send Email</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		// Sidebar toggle functionality
		document.getElementById('sidebarToggle').addEventListener('click', function() {
			const sidebar = document.getElementById('sidebar');
			const mainContent = document.getElementById('mainContent');
			
			sidebar.classList.toggle('collapsed');
			mainContent.classList.toggle('expanded');
			
			// Update toggle button icon
			const icon = this.querySelector('i');
			if (sidebar.classList.contains('collapsed')) {
				icon.className = 'fas fa-bars';
			} else {
				icon.className = 'fas fa-times';
			}
		});

		// Auto-collapse sidebar on medium screens
		function handleResize() {
			const sidebar = document.getElementById('sidebar');
			const mainContent = document.getElementById('mainContent');
			const toggleBtn = document.getElementById('sidebarToggle');
			
			if (window.innerWidth <= 1200) {
				sidebar.classList.add('collapsed');
				mainContent.classList.add('expanded');
				toggleBtn.querySelector('i').className = 'fas fa-bars';
			} else {
				sidebar.classList.remove('collapsed');
				mainContent.classList.remove('expanded');
				toggleBtn.querySelector('i').className = 'fas fa-bars';
			}
		}

		// Initialize on load and resize
		window.addEventListener('load', handleResize);
		window.addEventListener('resize', handleResize);

		function openComposeMail(id, email) {
			document.getElementById('mailSubmissionId').value = id;
			document.getElementById('mailTo').value = email;
			document.getElementById('mailModal').style.display = 'flex';
		}

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
	</script>
</body>
</html>