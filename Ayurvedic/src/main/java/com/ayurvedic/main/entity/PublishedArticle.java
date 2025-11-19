package com.ayurvedic.main.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "published_article")
public class PublishedArticle {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Lob
    @Column(columnDefinition = "TEXT")
    private String abstractText; // ADD THIS FIELD

    @Lob
    @Column(columnDefinition = "TEXT")
    private String htmlContent;

    private String pdfPath; // ADD THIS FIELD - path to PDF file

    private LocalDateTime publishedAt = LocalDateTime.now();

    // getters / setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAbstractText() { return abstractText; } // ADD THIS
    public void setAbstractText(String abstractText) { this.abstractText = abstractText; } // ADD THIS

    public String getHtmlContent() { return htmlContent; }
    public void setHtmlContent(String htmlContent) { this.htmlContent = htmlContent; }

    public String getPdfPath() { return pdfPath; } // ADD THIS
    public void setPdfPath(String pdfPath) { this.pdfPath = pdfPath; } // ADD THIS

    public LocalDateTime getPublishedAt() { return publishedAt; }
    public void setPublishedAt(LocalDateTime publishedAt) { this.publishedAt = publishedAt; }
}