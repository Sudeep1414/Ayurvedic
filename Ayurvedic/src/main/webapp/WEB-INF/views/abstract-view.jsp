<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Abstract: ${article.title}</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 20px;
            background: #f7efe6;
        }
        .abstract-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .abstract-title {
            color: #0b5633;
            border-bottom: 2px solid #c9a25a;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .abstract-content {
            line-height: 1.6;
            font-size: 16px;
        }
        .keywords {
            margin-top: 20px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
        }
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #0b5633;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
    </style>
</head>
<body>
    <div class="abstract-container">
        <h1 class="abstract-title">Abstract</h1>
        
        <div class="abstract-content">
            <c:if test="${not empty article.abstractText}">
                <p>${article.abstractText}</p>
            </c:if>
            
            <c:if test="${empty article.abstractText}">
                <p>No abstract available for this article.</p>
            </c:if>
        </div>
        
        <c:if test="${not empty article.abstractKeywords}">
            <div class="keywords">
                <strong>Keywords:</strong> ${article.abstractKeywords}
            </div>
        </c:if>
        
        <a href="javascript:window.close()" class="back-btn">Close Window</a>
    </div>
</body>
</html>