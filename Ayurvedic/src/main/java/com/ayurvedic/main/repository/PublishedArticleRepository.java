package com.ayurvedic.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ayurvedic.main.entity.PublishedArticle;

@Repository
public interface PublishedArticleRepository extends JpaRepository<PublishedArticle, Long> {}
