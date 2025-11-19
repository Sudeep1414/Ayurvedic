<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${article.title} - AVUSCRIPT</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Arial', sans-serif; }
        body { background: #f4f4f4; color: #333; line-height: 1.6; }
        
        .container { max-width: 900px; margin: 0 auto; background: white; min-height: 100vh; }
        
        .article-header {
            background: linear-gradient(135deg, #0f7a40, #1a936f);
            color: white; padding: 2rem; text-align: center;
        }
        
        .article-title { font-size: 2rem; margin-bottom: 1rem; font-weight: bold; }
        
        .article-meta { 
            display: flex; justify-content: center; gap: 2rem; 
            flex-wrap: wrap; margin-top: 1rem; opacity: 0.9;
        }
        
        .article-content {
            padding: 3rem; font-size: 1.1rem; line-height: 1.8;
            white-space: pre-wrap;
        }
        
        .action-buttons {
            padding: 1rem 3rem; background: #f8f9fa; 
            border-top: 1px solid #e9ecef; display: flex; gap: 1rem;
        }
        
        .btn {
            padding: 10px 20px; border: none; border-radius: 5px;
            text-decoration: none; font-weight: bold; cursor: pointer;
        }
        
        .btn-back { background: #6c757d; color: white; }
        .btn-pdf { background: #e74c3c; color: white; }
    </style>
</head>
<body>
    <div class="container">
        <div class="article-header">
            <h1 class="article-title">${article.title}</h1>
            <div class="article-meta">
                <div><strong>Author:</strong> ${article.author.fullName}</div>
                <div><strong>Email:</strong> ${article.author.email}</div>
                <div><strong>Published:</strong> ${article.updatedAt}</div>
            </div>
        </div>
        
        <div class="article-content">
            ${article.content}
        </div>
        
        <div class="action-buttons">
            <a href="/current-issue" class="btn btn-back">← Back to Current Issue</a>
            <a href="/download/${article.id}" class="btn btn-pdf">📥 Download PDF</a>
        </div>
    </div>
</body>
</html>