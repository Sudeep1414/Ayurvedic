package com.ayurvedic.main.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
@Table(name = "submissions")
public class Submission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(columnDefinition = "LONGTEXT")
    private String content;

    @Column(nullable = false)
    private String title;

    @Column(name = "file_name")
    private String fileName;

    @Column(name = "file_path")
    private String filePath;

    @Column(name = "file_size")
    private Long fileSize;

    @Column(name = "submitted_at")
    private LocalDateTime submittedAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Enumerated(EnumType.STRING)
    @Column(length = 50)
    private Status status = Status.SUBMITTED;

    @Column(columnDefinition = "TEXT")
    private String adminNotes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id")
    private User author;

    @Column(name = "edited_content", columnDefinition = "TEXT")
    private String editedContent;

    @Column(name = "original_file_path")
    private String originalFilePath;

    @Column(name = "edited_by")
    private String editedBy;

    @Column(name = "edited_at")
    private LocalDateTime editedAt;

    public static enum Status {
        SUBMITTED, APPROVED, REJECTED, PUBLISHED, REVIEWED
    }

    // ================================
    // NEW FIELDS FOR PAPER REVIEW FORM
    // ================================

    @Column(name = "article_id")
    private String articleId;

    @Column(name = "article_type")
    private String articleType;

    private String volume;
    private String issue;

    @Column(name = "publication_date")
    private LocalDate publicationDate;

    @Column(name = "acceptance_date")
    private LocalDate acceptanceDate;

    @Column(columnDefinition = "TEXT")
    private String citation;

    // Store multiple authors as comma-separated or JSON
    @Column(columnDefinition = "LONGTEXT")
    private String authorNames;

    @Column(columnDefinition = "LONGTEXT")
    private String authorDetails;

    // ABSTRACT & INTRO
    @Column(columnDefinition = "LONGTEXT")
    private String abstractText;

    private String abstractKeywords;

    
    @Column(columnDefinition = "LONGTEXT")
    private String introduction;

    // SECTIONS
    @Column(columnDefinition = "LONGTEXT")
    private String sectionContent;

    @Column(columnDefinition = "LONGTEXT")
    private String discussionContent;

    @Column(columnDefinition = "LONGTEXT")
    private String conclusionContent;

    // REFERENCES
    @Column(name = "reference_pdf_path")
    private String referencePdfPath;

    private Integer numberOfPages;

    @Column(columnDefinition = "LONGTEXT")
    private String referencesText;

    // ================================
    // CONSTRUCTOR
    // ================================
    public Submission() {
        this.submittedAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
    }

    // ================================
    // GETTERS & SETTERS
    // ================================
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getFileName() { return fileName; }
    public void setFileName(String fileName) { this.fileName = fileName; }

    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }

    public Long getFileSize() { return fileSize; }
    public void setFileSize(Long fileSize) { this.fileSize = fileSize; }

    public LocalDateTime getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(LocalDateTime submittedAt) { this.submittedAt = submittedAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }

    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }

    public String getAdminNotes() { return adminNotes; }
    public void setAdminNotes(String adminNotes) { this.adminNotes = adminNotes; }

    public User getAuthor() { return author; }
    public void setAuthor(User author) { this.author = author; }

    public String getEditedContent() { return editedContent; }
    public void setEditedContent(String editedContent) { this.editedContent = editedContent; }

    public String getOriginalFilePath() { return originalFilePath; }
    public void setOriginalFilePath(String originalFilePath) { this.originalFilePath = originalFilePath; }

    public String getEditedBy() { return editedBy; }
    public void setEditedBy(String editedBy) { this.editedBy = editedBy; }

    public LocalDateTime getEditedAt() { return editedAt; }
    public void setEditedAt(LocalDateTime editedAt) { this.editedAt = editedAt; }

    // NEW FIELDS GETTERS / SETTERS

    public String getArticleId() { return articleId; }
    public void setArticleId(String articleId) { this.articleId = articleId; }

    public String getArticleType() { return articleType; }
    public void setArticleType(String articleType) { this.articleType = articleType; }

    public String getVolume() { return volume; }
    public void setVolume(String volume) { this.volume = volume; }

    public String getIssue() { return issue; }
    public void setIssue(String issue) { this.issue = issue; }

    public LocalDate getPublicationDate() { return publicationDate; }
    public void setPublicationDate(LocalDate publicationDate) { this.publicationDate = publicationDate; }

    public LocalDate getAcceptanceDate() { return acceptanceDate; }
    public void setAcceptanceDate(LocalDate acceptanceDate) { this.acceptanceDate = acceptanceDate; }

    public String getCitation() { return citation; }
    public void setCitation(String citation) { this.citation = citation; }

    public String getAuthorNames() { return authorNames; }
    public void setAuthorNames(String authorNames) { this.authorNames = authorNames; }

    public String getAuthorDetails() { return authorDetails; }
    public void setAuthorDetails(String authorDetails) { this.authorDetails = authorDetails; }

    public String getAbstractText() { return abstractText; }
    public void setAbstractText(String abstractText) { this.abstractText = abstractText; }

    public String getAbstractKeywords() { return abstractKeywords; }
    public void setAbstractKeywords(String abstractKeywords) { this.abstractKeywords = abstractKeywords; }

    public String getIntroduction() { return introduction; }
    public void setIntroduction(String introduction) { this.introduction = introduction; }

    public String getSectionContent() { return sectionContent; }
    public void setSectionContent(String sectionContent) { this.sectionContent = sectionContent; }

    public String getDiscussionContent() { return discussionContent; }
    public void setDiscussionContent(String discussionContent) { this.discussionContent = discussionContent; }

    public String getConclusionContent() { return conclusionContent; }
    public void setConclusionContent(String conclusionContent) { this.conclusionContent = conclusionContent; }

    public String getReferencePdfPath() { return referencePdfPath; }
    public void setReferencePdfPath(String referencePdfPath) { this.referencePdfPath = referencePdfPath; }

    public Integer getNumberOfPages() { return numberOfPages; }
    public void setNumberOfPages(Integer numberOfPages) { this.numberOfPages = numberOfPages; }

    public String getReferencesText() { return referencesText; }
    public void setReferencesText(String referencesText) { this.referencesText = referencesText; }
}
