package com.ayurvedic.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ayurvedic.main.service.SubmissionService;

@Controller
public class HomeController {

    @Autowired
    private SubmissionService submissionService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home() {
        return "index";
    }
    
        
    @RequestMapping(value = "/editorial-board", method = RequestMethod.GET)
        public String editorialBoard() {
            return "editorial-board"; 
        }
    
    @RequestMapping(value = "/author-guideline", method = RequestMethod.GET)
      public String authorguideline() {
          return "author-guideline"; 
      }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String homePage() {
        return "index";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about() {
        return "about";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contact() {
        return "contact";
    }
    
}