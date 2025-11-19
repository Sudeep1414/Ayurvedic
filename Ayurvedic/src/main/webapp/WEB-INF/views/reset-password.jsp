<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password - AVUSCRIPT</title>
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

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

        /* ===== Reset Password Section ===== */
        .reset-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 0;
            background: linear-gradient(135deg, rgba(11, 86, 51, 0.03) 0%, rgba(201, 162, 90, 0.03) 100%);
        }

        .reset-container {
            width: 100%;
            max-width: 450px;
        }

        .reset-card {
            background: white;
            padding: 50px 40px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            border-top: 5px solid var(--gold);
            transition: var(--transition);
        }

        .reset-card:hover {
            box-shadow: 0 15px 40px rgba(11, 86, 51, 0.15);
            transform: translateY(-5px);
        }

        .reset-header {
            text-align: center;
            margin-bottom: 35px;
        }

        .reset-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--deep-green), var(--leaf));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: white;
            font-size: 2rem;
            box-shadow: 0 8px 20px rgba(11, 86, 51, 0.3);
        }

        .reset-title {
            color: var(--deep-green);
            font-family: 'Georgia', serif;
            font-weight: 700;
            font-size: 2.2rem;
            margin-bottom: 8px;
        }

        .reset-subtitle {
            color: var(--rust);
            font-size: 1.1rem;
            font-weight: 500;
        }

        .form-group {
            margin-bottom: 25px;
            text-align: left;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: var(--deep-green);
            font-weight: 600;
            font-size: 1rem;
        }

        .form-control {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e8f5e9;
            border-radius: var(--radius);
            font-size: 1rem;
            transition: var(--transition);
            background: var(--cream);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--leaf);
            box-shadow: 0 0 0 3px rgba(43, 138, 95, 0.1);
            background: white;
        }

        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            flex: 1;
            padding: 15px 25px;
            border: none;
            border-radius: var(--radius);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            text-decoration: none;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-reset {
            background: var(--deep-green);
            color: white;
        }

        .btn-reset:hover {
            background: var(--leaf);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(11, 86, 51, 0.3);
        }

        .btn-cancel {
            background: transparent;
            color: var(--deep-green);
            border: 2px solid var(--deep-green);
        }

        .btn-cancel:hover {
            background: var(--deep-green);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(11, 86, 51, 0.3);
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

        /* Password strength indicator */
        .password-strength {
            margin-top: 8px;
            font-size: 14px;
        }
        .strength-weak { color: #f44336; }
        .strength-medium { color: #ff9800; }
        .strength-strong { color: #4caf50; }

        @media (max-width: 768px) {
            .reset-card { padding: 30px 25px; margin: 0 15px; }
            .btn-group { flex-direction: column; }
        }
    </style>
</head>

<body>
    <header class="brand-bar">
        <div class="container-main d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/images/logo/logonew.png" alt="logo" style="height:60px;" class="me-3">
                <div class="d-flex flex-column align-items-start">
                    <div class="logo-text">AVUSCRIPT</div>
                    <span class="logo-subtitle">Research in Ayurveda</span>
                </div>
            </div>
        </div>
    </header>

    <!-- Reset Password Section -->
    <section class="reset-section">
        <div class="reset-container">
            <div class="reset-card">
                <div class="reset-header">
                    <div class="reset-icon">
                        <i class="fas fa-key"></i>
                    </div>
                    <h1 class="reset-title">Reset Password</h1>
                    <p class="reset-subtitle">Create your new password</p>
                </div>

                <!-- Error/Success Messages -->
                <c:if test="${not empty error}">
                    <div class="alert alert-error fade show" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i> ${error}
                    </div>
                </c:if>
                <c:if test="${not empty success}">
                    <div class="alert alert-success fade show" role="alert">
                        <i class="fas fa-check-circle me-2"></i> ${success}
                    </div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/reset-password" method="post">
                    <input type="hidden" name="token" value="${token}">
                    
                    <div class="form-group">
                        <label for="newPassword" class="form-label">
                            <i class="fas fa-lock me-2"></i>New Password
                        </label>
                        <input type="password" id="newPassword" name="newPassword" class="form-control" 
                               placeholder="Enter new password" required minlength="6">
                        <div class="password-strength" id="passwordStrength"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword" class="form-label">
                            <i class="fas fa-lock me-2"></i>Confirm Password
                        </label>
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" 
                               placeholder="Confirm new password" required minlength="6">
                        <div id="passwordMatch" style="margin-top: 8px; font-size: 14px;"></div>
                    </div>
                    
                    <div class="btn-group">
                        <button type="submit" class="btn btn-reset" id="submitBtn">
                            <i class="fas fa-save me-2"></i>RESET PASSWORD
                        </button>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-cancel">
                            <i class="fas fa-times me-2"></i>CANCEL
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <script>
        // Password strength indicator
        document.getElementById('newPassword').addEventListener('input', function() {
            const password = this.value;
            const strengthText = document.getElementById('passwordStrength');
            let strength = '';
            let color = '';

            if (password.length === 0) {
                strength = '';
            } else if (password.length < 6) {
                strength = 'Weak - Minimum 6 characters required';
                color = 'strength-weak';
            } else if (password.length < 10) {
                strength = 'Medium';
                color = 'strength-medium';
            } else {
                strength = 'Strong';
                color = 'strength-strong';
            }

            strengthText.innerHTML = strength ? `<span class="${color}">${strength}</span>` : '';
        });

        // Password match validation
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = this.value;
            const matchText = document.getElementById('passwordMatch');
            const submitBtn = document.getElementById('submitBtn');

            if (confirmPassword.length === 0) {
                matchText.innerHTML = '';
                submitBtn.disabled = false;
            } else if (newPassword !== confirmPassword) {
                matchText.innerHTML = '<span style="color: #f44336;">Passwords do not match</span>';
                submitBtn.disabled = true;
            } else {
                matchText.innerHTML = '<span style="color: #4caf50;">Passwords match</span>';
                submitBtn.disabled = false;
            }
        });

        // Auto-hide alerts after 5 seconds
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(function(alert) {
                alert.style.display = 'none';
            });
        }, 5000);
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>