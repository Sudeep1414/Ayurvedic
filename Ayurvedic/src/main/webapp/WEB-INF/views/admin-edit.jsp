<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit & Publish Article</title>

    <!-- nicEdit (only load for editable files) -->
    <c:if test="${canEdit}">
        <script src="https://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
        <script type="text/javascript">
            bkLib.onDomLoaded(function() {
                new nicEditor({
                    fullPanel : true,
                    iconsPath : 'https://js.nicedit.com/nicEditorIcons.gif'
                }).panelInstance('htmlContent');
            });
        </script>
    </c:if>

    <style>
        body {
            background: #f4efe3;
            font-family: Arial;
            padding: 20px;
        }
        .container {
            background: #ffffff;
            padding: 25px;
            border-radius: 10px;
            width: 80%;
            margin: auto;
            box-shadow: 0 0 10px #cfcfcf;
        }
        label {
            font-weight: bold;
            margin-top: 15px;
            display: block;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }
        button {
            margin-top: 20px;
            background: #0f7a40;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background: #0c5e30;
        }
        .author-info {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            border-left: 4px solid #0f7a40;
        }
        .file-info {
            background: #e3f2fd;
            padding: 15px;
            border-radius: 6px;
            margin: 10px 0;
        }
        .warning-box {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            padding: 15px;
            border-radius: 6px;
            margin: 15px 0;
        }
        .success-box {
            background: #d1ecf1;
            border: 1px solid #bee5eb;
            padding: 15px;
            border-radius: 6px;
            margin: 15px 0;
        }
        
        /* Abstract textarea specific styling */
        textarea[name="abstractText"] {
            background: #f8f9fa;
            border: 2px solid #e9ecef;
            font-size: 14px;
            line-height: 1.5;
        }
        textarea[name="abstractText"]:focus {
            border-color: #0f7a40;
            background: #fff;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Edit & Publish Article</h2>
    
    <!-- Author Information -->
    <div class="author-info">
        <strong>Author:</strong> ${submission.author.fullName}<br>
        <strong>Email:</strong> ${submission.author.email}<br>
        <strong>Submitted:</strong> ${submission.submittedAt}
    </div>
    
    <!-- File Information -->
    <div class="file-info">
        <strong>Original File:</strong> ${submission.fileName}<br>
        <strong>File Type:</strong> 
        <c:choose>
            <c:when test="${fileType == 'editable'}">Word Document/Text File (Editable)</c:when>
            <c:when test="${fileType == 'pdf'}">PDF Document</c:when>
            <c:when test="${fileType == 'image'}">Image File</c:when>
            <c:otherwise>Unknown Format</c:otherwise>
        </c:choose>
    </div>

    <c:choose>
        <c:when test="${canEdit}">
            <!-- ✅ EDITABLE FILES: DOC, DOCX, TXT -->
            <div class="success-box">
                ✅ <strong>This file can be edited</strong> - You can modify the content below and publish.
            </div>
            
            <form method="post" action="${pageContext.request.contextPath}/admin/publish">
                <input type="hidden" name="submissionId" value="${submission.id}"/>

                <label>Title:</label>
                <input type="text" name="title" value="${submission.title}" required/>

                <!-- ADDED: Abstract Text Field -->
                <label>Abstract (Brief Summary):</label>
                <textarea name="abstractText" rows="4" placeholder="Enter a brief abstract/summary of the article..." required>
                    <c:choose>
                        <c:when test="${not empty fileContent and fileContent.length() > 300}">
                            ${fileContent.substring(0, 300)}...
                        </c:when>
                        <c:when test="${not empty fileContent}">
                            ${fileContent}
                        </c:when>
                        <c:otherwise>
                            Abstract for ${submission.title}
                        </c:otherwise>
                    </c:choose>
                </textarea>

                <label>Article Content (Editable):</label>
                <textarea id="htmlContent" name="htmlContent" rows="18">${fileContent}</textarea>

                <button type="submit">PUBLISH TO CURRENT ISSUE</button>
            </form>
        </c:when>
        
        <c:otherwise>
            <!-- ❌ NON-EDITABLE FILES: PDF, IMAGES, etc. -->
            <div class="warning-box">
                ⚠️ <strong>This file format cannot be edited directly</strong><br><br>
                
                <c:choose>
                    <c:when test="${fileType == 'pdf'}">
                        • <strong>PDF files</strong> cannot be edited in this system<br>
                        • Please download the original file and use PDF editing software<br>
                    </c:when>
                    <c:when test="${fileType == 'image'}">
                        • <strong>Image files</strong> cannot be edited as text<br>
                        • Please download the original file and use image editing software<br>
                    </c:when>
                    <c:otherwise>
                        • <strong>Unsupported file format</strong><br>
                        • This file type cannot be edited in the system<br>
                    </c:otherwise>
                </c:choose>
                <br>
                <a href="/admin/download/${submission.id}" class="btn btn-download" 
                   style="background: #2196f3; color: white; padding: 10px 15px; text-decoration: none; border-radius: 4px;">
                   📥 Download Original File
                </a>
            </div>
            
            <!-- Show file content preview for non-editable files -->
            <div style="margin-top: 20px;">
                <label>File Content Preview:</label>
                <textarea rows="6" readonly style="background: #f5f5f5;">${fileContent}</textarea>
            </div>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>