package com.ayurvedic.main.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ayurvedic.main.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    
    User findByEmail(String email);
    
    boolean existsByEmail(String email);
    
    // ✅ NEW METHOD: Find by reset token
    User findByResetToken(String resetToken);
    
    // ✅ NEW METHOD: Find users with expired reset tokens
    List<User> findByResetTokenExpiryBefore(LocalDateTime dateTime);
    
    // ✅ NEW METHOD: Check if email exists and return user
    @Query("SELECT u FROM User u WHERE u.email = :email")
    User findUserByEmail(@Param("email") String email);
}