package com.ayurvedic.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ayurvedic.main.entity.User;
import com.ayurvedic.main.service.EmailService;
import com.ayurvedic.main.service.UserService;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerUser(@RequestParam String email,
                              @RequestParam String password,
                              @RequestParam String confirmPassword,
                              @RequestParam String fullName,
                              @RequestParam String address,
                              @RequestParam String mobileNumber,
                              @RequestParam String instituteName,
                              Model model) {
        
        // Check if email already exists
        if (userService.emailExists(email)) {
            model.addAttribute("error", "Email already exists!");
            return "register";
        }
        
        // Check password match
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match!");
            return "register";
        }
        
        // Create new user
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user.setFullName(fullName);
        user.setAddress(address);
        user.setMobileNumber(mobileNumber);
        user.setInstituteName(instituteName);
        user.setRole("AUTHOR");   
        
        userService.registerUser(user);
        model.addAttribute("success", "Registration successful! Please login.");
        return "login";
    }

    // ✅ UPDATED: Single-click forgot password
    @RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
    public String handleForgotPassword(@RequestParam String email, Model model) {
        try {
            // Check if email exists
            if (userService.emailExists(email)) {
                // Generate reset token
                String resetToken = userService.generateResetToken(email);
                
                if (resetToken != null) {
                    // Get user details for email
                    User user = userService.findByEmail(email).orElse(null);
                    if (user != null) {
                        // Send password reset email
                        emailService.sendPasswordResetEmail(email, user.getFullName(), resetToken);
                    }
                }
            }
            
            // ✅ ALWAYS show the same success message (professional approach)
            model.addAttribute("success", "If your email is registered with us, you will receive a password reset link shortly.");
            
        } catch (Exception e) {
            System.out.println("❌ Error in forgot password: " + e.getMessage());
            // Still show success message for security
            model.addAttribute("success", "If your email is registered with us, you will receive a password reset link shortly.");
        }
        
        return "login";
    }

    // ✅ FIXED: Show reset password page - Make sure this endpoint exists
    @RequestMapping(value = "/reset-password", method = RequestMethod.GET)
    public String showResetPasswordForm(@RequestParam String token, Model model) {
        System.out.println("🔍 Reset password token received: " + token);
        
        // Validate token
        if (!userService.validateResetToken(token).isPresent()) {
            System.out.println("❌ Invalid or expired token: " + token);
            model.addAttribute("error", "Invalid or expired reset link. Please request a new password reset.");
            return "login";
        }
        
        System.out.println("✅ Valid token, showing reset password page");
        model.addAttribute("token", token);
        return "reset-password"; // Make sure this JSP file exists
    }

    // ✅ FIXED: Handle password reset
    @RequestMapping(value = "/reset-password", method = RequestMethod.POST)
    public String handleResetPassword(@RequestParam String token,
                                    @RequestParam String newPassword,
                                    @RequestParam String confirmPassword,
                                    Model model) {
        try {
            System.out.println("🔍 Processing password reset for token: " + token);
            
            // Check if passwords match
            if (!newPassword.equals(confirmPassword)) {
                model.addAttribute("error", "Passwords do not match!");
                model.addAttribute("token", token);
                return "reset-password";
            }
            
            // Check password length
            if (newPassword.length() < 6) {
                model.addAttribute("error", "Password must be at least 6 characters long!");
                model.addAttribute("token", token);
                return "reset-password";
            }
            
            // Reset password
            boolean success = userService.resetPassword(token, newPassword);
            
            if (success) {
                System.out.println("✅ Password reset successful for token: " + token);
                model.addAttribute("success", "Password reset successfully! You can now login with your new password.");
            } else {
                System.out.println("❌ Password reset failed for token: " + token);
                model.addAttribute("error", "Invalid or expired reset link. Please request a new password reset.");
            }
            
        } catch (Exception e) {
            System.out.println("❌ Error resetting password: " + e.getMessage());
            model.addAttribute("error", "An error occurred. Please try again.");
            model.addAttribute("token", token);
            return "reset-password";
        }
        
        return "login";
    }
}