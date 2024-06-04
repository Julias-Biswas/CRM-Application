package com.crm.main.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crm.main.entity.Employee;
import com.crm.main.service.CustomerEnquiryService;
import com.crm.main.service.CustomerFollowUpsService;
import com.crm.main.service.EmployeeService;
import com.crm.main.service.SellCourseService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	@Autowired
	EmployeeService empService;
	
	@Autowired
	SellCourseService sellCourseService;
	
	@Autowired
	CustomerEnquiryService customerEnquiryService;
	
	@Autowired
	CustomerFollowUpsService customerFollowUpsService;

	@GetMapping("/")
	public String openIndexPage() {
		return "index";
	}

	@GetMapping("/home")
	public String openHomePage() {
		return "index";
	}

	@GetMapping("/signin")
	public String openSignInPage() {
		return "signin";
	}

	@GetMapping("/signup")
	public String openSignUpPage() {
		return "signup";
	}

	@PostMapping("/signInForm")
	public String openSignInForm(@RequestParam("email") String email, @RequestParam("password") String password,
			Model model, HttpSession session) {
		String page = "signin";

		Employee emp = empService.searchByEmailService(email);

		if (emp != null && password.equals(emp.getPassword()) && emp.getModule().equals("Admin")) {
			List<Object[]> courseSaleCount = sellCourseService.getSellCourseCountService();
			List<Object[]> customerFollowUpsDateCount = customerFollowUpsService.getCustomerFollowUpsDateCountService();
			List<Object[]> customerEnquriesDateCount = customerEnquiryService.getCustomerEnquriesDateCountService();
			
			model.addAttribute("model_courseSellCountAdmin", courseSaleCount);
			model.addAttribute("model_customerFollowUpsDateCountAdmin", customerFollowUpsDateCount);
			model.addAttribute("model_customerEnquiresDateCountAdmin", customerEnquriesDateCount);
			
			session.setAttribute("session_admin", emp);
			
			page = "admin-dashboard";
		} else {
			if (emp != null && emp.getPassword().equals(password) && emp.getModule().equals("Employee")) {
				List<Object[]> courseSaleCount = sellCourseService.getSellCourseCountService();
				List<Object[]> customerFollowUpsDateCount = customerFollowUpsService.getCustomerFollowUpsDateCountService();
				List<Object[]> customerEnquriesDateCount = customerEnquiryService.getCustomerEnquriesDateCountService();
				
				model.addAttribute("model_courseSellCountEmp", courseSaleCount);
				model.addAttribute("model_customerFollowUpsDateCountEmp", customerFollowUpsDateCount);
				model.addAttribute("model_customerEnquiresDateCountEmp", customerEnquriesDateCount);
				
				session.setAttribute("session_emp", emp);
				
				page = "employee-dashboard";
			} else {
				model.addAttribute("model_error", "Oops! Invalid email id and password");
				page = "signin";
			}
		}

		return page;
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate();

		model.addAttribute("model_success", "Hurray! Logout successfully");

		return "signin";
	}
}
