package com.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	@GetMapping("/")
	public String ticket() {return "/ticket";}
	
	@GetMapping("/reserve")
	public void reserve(Model model, @RequestParam("ticket")int ticket) {
		log.info("reserve mapping-----------------");
		
		model.addAttribute("ticket", ticket);
		
	}
	
	
	
}
