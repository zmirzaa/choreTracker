package com.zainab.test.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.zainab.test.models.Chore;
import com.zainab.test.models.LoginUser;
import com.zainab.test.models.User;
import com.zainab.test.services.ChoreService;
import com.zainab.test.services.UserService;


@Controller
public class UserController {
	
	@Autowired 
	UserService uService; 
	
	
	@Autowired 
	ChoreService cService; 
	
	
		@GetMapping("/")
		public String home(@ModelAttribute("user") User user, @ModelAttribute("loginUser") LoginUser loginUser) {
		return "index.jsp"; 
		
		}
	
	
			//register a user
			@PostMapping("/register")
			public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult results, HttpSession session, @ModelAttribute("loginUser") LoginUser loginUser) {
				//validate user
				uService.validate(user, results);
				if(results.hasErrors()) {
					return "index.jsp";
				}
				//register user
				uService.regUser(user); 
				// put user in session
				session.setAttribute("loginUser", user);
				return "redirect:/dashboard";
			}

			
			//login
			@PostMapping("/login")
			public String loginUser(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult results, HttpSession session, @ModelAttribute("user") User user) {
				
				uService.authenticateUser(loginUser, results); 
				if(results.hasErrors()) {
					return "index.jsp"; 
				}
				User loggedInUser=uService.findByEmail(loginUser.getEmail()); 
				session.setAttribute("loginUser", loggedInUser); 
				return "redirect:/dashboard";
			}
			
			//logout
			@GetMapping("/logout")
			public String logout(HttpSession session) {
				session.invalidate(); 
				return "redirect:/";
			}
	
			
			//render dashboard
			@GetMapping("/dashboard") 
			public String dashboard(@ModelAttribute("chore") Chore chore, Model model, HttpSession session) {
				
				if(session.getAttribute("loginUser")!=null) {
					User user =(User)session.getAttribute("loginUser"); 
					User userInSession = uService.findById(user.getId()); 
					model.addAttribute("userInSession", userInSession); 
					model.addAttribute("allChores", cService.allChores());
					return "dashboard.jsp";
				}
				return "redirect:/";
			}
			
			

}
