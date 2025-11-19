package com.ayurvedic.main.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

// PDF Text Extraction imports
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ayurvedic.main.entity.PublishedArticle;
import com.ayurvedic.main.entity.Submission;
import com.ayurvedic.main.entity.Submission.Status;
import com.ayurvedic.main.repository.PublishedArticleRepository;
import com.ayurvedic.main.service.EmailService;
import com.ayurvedic.main.service.SubmissionService;
// PDF imports
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private SubmissionService submissionService;
	@Autowired
    private PublishedArticleRepository publishedRepo;
	@Autowired
    private EmailService emailService;
	
	// ✅ TEXT EXTRACTION METHODS - UPDATED WITH PDF SUPPORT
	private String extractTextFromFile(File file) {
		if (file == null || !file.exists()) {
			return "File not found";
		}

		String fileName = file.getName().toLowerCase();

		try {
			if (fileName.endsWith(".docx")) {
				return extractDocxContent(file);
			} else if (fileName.endsWith(".doc")) {
				return extractDocContent(file);
			} else if (fileName.endsWith(".txt")) {
				return new String(Files.readAllBytes(file.toPath()));
			} else if (fileName.endsWith(".pdf")) {
				return extractPdfContent(file); // ✅ ADDED PDF SUPPORT
			} else {
				return "Unsupported file format";
			}
		} catch (Exception e) {
			return "Error reading file: " + e.getMessage();
		}
	}

	private String extractDocxContent(File file) {
		try (FileInputStream fis = new FileInputStream(file);
				XWPFDocument docx = new XWPFDocument(fis);
				XWPFWordExtractor extractor = new XWPFWordExtractor(docx)) {

			String content = extractor.getText().trim();
			return content.isEmpty() ? "Empty document" : content;

		} catch (Exception e) {
			return "Error reading DOCX file";
		}
	}

	private String extractDocContent(File file) {
		try (FileInputStream fis = new FileInputStream(file)) {
			// Try to read as HWPFDocument (old .doc format)
			try {
				HWPFDocument doc = new HWPFDocument(fis);
				WordExtractor extractor = new WordExtractor(doc);
				String content = extractor.getText().trim();
				return content.isEmpty() ? "Empty document" : content;
			} catch (Exception e) {
				System.out.println("❌ HWPFDocument failed, trying alternative approach: " + e.getMessage());
				
				// Reset the stream and try alternative approach
				fis.getChannel().position(0);
				
				// Try to read as raw text or basic extraction
				return extractDocContentAlternative(file);
			}
		} catch (Exception e) {
			System.out.println("❌ Final DOC extraction error: " + e.getMessage());
			return "Error reading DOC file: " + e.getMessage();
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
				return "Extracted text (basic method):\n" + content.trim();
			} else {
				return "DOC file detected but text extraction failed. File may be encrypted, corrupted, or in an unsupported format.";
			}
		} catch (Exception e) {
			return "Alternative DOC extraction failed: " + e.getMessage();
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
			return content.isEmpty() ? "Empty PDF document" : content;
		} catch (Exception e) {
			return "Error reading PDF file: " + e.getMessage();
		}
	}

	// ===========================
	// 🔹 ADMIN DASHBOARD
	// ===========================
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String adminLogin() {
		return "admin-login";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String adminDashboard(Model model) {
	    List<Submission> submissions = submissionService.getAllSubmissions();

	    long totalSubmissions = submissions.size();
	    long pendingSubmissions = submissions.stream()
	            .filter(s -> s.getStatus() == Submission.Status.SUBMITTED)
	            .count();
	    long reviewedSubmissions = submissions.stream()
	            .filter(s -> s.getStatus() == Submission.Status.REVIEWED)
	            .count();
	    
	    // ✅ FIX: Published count should come from PublishedArticleRepository, not submissions
	    long publishedSubmissions = publishedRepo.count();

	    model.addAttribute("submissions", submissions);
	    model.addAttribute("totalSubmissions", totalSubmissions);
	    model.addAttribute("pendingSubmissions", pendingSubmissions);
	    model.addAttribute("reviewedSubmissions", reviewedSubmissions);
	    model.addAttribute("publishedSubmissions", publishedSubmissions);

	    return "admin-dashboard";
	}
	@GetMapping("/submissions")
	public String viewSubmissions(Model model) {

	    List<Submission> submissions = submissionService.getAllSubmissions();

	    long total = submissions.size();
	    long pending = submissions.stream()
	            .filter(s -> s.getStatus() == Submission.Status.SUBMITTED)
	            .count();
	    long reviewed = submissions.stream()
	            .filter(s -> s.getStatus() == Submission.Status.REVIEWED)
	            .count();
	    long published = publishedRepo.count(); // from PublishedArticle table

	    model.addAttribute("submissions", submissions);
	    model.addAttribute("totalSubmissions", total);
	    model.addAttribute("pendingSubmissions", pending);
	    model.addAttribute("reviewedSubmissions", reviewed);
	    model.addAttribute("publishedSubmissions", published);

	    return "admin_submissions";
	}


	// ===========================
	// 🔹 DOWNLOAD FILE (EDITED PDF OR ORIGINAL) - FIXED STATUS CHANGE
	// ===========================
	@RequestMapping(value = "/download/{id}", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> downloadFile(@PathVariable Long id) throws IOException {
		Optional<Submission> submissionOpt = submissionService.getSubmissionById(id);
		if (submissionOpt.isEmpty()) {
			return ResponseEntity.notFound().build();
		}

		Submission submission = submissionOpt.get();

		// ✅ FIX: Use enum comparison instead of string
		if (submission.getStatus() == Submission.Status.SUBMITTED) {
			submission.setStatus(Submission.Status.REVIEWED);
			submissionService.saveSubmission(submission);
		}

		File file = new File(submission.getFilePath());
		if (!file.exists()) {
			return ResponseEntity.notFound().build();
		}

		String downloadFileName = submission.getFileName();
		String contentType = Files.probeContentType(file.toPath());
		if (contentType == null) {
			contentType = "application/octet-stream";
		}

		InputStream inputStream = new FileInputStream(file);

		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, 
						"attachment; filename=\"" + downloadFileName + "\"")
				.body(new InputStreamResource(inputStream));
	}

	// ===========================
	// 🔹 EDIT SUBMISSION PAGE - UPDATED WITH PDF SUPPORT
	// ===========================
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String editSubmissionPage(@PathVariable Long id, Model model) {
		Submission submission = submissionService.getSubmissionById(id)
				.orElseThrow(() -> new RuntimeException("Submission not found"));

		String content = "";
		boolean canEdit = false;

		File file = new File(submission.getFilePath());

		if (file.exists()) {
			content = extractTextFromFile(file);
			String fileName = submission.getFileName().toLowerCase();
			// ✅ UPDATED TO INCLUDE PDF FILES FOR EDITING
			if (fileName.endsWith(".docx") || fileName.endsWith(".doc") || fileName.endsWith(".txt") || fileName.endsWith(".pdf")) {
				canEdit = true;
			}
		} else {
			content = "File not found";
		}

		model.addAttribute("submission", submission);
		model.addAttribute("fileContent", content);
		model.addAttribute("canEdit", canEdit);

		return "admin-edit";
	}

	// ===========================
	// 🔹 UPDATE & PUBLISH WITH PDF CREATION
	// ===========================
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateAndPublishSubmission(@RequestParam Long id,
			@RequestParam String title,
			@RequestParam String content,
			Authentication authentication) {

		String editedBy = authentication != null ? authentication.getName() : "Admin";

		Submission submission = submissionService.getSubmissionById(id)
				.orElseThrow(() -> new RuntimeException("Submission not found"));

		try {
			// ✅ CREATE PDF FILE WITH EDITED CONTENT
			String originalFilePath = submission.getFilePath();
			String pdfFilePath = createPdfFile(originalFilePath, content, title, editedBy);

			// ✅ UPDATE SUBMISSION WITH EDITED CONTENT AND PDF FILE
			submission.setTitle(title);
			submission.setContent(content);
			submission.setEditedContent(content);
			submission.setEditedBy(editedBy);
			submission.setEditedAt(LocalDateTime.now());

			// ✅ UPDATE FILE PATH TO POINT TO PDF VERSION
			submission.setFilePath(pdfFilePath);
			submission.setFileName("PUBLISHED_" + title.replaceAll("[^a-zA-Z0-9]", "_") + ".pdf");

			// ✅ PUBLISH to Current-issue
			submission.setStatus(Status.PUBLISHED);

			submissionService.saveSubmission(submission);

			System.out.println("✅ Published with PDF file: " + pdfFilePath);

		} catch (Exception e) {
			System.out.println("❌ Error creating PDF file: " + e.getMessage());
			// Fallback: update without PDF creation
			submission.setTitle(title);
			submission.setContent(content);
			submission.setEditedContent(content);
			submission.setEditedBy(editedBy);
			submission.setEditedAt(LocalDateTime.now());
			submission.setStatus(Status.PUBLISHED);
			submissionService.saveSubmission(submission);
		}

		return "redirect:/admin/dashboard?published=true";
	}

	// ✅ PROFESSIONAL PDF CREATION METHOD
	private String createPdfFile(String originalFilePath, String content, String title, String editedBy) throws IOException {
		File originalFile = new File(originalFilePath);
		String originalDir = originalFile.getParent();

		// Create PDF filename
		String pdfFileName = "AVUSCRIPT_" + System.currentTimeMillis() + "_" + 
				title.replaceAll("[^a-zA-Z0-9.-]", "_") + ".pdf";
		String pdfFilePath = originalDir + File.separator + pdfFileName;

		// Create PDF document
		try {
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(pdfFilePath));
			document.open();

			// ===== PROFESSIONAL HEADER =====
			// Journal Title
			Font journalFont = new Font(Font.HELVETICA, 16, Font.BOLD);
			Paragraph journalPara = new Paragraph("AVUSCRIPT", journalFont);
			journalPara.setAlignment(Paragraph.ALIGN_CENTER);
			journalPara.setSpacingAfter(5);
			document.add(journalPara);

			// Journal Subtitle
			Font subtitleFont = new Font(Font.HELVETICA, 10, Font.ITALIC);
			Paragraph subtitlePara = new Paragraph("International Journal for Empirical Research in Ayurveda", subtitleFont);
			subtitlePara.setAlignment(Paragraph.ALIGN_CENTER);
			subtitlePara.setSpacingAfter(15);
			document.add(subtitlePara);

			// Separator line
			Paragraph separator = new Paragraph("____________________________________________________________");
			separator.setAlignment(Paragraph.ALIGN_CENTER);
			separator.setSpacingAfter(20);
			document.add(separator);

			// ===== ARTICLE TITLE =====
			Font titleFont = new Font(Font.HELVETICA, 18, Font.BOLD);
			Paragraph titlePara = new Paragraph(title, titleFont);
			titlePara.setAlignment(Paragraph.ALIGN_CENTER);
			titlePara.setSpacingAfter(30);
			document.add(titlePara);

			// ===== CLEAN CONTENT =====
			String cleanContent = cleanHtmlContent(content);
			
			Font contentFont = new Font(Font.TIMES_ROMAN, 12);
			Paragraph contentPara = new Paragraph(cleanContent, contentFont);
			contentPara.setAlignment(Paragraph.ALIGN_JUSTIFIED);
			contentPara.setSpacingBefore(10);
			document.add(contentPara);

			// ===== PROFESSIONAL FOOTER =====
			document.newPage(); // New page for footer
			
			Font footerFont = new Font(Font.HELVETICA, 9, Font.ITALIC);
			Paragraph footerPara = new Paragraph(
				"Published in AVUSCRIPT - International Journal for Empirical Research in Ayurveda\n" +
				"ISSN: 2583-3677 | www.ayuscript.com"
			);
			footerPara.setAlignment(Paragraph.ALIGN_CENTER);
			footerPara.setSpacingBefore(20);
			document.add(footerPara);

			document.close();

			System.out.println("✅ Created professional PDF file: " + pdfFilePath);
			return pdfFilePath;

		} catch (Exception e) {
			System.out.println("❌ Error creating PDF: " + e.getMessage());
			throw new IOException("Failed to create PDF: " + e.getMessage());
		}
	}

	// ✅ METHOD TO CLEAN HTML CONTENT
	private String cleanHtmlContent(String htmlContent) {
		if (htmlContent == null) {
			return "";
		}
		
		// Remove HTML tags but keep the text content
		String cleanText = htmlContent
			.replaceAll("<[^>]*>", "") // Remove all HTML tags
			.replaceAll("&nbsp;", " ")  // Replace HTML spaces
			.replaceAll("&amp;", "&")   // Replace HTML entities
			.replaceAll("&lt;", "<")
			.replaceAll("&gt;", ">")
			.replaceAll("&quot;", "\"")
			.replaceAll("&#39;", "'")
			.replaceAll("\\s+", " ")    // Normalize multiple spaces
			.trim();
		
		// Remove editor metadata if present
		cleanText = cleanText.replaceAll("Edited and Published by:.*?\\|.*?\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d+", "");
		
		return cleanText;
	}
	
	// ===========================
	// 🔹 PUBLISH TO CURRENT ISSUE - UPDATED WITH PDF FIX
	// ===========================
	@RequestMapping(value = "/publish", method = RequestMethod.POST)
    public String publish(@RequestParam Long submissionId,
                          @RequestParam String title,
                          @RequestParam String htmlContent,
                          @RequestParam String abstractText,
                          Model model) {
        
        try {
            // Get the submission
            Submission submission = submissionService.getSubmissionWithContent(submissionId).orElseThrow();
            
            PublishedArticle pa = new PublishedArticle();
            pa.setTitle(title);
            pa.setHtmlContent(htmlContent);
            pa.setAbstractText(abstractText);
            
            // ✅ ALWAYS CREATE PDF FOR CURRENT ISSUE
            try {
                String pdfFilePath = createPdfFile(submission.getFilePath(), htmlContent, title, "System");
                
                // ✅ FIX: Store the absolute file path properly
                pa.setPdfPath(pdfFilePath); 
                System.out.println("✅ PDF created for current issue: " + pdfFilePath);
                System.out.println("✅ PDF path stored in database: " + pdfFilePath);
                
            } catch (Exception e) {
                System.out.println("❌ PDF creation failed: " + e.getMessage());
                pa.setPdfPath(""); // Set empty if PDF creation fails
            }
            
            publishedRepo.save(pa);

            Submission s = submissionService.getSubmissionWithContent(submissionId).orElseThrow();
            s.setStatus(Submission.Status.PUBLISHED);
            submissionService.saveSubmission(s);
            
            return "redirect:/admin/dashboard?message=Published+Successfully";
            
        } catch (Exception e) {
            System.out.println("❌ Error during publishing: " + e.getMessage());
            return "redirect:/admin/dashboard?error=Publishing+Failed";
        }
    }

	// ===========================
	// 🔹 SEND EMAIL TO AUTHOR WITH ATTACHMENTS - UPDATED
	// ===========================
	@RequestMapping(value = "/send-mail", method = RequestMethod.POST)
	public String sendEmailToAuthor(@RequestParam Long id,
	                               @RequestParam String to,
	                               @RequestParam String subject,
	                               @RequestParam String message,
	                               @RequestParam(value = "attachments", required = false) List<MultipartFile> attachments,
	                               Model model) {
	    
	    try {
	        Submission submission = submissionService.getSubmissionById(id)
	                .orElseThrow(() -> new RuntimeException("Submission not found"));
	        
	        List<File> tempFiles = new ArrayList<>();
	        
	        // Process attachments if any
	        if (attachments != null && !attachments.isEmpty()) {
	            for (MultipartFile multipartFile : attachments) {
	                if (!multipartFile.isEmpty()) {
	                    // Create temporary file
	                    File tempFile = File.createTempFile("attachment_", "_" + multipartFile.getOriginalFilename());
	                    multipartFile.transferTo(tempFile);
	                    tempFiles.add(tempFile);
	                    System.out.println("✅ Processed attachment: " + multipartFile.getOriginalFilename());
	                }
	            }
	        }
	        
	        // Send email with attachments
	        emailService.sendEmailToAuthorWithAttachment(
	            to,
	            submission.getAuthor().getFullName(),
	            subject,
	            message,
	            submission.getTitle(),
	            tempFiles
	        );
	        
	        // Clean up temporary files
	        for (File tempFile : tempFiles) {
	            tempFile.delete();
	        }
	        
	        return "redirect:/admin/dashboard?message=Email+sent+successfully";
	        
	    } catch (Exception e) {
	        System.out.println("❌ Error sending email: " + e.getMessage());
	        return "redirect:/admin/dashboard?error=Failed+to+send+email";
	    }
	}
	// ===================================================
    // UPDATED PAPER REVIEW GET MAPPING (IMPORTANT)
    // ===================================================
    @GetMapping("/paper-review")
    public String paperReview(
            @RequestParam(required = false) Long submissionId,
            @RequestParam(required = false) Long authorId,
            Model model) {

        // Dynamic dropdown values
        List<String> articleTypes = List.of(
                "Original Article",
                "Review Article",
                "Case Report",
                "Short Communication",
                "Editorial",
                "Letter to Editor"
        );

        List<String> volumes = List.of(
                "Volume 1", "Volume 2", "Volume 3",
                "Volume 4", "Volume 5", "Volume 6"
        );

        List<String> issues = List.of("Issue 1", "Issue 2", "Issue 3", "Issue 4");

        model.addAttribute("articleTypes", articleTypes);
        model.addAttribute("volumes", volumes);
        model.addAttribute("issues", issues);

        if (submissionId != null) {
            Submission sub = submissionService.getSubmissionById(submissionId).orElse(null);

            if (sub != null) {
                model.addAttribute("submissionId", submissionId);
                model.addAttribute("selectedArticleType", sub.getArticleType());
                model.addAttribute("selectedVolume", sub.getVolume());
                model.addAttribute("selectedIssue", sub.getIssue());
                model.addAttribute("authorId", sub.getAuthor().getId());
            }
        }

        if (authorId != null) model.addAttribute("authorId", authorId);

        if (!model.containsAttribute("authorId"))
            model.addAttribute("authorId", 0L);

        return "paper-review";
    }
    @PostMapping("/paper-review/save")
    public String savePaperReview(
    		 @RequestParam(required = false) Long submissionId,

             @RequestParam String articleId,
             @RequestParam String articleType,
             @RequestParam String volume,
             @RequestParam String issue,
             @RequestParam String title,
             @RequestParam String citation,
             @RequestParam("authorNames") List<String> authorNames,
             @RequestParam("authorDetails") List<String> authorDetails,

             @RequestParam String abstractText,
             @RequestParam(required = false) String abstractKeywords,
             @RequestParam String introduction,

             @RequestParam(required = false) String sectionContent,
             @RequestParam(required = false) String discussionContent,
             @RequestParam(required = false) String conclusionContent,

             @RequestParam(required = false) MultipartFile referencePdf,
             @RequestParam(required = false) Integer numberOfPages,
             @RequestParam(required = false) String references,

             @RequestParam(required = false) String publicationDate,
             @RequestParam(required = false) String acceptanceDate
    ) {
        try {
            Submission submission;

            // 1️⃣ If editing existing submission
            if (submissionId != null) {
                submission = submissionService.getSubmissionById(submissionId)
                        .orElseThrow(() -> new RuntimeException("Submission not found"));
            } else {
                submission = new Submission();
            }

            // 2️⃣ Basic Fields (your existing code)
            submission.setArticleId(articleId);
            submission.setArticleType(articleType);
            submission.setVolume(volume);
            submission.setIssue(issue);
            submission.setTitle(title);
            submission.setCitation(citation);

            // 3️⃣ Authors (your existing code)
            submission.setAuthorNames(String.join("||", authorNames));
            submission.setAuthorDetails(String.join("||", authorDetails));

            // 4️⃣ Abstract & Intro (your existing code)
            submission.setAbstractText(abstractText);
            submission.setAbstractKeywords(abstractKeywords);
            submission.setIntroduction(introduction);

            // 5️⃣ Body Sections (your existing code)
            submission.setSectionContent(sectionContent);
            submission.setDiscussionContent(discussionContent);
            submission.setConclusionContent(conclusionContent);

            // 6️⃣ Publication Dates (your existing code)
            if (publicationDate != null && !publicationDate.isEmpty()) {
                submission.setPublicationDate(LocalDate.parse(publicationDate));
            }

            if (acceptanceDate != null && !acceptanceDate.isEmpty()) {
                submission.setAcceptanceDate(LocalDate.parse(acceptanceDate));
            }

            // 7️⃣ Reference PDF Upload (your existing code)
            if (referencePdf != null && !referencePdf.isEmpty()) {
                String uploadDir = System.getProperty("user.dir") + "/uploads/reference-pdfs/";
                File dir = new File(uploadDir);
                if (!dir.exists()) dir.mkdirs();

                String pdfPath = uploadDir + referencePdf.getOriginalFilename();
                File dest = new File(pdfPath);
                referencePdf.transferTo(dest);

                submission.setReferencePdfPath(pdfPath);
            }

            submission.setNumberOfPages(numberOfPages);
            submission.setReferencesText(references);

            // ✅ CHANGE THIS: Set status as PUBLISHED instead of REVIEWED
            submission.setStatus(Submission.Status.PUBLISHED);

            submission.setUpdatedAt(LocalDateTime.now());

            submissionService.saveSubmission(submission);

            return "redirect:/admin/dashboard?message=Published+Successfully";

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/admin/dashboard?error=Failed+to+Publish";
        }
    }


}