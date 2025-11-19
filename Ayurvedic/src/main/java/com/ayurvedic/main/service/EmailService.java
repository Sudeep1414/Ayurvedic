package com.ayurvedic.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import java.io.File;
import java.util.List;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Value("${admin.email:ayuscriptjournal@gmail.com}")
    private String adminEmail;

    @Value("${spring.mail.username}")
    private String fromEmail;

    public void sendContactNotificationToAdmin(String name, String email, String phone, String subject, String message) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            
            helper.setFrom(fromEmail);
            helper.setTo(adminEmail);
            helper.setSubject("📧 New Contact Form Submission - " + (subject != null && !subject.isEmpty() ? subject : "No Subject"));
            
            String htmlContent = createContactEmailHtml(name, email, phone, subject, message);
            helper.setText(htmlContent, true);
            
            mailSender.send(mimeMessage);
            System.out.println("✅ Contact notification sent to admin: " + adminEmail);
            
        } catch (MessagingException e) {
            System.out.println("❌ Error sending email: " + e.getMessage());
            throw new RuntimeException("Failed to send email", e);
        } catch (Exception e) {
            System.out.println("❌ Unexpected error: " + e.getMessage());
            throw new RuntimeException("Unexpected error occurred", e);
        }
    }

    // ✅ Send email to author
    public void sendEmailToAuthor(String toEmail, String authorName, String subject, String message, String articleTitle) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            
            helper.setFrom(fromEmail);
            helper.setTo(toEmail);
            helper.setSubject("AVUSCRIPT: " + subject);
            
            String htmlContent = createAuthorEmailHtml(authorName, subject, message, articleTitle);
            helper.setText(htmlContent, true);
            
            mailSender.send(mimeMessage);
            System.out.println("✅ Email sent to author: " + toEmail);
            
        } catch (MessagingException e) {
            System.out.println("❌ Error sending email to author: " + e.getMessage());
            throw new RuntimeException("Failed to send email to author", e);
        }
    }

    // ✅ Send email to author with attachments
    public void sendEmailToAuthorWithAttachment(String toEmail, String authorName, String subject, String message, String articleTitle, List<File> attachments) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            
            helper.setFrom(fromEmail);
            helper.setTo(toEmail);
            helper.setSubject("AVUSCRIPT: " + subject);
            
            String htmlContent = createAuthorEmailHtml(authorName, subject, message, articleTitle);
            helper.setText(htmlContent, true);
            
            // Add attachments if any
            if (attachments != null && !attachments.isEmpty()) {
                for (File file : attachments) {
                    if (file.exists() && file.isFile()) {
                        helper.addAttachment(file.getName(), file);
                        System.out.println("✅ Added attachment: " + file.getName());
                    }
                }
            }
            
            mailSender.send(mimeMessage);
            System.out.println("✅ Email with attachments sent to author: " + toEmail);
            
        } catch (MessagingException e) {
            System.out.println("❌ Error sending email with attachments: " + e.getMessage());
            throw new RuntimeException("Failed to send email with attachments", e);
        }
    }

    // ✅ NEW METHOD: Send password reset email
    public void sendPasswordResetEmail(String toEmail, String userName, String resetToken) {
        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            
            helper.setFrom(fromEmail);
            helper.setTo(toEmail);
            helper.setSubject("🔐 Password Reset Request - AVUSCRIPT");
            
            String resetLink = "http://localhost:8084/reset-password?token=" + resetToken;
            String htmlContent = createPasswordResetEmailHtml(userName, resetLink);
            helper.setText(htmlContent, true);
            
            mailSender.send(mimeMessage);
            System.out.println("✅ Password reset email sent to: " + toEmail);
            
        } catch (MessagingException e) {
            System.out.println("❌ Error sending password reset email: " + e.getMessage());
            throw new RuntimeException("Failed to send password reset email", e);
        }
    }

    private String createContactEmailHtml(String name, String email, String phone, String subject, String message) {
        // Handle null values
        String safeName = name != null ? name : "Not provided";
        String safeEmail = email != null ? email : "Not provided";
        String safePhone = phone != null ? phone : "Not provided";
        String safeSubject = subject != null && !subject.isEmpty() ? subject : "No Subject";
        String safeMessage = message != null ? message : "No message provided";
        
        return "<!DOCTYPE html>\n" +
               "<html>\n" +
               "<head>\n" +
               "    <meta charset=\"UTF-8\">\n" +
               "    <style>\n" +
               "        body { font-family: 'Segoe UI', Arial, sans-serif; background: #fbf6ee; margin: 0; padding: 20px; }\n" +
               "        .container { max-width: 600px; margin: 0 auto; background: white; border-radius: 12px; box-shadow: 0 10px 30px rgba(11,86,51,0.1); overflow: hidden; }\n" +
               "        .header { background: linear-gradient(135deg, #0b5633, #2b8a5f); color: white; padding: 30px; text-align: center; }\n" +
               "        .header h1 { margin: 0; font-size: 24px; font-weight: bold; }\n" +
               "        .header p { margin: 5px 0 0 0; opacity: 0.9; }\n" +
               "        .content { padding: 30px; }\n" +
               "        .field { margin-bottom: 15px; padding: 15px; background: #f8f9fa; border-radius: 8px; border-left: 4px solid #0b5633; }\n" +
               "        .field-label { font-weight: bold; color: #0b5633; display: block; margin-bottom: 5px; font-size: 14px; }\n" +
               "        .field-value { color: #2d2d2d; font-size: 15px; }\n" +
               "        .message-box { background: #e8f5e8; padding: 20px; border-radius: 8px; border: 1px solid #2b8a5f; margin-top: 20px; }\n" +
               "        .footer { background: #f7efe6; padding: 20px; text-align: center; color: #7a4b3a; font-size: 12px; border-top: 1px solid #e5d9c8; }\n" +
               "        .logo { color: #c9a25a; font-weight: bold; font-size: 16px; }\n" +
               "    </style>\n" +
               "</head>\n" +
               "<body>\n" +
               "    <div class=\"container\">\n" +
               "        <div class=\"header\">\n" +
               "            <h1>📧 New Contact Form Submission</h1>\n" +
               "            <p>AYUSCRIPT Journal - ISSN: 2583-3677</p>\n" +
               "        </div>\n" +
               "        \n" +
               "        <div class=\"content\">\n" +
               "            <div class=\"field\">\n" +
               "                <span class=\"field-label\">👤 Name:</span>\n" +
               "                <span class=\"field-value\">" + safeName + "</span>\n" +
               "            </div>\n" +
               "            \n" +
               "            <div class=\"field\">\n" +
               "                <span class=\"field-label\">📧 Email:</span>\n" +
               "                <span class=\"field-value\">" + safeEmail + "</span>\n" +
               "            </div>\n" +
               "            \n" +
               "            <div class=\"field\">\n" +
               "                <span class=\"field-label\">📞 Phone:</span>\n" +
               "                <span class=\"field-value\">" + safePhone + "</span>\n" +
               "            </div>\n" +
               "            \n" +
               "            <div class=\"field\">\n" +
               "                <span class=\"field-label\">📝 Subject:</span>\n" +
               "                <span class=\"field-value\">" + safeSubject + "</span>\n" +
               "            </div>\n" +
               "            \n" +
               "            <div class=\"message-box\">\n" +
               "                <span class=\"field-label\">💬 Message:</span>\n" +
               "                <div class=\"field-value\" style=\"margin-top: 10px; white-space: pre-wrap; line-height: 1.6;\">" + safeMessage + "</div>\n" +
               "            </div>\n" +
               "        </div>\n" +
               "        \n" +
               "        <div class=\"footer\">\n" +
               "            <p class=\"logo\">AYUSCRIPT</p>\n" +
               "            <p>This email was automatically generated from your website contact form.</p>\n" +
               "            <p>© 2025 Ayurveda Research & Career Academy (ARCA). All rights reserved.</p>\n" +
               "        </div>\n" +
               "    </div>\n" +
               "</body>\n" +
               "</html>";
    }

    // ✅ Create professional email HTML for authors
    private String createAuthorEmailHtml(String authorName, String subject, String message, String articleTitle) {
        String safeName = authorName != null ? authorName : "Author";
        String safeSubject = subject != null ? subject : "Update on Your Submission";
        String safeMessage = message != null ? message : "";
        String safeArticleTitle = articleTitle != null ? articleTitle : "Your Article";
        
        return "<!DOCTYPE html>\n" +
               "<html>\n" +
               "<head>\n" +
               "    <meta charset=\"UTF-8\">\n" +
               "    <style>\n" +
               "        body { font-family: 'Segoe UI', Arial, sans-serif; background: #fbf6ee; margin: 0; padding: 20px; }\n" +
               "        .container { max-width: 600px; margin: 0 auto; background: white; border-radius: 12px; box-shadow: 0 10px 30px rgba(11,86,51,0.1); overflow: hidden; }\n" +
               "        .header { background: linear-gradient(135deg, #0b5633, #2b8a5f); color: white; padding: 30px; text-align: center; }\n" +
               "        .header h1 { margin: 0; font-size: 24px; font-weight: bold; }\n" +
               "        .header p { margin: 5px 0 0 0; opacity: 0.9; }\n" +
               "        .content { padding: 30px; }\n" +
               "        .greeting { font-size: 18px; color: #0b5633; margin-bottom: 20px; font-weight: bold; }\n" +
               "        .message-box { background: #f8f9fa; padding: 20px; border-radius: 8px; border-left: 4px solid #0b5633; margin: 20px 0; }\n" +
               "        .article-info { background: #e8f5e8; padding: 15px; border-radius: 8px; margin-bottom: 20px; border: 1px solid #2b8a5f; }\n" +
               "        .footer { background: #f7efe6; padding: 20px; text-align: center; color: #7a4b3a; font-size: 12px; border-top: 1px solid #e5d9c8; }\n" +
               "        .logo { color: #c9a25a; font-weight: bold; font-size: 16px; }\n" +
               "        .signature { margin-top: 25px; padding-top: 20px; border-top: 1px solid #e0e0e0; }\n" +
               "    </style>\n" +
               "</head>\n" +
               "<body>\n" +
               "    <div class=\"container\">\n" +
               "        <div class=\"header\">\n" +
               "            <h1>📧 AVUSCRIPT Journal</h1>\n" +
               "            <p>International Journal for Empirical Research in Ayurveda</p>\n" +
               "        </div>\n" +
               "        \n" +
               "        <div class=\"content\">\n" +
               "            <div class=\"greeting\">Dear " + safeName + ",</div>\n" +
               "            \n" +
               "            <div class=\"article-info\">\n" +
               "                <strong>Article:</strong> " + safeArticleTitle + "<br>\n" +
               "                <strong>Subject:</strong> " + safeSubject + "\n" +
               "            </div>\n" +
               "            \n" +
               "            <div class=\"message-box\">\n" +
               "                <div style=\"white-space: pre-wrap; line-height: 1.6; font-size: 15px;\">" + safeMessage + "</div>\n" +
               "            </div>\n" +
               "            \n" +
               "            <div class=\"signature\">\n" +
               "                <strong>Best regards,</strong><br>\n" +
               "                <strong>Editorial Team</strong><br>\n" +
               "                AVUSCRIPT Journal<br>\n" +
               "                ISSN: 2583-3677<br>\n" +
               "                Email: editor@ayuscript.com<br>\n" +
               "                Website: www.ayuscript.com\n" +
               "            </div>\n" +
               "        </div>\n" +
               "        \n" +
               "        <div class=\"footer\">\n" +
               "            <p class=\"logo\">AVUSCRIPT</p>\n" +
               "            <p>International Journal for Empirical Research in Ayurveda</p>\n" +
               "            <p>© 2025 Ayurveda Research & Career Academy (ARCA). All rights reserved.</p>\n" +
               "        </div>\n" +
               "    </div>\n" +
               "</body>\n" +
               "</html>";
    }

    // ✅ NEW METHOD: Create password reset email HTML
    private String createPasswordResetEmailHtml(String userName, String resetLink) {
        String safeName = userName != null ? userName : "User";
        
        return "<!DOCTYPE html>\n" +
               "<html>\n" +
               "<head>\n" +
               "    <meta charset=\"UTF-8\">\n" +
               "    <style>\n" +
               "        body { font-family: 'Segoe UI', Arial, sans-serif; background: #fbf6ee; margin: 0; padding: 20px; }\n" +
               "        .container { max-width: 600px; margin: 0 auto; background: white; border-radius: 12px; box-shadow: 0 10px 30px rgba(11,86,51,0.1); overflow: hidden; }\n" +
               "        .header { background: linear-gradient(135deg, #0b5633, #2b8a5f); color: white; padding: 30px; text-align: center; }\n" +
               "        .header h1 { margin: 0; font-size: 24px; font-weight: bold; }\n" +
               "        .header p { margin: 5px 0 0 0; opacity: 0.9; }\n" +
               "        .content { padding: 30px; }\n" +
               "        .greeting { font-size: 18px; color: #0b5633; margin-bottom: 20px; font-weight: bold; }\n" +
               "        .reset-box { background: #e8f5e8; padding: 25px; border-radius: 8px; border: 2px solid #2b8a5f; margin: 20px 0; text-align: center; }\n" +
               "        .reset-button { display: inline-block; background: #0b5633; color: white; padding: 15px 30px; text-decoration: none; border-radius: 8px; font-weight: bold; margin: 15px 0; }\n" +
               "        .reset-button:hover { background: #2b8a5f; }\n" +
               "        .reset-link { word-break: break-all; color: #0b5633; background: #f8f9fa; padding: 15px; border-radius: 5px; margin: 15px 0; font-family: monospace; }\n" +
               "        .footer { background: #f7efe6; padding: 20px; text-align: center; color: #7a4b3a; font-size: 12px; border-top: 1px solid #e5d9c8; }\n" +
               "        .logo { color: #c9a25a; font-weight: bold; font-size: 16px; }\n" +
               "        .note { background: #fff3cd; padding: 15px; border-radius: 5px; border-left: 4px solid #ffc107; margin: 15px 0; font-size: 14px; }\n" +
               "    </style>\n" +
               "</head>\n" +
               "<body>\n" +
               "    <div class=\"container\">\n" +
               "        <div class=\"header\">\n" +
               "            <h1>🔐 AVUSCRIPT Password Reset</h1>\n" +
               "            <p>International Journal for Empirical Research in Ayurveda</p>\n" +
               "        </div>\n" +
               "        \n" +
               "        <div class=\"content\">\n" +
               "            <div class=\"greeting\">Dear " + safeName + ",</div>\n" +
               "            \n" +
               "            <p>We received a request to reset your password for your AVUSCRIPT account. Click the button below to create a new password:</p>\n" +
               "            \n" +
               "            <div class=\"reset-box\">\n" +
               "                <a href=\"" + resetLink + "\" class=\"reset-button\">Reset Your Password</a>\n" +
               "                <p style=\"margin: 10px 0 0 0; font-size: 14px;\">This link will expire in 30 minutes</p>\n" +
               "            </div>\n" +
               "            \n" +
               "            <p>If the button doesn't work, copy and paste this link into your browser:</p>\n" +
               "            <div class=\"reset-link\">" + resetLink + "</div>\n" +
               "            \n" +
               "            <div class=\"note\">\n" +
               "                <strong>Note:</strong> If you didn't request a password reset, please ignore this email. Your password will remain unchanged.\n" +
               "            </div>\n" +
               "            \n" +
               "            <p>Best regards,<br><strong>AVUSCRIPT Editorial Team</strong></p>\n" +
               "        </div>\n" +
               "        \n" +
               "        <div class=\"footer\">\n" +
               "            <p class=\"logo\">AVUSCRIPT</p>\n" +
               "            <p>International Journal for Empirical Research in Ayurveda</p>\n" +
               "            <p>ISSN: 2583-3677 | Email: editor@ayuscript.com</p>\n" +
               "            <p>© 2025 Ayurveda Research & Career Academy (ARCA). All rights reserved.</p>\n" +
               "        </div>\n" +
               "    </div>\n" +
               "</body>\n" +
               "</html>";
    }
}