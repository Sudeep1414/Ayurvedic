package com.ayurvedic.main.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ayurvedic.main.entity.User;
import com.ayurvedic.main.repository.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    public User registerUser(User user) {
        // Encode password before saving
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }
    
    public Optional<User> findByEmail(String email) {
        User user = userRepository.findByEmail(email);
        return Optional.ofNullable(user);
    }
    
    public boolean emailExists(String email) {
        return userRepository.existsByEmail(email);
    }
    
    // Additional helper method for authentication
    public boolean validateUser(String email, String rawPassword) {
        Optional<User> userOptional = findByEmail(email);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            return passwordEncoder.matches(rawPassword, user.getPassword());
        }
        return false;
    }
    
    // ✅ NEW METHOD: Generate password reset token
    public String generateResetToken(String email) {
        Optional<User> userOptional = findByEmail(email);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            
            // Generate unique token
            String resetToken = UUID.randomUUID().toString();
            
            // Set token and expiry (30 minutes from now)
            user.setResetToken(resetToken);
            user.setResetTokenExpiry(LocalDateTime.now().plusMinutes(30));
            
            userRepository.save(user);
            return resetToken;
        }
        return null;
    }
    
    // ✅ NEW METHOD: Validate reset token
    public Optional<User> validateResetToken(String token) {
        User user = userRepository.findByResetToken(token);
        if (user != null && user.isResetTokenValid()) {
            return Optional.of(user);
        }
        return Optional.empty();
    }
    
    // ✅ NEW METHOD: Reset password
    public boolean resetPassword(String token, String newPassword) {
        Optional<User> userOptional = validateResetToken(token);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            
            // Update password
            user.setPassword(passwordEncoder.encode(newPassword));
            
            // Clear reset token
            user.setResetToken(null);
            user.setResetTokenExpiry(null);
            
            userRepository.save(user);
            return true;
        }
        return false;
    }
    
    // ✅ NEW METHOD: Clear expired tokens (can be called periodically)
    public void clearExpiredResetTokens() {
        List<User> usersWithExpiredTokens = userRepository.findByResetTokenExpiryBefore(LocalDateTime.now());
        for (User user : usersWithExpiredTokens) {
            user.setResetToken(null);
            user.setResetTokenExpiry(null);
        }
        userRepository.saveAll(usersWithExpiredTokens);
    }
}