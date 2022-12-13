package com.zainab.test.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.zainab.test.models.Chore;
import com.zainab.test.services.ChoreService;
import com.zainab.test.services.UserService;

@Controller
public class ChoreController {
	
	@Autowired
	UserService uService; 
	
	@Autowired 
	ChoreService cService; 
	
	
	@GetMapping("/add")
	public String addChore(@ModelAttribute("chore") Chore chore, HttpSession session) {
		if(session.getAttribute("loginUser")!=null) {
			return "chore.jsp"; 
		} 
		return "redirect:/"; 
	}
	
	
	
	@PostMapping("/createChore") 
	public String add(@Valid @ModelAttribute("chore") Chore chore, BindingResult results) {
		if(results.hasErrors()) {
			return "add.jsp";
		} else {
			cService.createChore(chore); 
			return "redirect:/dashboard"; 
		}
		
	}
	
	@DeleteMapping("/delete/{id}") 
		public String delete(@PathVariable Long id) {
			cService.delete(id);
			return "redirect:/dashboard"; 
		}
	

	}
