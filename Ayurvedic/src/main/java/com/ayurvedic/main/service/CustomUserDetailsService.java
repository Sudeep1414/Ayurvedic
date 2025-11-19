package com.ayurvedic.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ayurvedic.main.entity.User;
import com.ayurvedic.main.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        System.out.println("🔍 CustomUserDetailsService: Looking for user: " + email);
        
        User user = userRepository.findByEmail(email);
        
        if (user == null) {
            System.out.println("❌ CustomUserDetailsService: User not found: " + email);
            throw new UsernameNotFoundException("User not found with email: " + email);
        }
        
        System.out.println("✅ CustomUserDetailsService: User found: " + user.getEmail());
        System.out.println("🔑 CustomUserDetailsService: Password hash: " + user.getPassword());
        System.out.println("🎭 CustomUserDetailsService: Role: " + user.getRole());
        
        return org.springframework.security.core.userdetails.User.builder()
                .username(user.getEmail())
                .password(user.getPassword())
                .roles(user.getRole())
                .build();
    }
}