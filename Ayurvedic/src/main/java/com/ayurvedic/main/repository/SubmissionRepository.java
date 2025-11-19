package com.ayurvedic.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ayurvedic.main.entity.Submission;
import com.ayurvedic.main.entity.User;

@Repository  // ADD THIS
public interface SubmissionRepository extends JpaRepository<Submission, Long> {
    List<Submission> findByAuthorOrderBySubmittedAtDesc(User author);
    List<Submission> findByStatusOrderBySubmittedAtDesc(String status);
    List<Submission> findAllByOrderBySubmittedAtDesc();
 // In SubmissionRepository.java
    List<Submission> findByStatusOrderByUpdatedAtDesc(Submission.Status status);

}