package com.ayurvedic.main.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ayurvedic.main.entity.Submission;
import com.ayurvedic.main.entity.User;
import com.ayurvedic.main.entity.Submission.Status;
import com.ayurvedic.main.service.SubmissionService;
import com.ayurvedic.main.service.UserService;
// PDF Text Extraction imports
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

@Controller
@RequestMapping("/author")
public class AuthorController {

    @Autowired
    private SubmissionService submissionService;

    @Autowired
    private UserService userService;

    // ✅ TEXT EXTRACTION METHOD - UPDATED WITH PDF SUPPORT
    private String extractTextFromFile(File file) {
        if (file == null || !file.exists()) {
            return "[File not found]";
        }

        String fileName = file.getName().toLowerCase();
        System.out.println("🔍 Extracting text from: " + fileName);

        try {
            if (fileName.endsWith(".docx")) {
                return extractDocxContent(file);
            } else if (fileName.endsWith(".doc")) {
                return extractDocContent(file);
            } else if (fileName.endsWith(".txt")) {
                return new String(Files.readAllBytes(file.toPath()));
            } else if (fileName.endsWith(".pdf")) {
                return extractPdfContent(file); // ✅ UPDATED TO EXTRACT PDF TEXT
            } else {
                return "[UNSUPPORTED_FILE_FORMAT]";
            }
        } catch (Exception e) {
            System.out.println("❌ Error extracting text: " + e.getMessage());
            return "[ERROR_EXTRACTING_CONTENT: " + e.getMessage() + "]";
        }
    }

    private String extractDocxContent(File file) {
        try (FileInputStream fis = new FileInputStream(file);
             XWPFDocument docx = new XWPFDocument(fis);
             XWPFWordExtractor extractor = new XWPFWordExtractor(docx)) {
            String content = extractor.getText().trim();
            return content.isEmpty() ? "[EMPTY_DOCX_FILE]" : content;
        } catch (Exception e) {
            return "[ERROR_READING_DOCX]";
        }
    }

    private String extractDocContent(File file) {
        try (FileInputStream fis = new FileInputStream(file)) {
            // Try to read as HWPFDocument (old .doc format)
            try {
                HWPFDocument doc = new HWPFDocument(fis);
                WordExtractor extractor = new WordExtractor(doc);
                String content = extractor.getText().trim();
                return content.isEmpty() ? "[EMPTY_DOC_FILE]" : content;
            } catch (Exception e) {
                System.out.println("❌ HWPFDocument failed, trying alternative approach: " + e.getMessage());
                
                // Reset the stream and try alternative approach
                fis.getChannel().position(0);
                
                // Try to read as raw text or basic extraction
                return extractDocContentAlternative(file);
            }
        } catch (Exception e) {
            System.out.println("❌ Final DOC extraction error: " + e.getMessage());
            return "[ERROR_READING_DOC: " + e.getMessage() + "]";
        }
    }

    // ✅ ALTERNATIVE DOC EXTRACTION METHOD
    private String extractDocContentAlternative(File file) {
        try {
            // Read file as binary and look for text content
            byte[] fileBytes = Files.readAllBytes(file.toPath());
            
            // Simple text extraction from binary (basic approach)
            String content = extractTextFromBinary(fileBytes);
            
            if (content != null && !content.trim().isEmpty()) {
                return "[BASIC_EXTRACTION]: " + content.trim();
            } else {
                return "[DOC_EXTRACTION_FAILED - File may be encrypted/corrupted]";
            }
        } catch (Exception e) {
            return "[ALTERNATIVE_DOC_EXTRACTION_FAILED: " + e.getMessage() + "]";
        }
    }

    // ✅ BASIC TEXT EXTRACTION FROM BINARY
    private String extractTextFromBinary(byte[] data) {
        StringBuilder text = new StringBuilder();
        
        // Simple approach: extract readable ASCII characters
        for (byte b : data) {
            if (b >= 32 && b <= 126) { // Printable ASCII range
                text.append((char) b);
            } else if (b == 10 || b == 13) { // Newline characters
                text.append("\n");
            } else if (b == 9) { // Tab characters
                text.append("\t");
            }
        }
        
        String result = text.toString();
        
        // Clean up excessive whitespace
        result = result.replaceAll("\\s+", " ").trim();
        
        return result.length() > 50 ? result : null; // Return only if substantial content found
    }
    
