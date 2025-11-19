package com.ayurvedic.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan(basePackages = "com.ayurvedic.main")
@EntityScan("com.ayurvedic.main.entity")
@EnableJpaRepositories("com.ayurvedic.main.repository")
public class AyurvedicApplication {

	 public static void main(String[] args) {
	        SpringApplication.run(AyurvedicApplication.class, args);
	        System.out.println("✅ STARTING AYUR APPLICATION...");
	    }

}


