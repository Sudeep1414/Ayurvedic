 package com.ayurvedic.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ayurvedic.main.entity.PublishedArticle;
import com.ayurvedic.main.entity.Submission;
import com.ayurvedic.main.repository.PublishedArticleRepository;
import com.ayurvedic.main.repository.SubmissionRepository;

import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/published")
public class PublishedController {

    @Autowired
    private PublishedArticleRepository publishedRepo;

    @Autowired
    private SubmissionRepository submissionRepo;

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String listAll(Model model) {
        model.addAttribute("articles", publishedRepo.findAll());
        return "published_list";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String viewOne(@PathVariable Long id, Model model) {
        PublishedArticle article = publishedRepo.findById(id).orElse(null);
        if (article == null) {
            model.addAttribute("errorMessage", "Article not found");
            return "published_view";
        }
        model.addAttribute("article", article);
        return "published_view";
    }

    // SHOW ABSTRACT - NEW ENDPOINT
    @RequestMapping(value = "/abstract/{id}", method = RequestMethod.GET)
    public String showAbstract(@PathVariable Long id, Model model) {
        PublishedArticle article = publishedRepo.findById(id).orElse(null);
        if (article == null) {
            model.addAttribute("errorMessage", "Article not found");
            return "abstract-view";
        }
        model.addAttribute("article", article);
        return "abstract-view";
    }

    // SHOW HTML VERSION - UPDATED
    @RequestMapping(value = "/html/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String getUpdatedHtml(@PathVariable Long id) {
        PublishedArticle article = publishedRepo.findById(id).orElse(null);
        if (article == null) {
            return "[Error: Published article not found]";
        }
        return article.getHtmlContent();
    }

    // DOWNLOAD PDF - NEW ENDPOINT
    @RequestMapping(value = "/pdf/{id}", method = RequestMethod.GET)
    public ResponseEntity<Resource> downloadPdf(@PathVariable Long id) {
        try {
            PublishedArticle article = publishedRepo.findById(id).orElse(null);
            if (article == null || article.getPdfPath() == null) {
                return ResponseEntity.notFound().build();
            }

            Path filePath = Paths.get(article.getPdfPath()).normalize();
            Resource resource = new UrlResource(filePath.toUri());

            if (resource.exists() && resource.isReadable()) {
                // Get the actual filename from the stored path
                String filename = filePath.getFileName().toString();
                
                return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_PDF)
                    .header(HttpHeaders.CONTENT_DISPOSITION, 
                        "attachment; filename=\"" + filename + "\"")
                    .header("Cache-Control", "no-cache, no-store, must-revalidate")
                    .header("Pragma", "no-cache")
                    .header("Expires", "0")
                    .body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}