    // ✅ ADDED PROFESSIONAL PDF TEXT EXTRACTION METHOD
    private String extractPdfContent(File file) {
        try (PDDocument document = PDDocument.load(file)) {
            PDFTextStripper pdfStripper = new PDFTextStripper();
            String content = pdfStripper.getText(document).trim();
            return content.isEmpty() ? "[EMPTY_PDF_FILE]" : content;
        } catch (Exception e) {
            return "[ERROR_READING_PDF: " + e.getMessage() + "]";
        }
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String authorDashboard(Model model, Authentication authentication) {
        String email = authentication.getName();
        Optional<User> userOptional = userService.findByEmail(email);
        
        if (userOptional.isPresent()) {
            User author = userOptional.get();
            List<Submission> submissions = submissionService.getUserSubmissions(author);
            model.addAttribute("submissions", submissions);
            model.addAttribute("user", author);
        }
        
        return "author-dashboard";
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public String submitPaper(@RequestParam("title") String title,
                             @RequestParam("document") MultipartFile document,
                             Model model,
                             Authentication authentication) {
        
        try {
            System.out.println("📤 Starting file upload...");
            System.out.println("📝 Title: " + title);
            System.out.println("📄 File name: " + document.getOriginalFilename());
            System.out.println("📦 File size: " + document.getSize());
            
            // Get current user
            String email = authentication.getName();
            Optional<User> userOptional = userService.findByEmail(email);
            
            if (userOptional.isEmpty()) {
                model.addAttribute("error", "User not found");
                return "redirect:/author/dashboard";
            }
            
            User author = userOptional.get();
            
            // Validate file
            if (document.isEmpty()) {
                model.addAttribute("error", "Please select a file to upload");
                return "redirect:/author/dashboard";
            }
            
            // Validate file type
            String fileName = document.getOriginalFilename();
            if (fileName == null || fileName.isEmpty()) {
                model.addAttribute("error", "Invalid file name");
                return "redirect:/author/dashboard";
            }
            
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            if (!Arrays.asList("doc", "docx", "pdf", "txt").contains(fileExtension)) {
                model.addAttribute("error", "Only DOC, DOCX, PDF, and TXT files are allowed");
                return "redirect:/author/dashboard";
            }
            
            // Validate file size (10MB = 10 * 1024 * 1024)
            if (document.getSize() > 10 * 1024 * 1024) {
                model.addAttribute("error", "File size must be less than 10MB");
                return "redirect:/author/dashboard";
            }
            
            // Create uploads directory in a reliable location
            String uploadDir;
            try {
                // Try project root first
                String projectRoot = System.getProperty("user.dir");
                uploadDir = projectRoot + File.separator + "uploads" + File.separator;
                File uploadPath = new File(uploadDir);
                
                if (!uploadPath.exists()) {
                    boolean created = uploadPath.mkdirs();
                    if (!created) {
                        // If project root fails, try user home directory
                        String userHome = System.getProperty("user.home");
                        uploadDir = userHome + File.separator + "ayur_uploads" + File.separator;
                        uploadPath = new File(uploadDir);
                        uploadPath.mkdirs();
                    }
                }
                
                System.out.println("📁 Using upload directory: " + uploadDir);
                
            } catch (Exception e) {
                // Fallback to temp directory
                String tempDir = System.getProperty("java.io.tmpdir");
                uploadDir = tempDir + File.separator + "ayur_uploads" + File.separator;
                new File(uploadDir).mkdirs();
                System.out.println("📁 Using temp directory: " + uploadDir);
            }
            
            // Generate unique filename
            String uniqueFileName = System.currentTimeMillis() + "_" + fileName.replaceAll("[^a-zA-Z0-9.-]", "_");
            String filePath = uploadDir + uniqueFileName;
            
            System.out.println("💾 Saving file to: " + filePath);
            
            // Save file using absolute path
            Path destinationPath = Paths.get(filePath).toAbsolutePath();
            Files.createDirectories(destinationPath.getParent());
            document.transferTo(destinationPath.toFile());
            
            System.out.println("✅ File saved successfully to: " + destinationPath);
            
            // ✅ EXTRACT TEXT CONTENT FROM UPLOADED FILE
            String extractedContent = "";
            File savedFile = new File(filePath);
            if (savedFile.exists()) {
                extractedContent = extractTextFromFile(savedFile);
                System.out.println("✅ Text content extracted: " + extractedContent.length() + " characters");
            } else {
                extractedContent = "[CONTENT_EXTRACTION_FAILED]";
                System.out.println("❌ File not found for content extraction");
            }
            
            // Create submission record
            Submission submission = new Submission();
            submission.setTitle(title);
            submission.setFileName(fileName);
            submission.setFilePath(filePath);
            submission.setFileSize(document.getSize());
            submission.setAuthor(author);
            submission.setStatus(Status.SUBMITTED);
            submission.setSubmittedAt(LocalDateTime.now());
            submission.setUpdatedAt(LocalDateTime.now());
            
            // ✅ CRITICAL: Save extracted content to database
            submission.setContent(extractedContent);
            
            Submission savedSubmission = submissionService.saveSubmission(submission);
            
            System.out.println("✅ Submission saved to database with ID: " + savedSubmission.getId());
            System.out.println("✅ Content saved: " + (extractedContent.length() > 0 ? "YES" : "NO"));
            
            // Add success message that will be displayed after redirect
            model.addAttribute("success", "Article submitted successfully!");
            
        } catch (IOException e) {
            System.out.println("❌ IO Error during file upload: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("error", "Error saving file: " + e.getMessage());
            return "redirect:/author/dashboard";
        } catch (Exception e) {
            System.out.println("❌ Error during submission: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("error", "Error submitting article: " + e.getMessage());
            return "redirect:/author/dashboard";
        }
        
        return "redirect:/author/dashboard";
    }
}