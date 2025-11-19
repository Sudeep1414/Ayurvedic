package com.ayurvedic.main.service;


import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ayurvedic.main.entity.Submission;
import com.ayurvedic.main.entity.Submission.Status;
import com.ayurvedic.main.entity.User;
import com.ayurvedic.main.repository.SubmissionRepository;

import jakarta.transaction.Transactional;

@Service
public class SubmissionService {
    
    @Autowired
    private SubmissionRepository submissionRepository;
    
    public List<Submission> getUserSubmissions(User author) {
        return submissionRepository.findByAuthorOrderBySubmittedAtDesc(author);
    }
    
    public List<Submission> getAllSubmissions() {
        return submissionRepository.findAllByOrderBySubmittedAtDesc();
    }
    
    
    // ✅ NEW: Get published submissions for current issues page
    public List<Submission> getPublishedSubmissions() {
        try {
            // Try with Enum first
            return submissionRepository.findByStatusOrderByUpdatedAtDesc(Submission.Status.PUBLISHED);
        } catch (Exception e) {
            // Fallback: get all and filter
            return submissionRepository.findAll().stream()
                .filter(sub -> sub.getStatus() != null && "PUBLISHED".equals(sub.getStatus().name()))
                .sorted((s1, s2) -> s2.getUpdatedAt().compareTo(s1.getUpdatedAt()))
                .collect(Collectors.toList());
        }
    }
    
    public List<Submission> getSubmissionsByStatus(String status) {
        return submissionRepository.findByStatusOrderBySubmittedAtDesc(status);
    }
    
    public Optional<Submission> getSubmissionById(Long id) {
        return submissionRepository.findById(id);
    }
    
    // NEW EDIT FUNCTIONALITY METHODS
    public Submission updateSubmissionContent(Long id, String editedContent, String adminNotes, String editedBy) {
        Optional<Submission> submissionOpt = submissionRepository.findById(id);
        if (submissionOpt.isPresent()) {
            Submission submission = submissionOpt.get();
            submission.setEditedContent(editedContent);
            submission.setAdminNotes(adminNotes);
            submission.setEditedBy(editedBy);
            submission.setEditedAt(LocalDateTime.now());
            submission.setUpdatedAt(LocalDateTime.now());
            return submissionRepository.save(submission);
        }
        return null;
    }
    
    public Optional<Submission> getSubmissionWithContent(Long id) {
        return submissionRepository.findById(id);
    }

    public SubmissionRepository getSubmissionRepository() {
        return submissionRepository;
    }

    public void setSubmissionRepository(SubmissionRepository submissionRepository) {
        this.submissionRepository = submissionRepository;
    }
    
    @Transactional
    public Submission saveSubmission(Submission submission) {
        return submissionRepository.saveAndFlush(submission);
    }

    // ✅ NEW: Update submission status
    @Transactional
    public void updateSubmissionStatus(Long id, Status status) {
        submissionRepository.findById(id).ifPresent(submission -> {
        	submission.setStatus(status);
            submissionRepository.save(submission);
        });
    }
    

}