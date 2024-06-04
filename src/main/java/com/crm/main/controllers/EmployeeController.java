package com.crm.main.controllers;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crm.main.entity.CustomerEnquiry;
import com.crm.main.entity.CustomerFollowUps;
import com.crm.main.entity.Employee;
import com.crm.main.entity.Product;
import com.crm.main.entity.SellCourse;
import com.crm.main.model.CustomerEnquiryModel;
import com.crm.main.service.CustomerEnquiryService;
import com.crm.main.service.CustomerFollowUpsService;
import com.crm.main.service.ProductService;
import com.crm.main.service.SellCourseService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/emp")
public class EmployeeController {
	public static final int PAGE_SIZE = 5;
	public static final int ANOTHER_PAGE_SIZE = 10;

	@Autowired
	ProductService productService;

	@Autowired
	CustomerEnquiryService customerEnquiryService;

	@Autowired
	CustomerFollowUpsService customerFollowUpsService;

	@Autowired
	SellCourseService sellCourseService;

	@GetMapping("/profile")
	public String openEmployeeProfilePage() {
		return "employee-profile";
	}

	@GetMapping("/")
	public String openEmployeeDashboardPagee(Model model) {
		List<Object[]> courseSaleCount = sellCourseService.getSellCourseCountService();
		List<Object[]> customerFollowUpsDateCount = customerFollowUpsService.getCustomerFollowUpsDateCountService();
		List<Object[]> customerEnquriesDateCount = customerEnquiryService.getCustomerEnquriesDateCountService();

		model.addAttribute("model_courseSellCountEmp", courseSaleCount);
		model.addAttribute("model_customerFollowUpsDateCountEmp", customerFollowUpsDateCount);
		model.addAttribute("model_customerEnquiresDateCountEmp", customerEnquriesDateCount);

		return "employee-dashboard";
	}

	@GetMapping("/dashboard")
	public String openEmployeeDashboardPage(Model model) {
		List<Object[]> courseSaleCount = sellCourseService.getSellCourseCountService();
		List<Object[]> customerFollowUpsDateCount = customerFollowUpsService.getCustomerFollowUpsDateCountService();
		List<Object[]> customerEnquriesDateCount = customerEnquiryService.getCustomerEnquriesDateCountService();

		model.addAttribute("model_courseSellCountEmp", courseSaleCount);
		model.addAttribute("model_customerFollowUpsDateCountEmp", customerFollowUpsDateCount);
		model.addAttribute("model_customerEnquiresDateCountEmp", customerEnquriesDateCount);

		return "employee-dashboard";
	}

	@GetMapping("/changePass")
	public String openChangePasswordPage() {
		return "change-password";
	}

	@GetMapping("/customerEnquiry")
	public String openCustomerEnquiryPage(Model model,
			@RequestParam(name = "redirect_success", required = false) String success,
			@RequestParam(name = "redirect_error", required = false) String error) {
		List<String> courseNameList = productService.getAllCourseNameService();

		model.addAttribute("model_courseName_list", courseNameList);

		model.addAttribute("modelCustomerEnquiryAttr", new CustomerEnquiryModel());

		model.addAttribute("model_success", success);
		model.addAttribute("model_error", error);

		return "customer-enquiry";
	}

	@PostMapping("/customerEnquiryForm")
	public String openCustomerEnquiryForm(HttpSession session,
			@ModelAttribute("modelCustomerEnquiryAttr") CustomerEnquiryModel customerEnquiryModel,
			RedirectAttributes redirectAttributes) {
		Random rand = new Random();
		long id = (long) (rand.nextDouble() * 1000000000000000L);
		String enquiryId = "ENQ" + id;

		LocalDate date = LocalDate.now();
		String enquiryDate = date.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));

		LocalTime time = LocalTime.now();
		String enquiryTime = time.format(DateTimeFormatter.ofPattern("HH:mm:ss"));

		Employee emp = (Employee) session.getAttribute("session_emp");
		String empId = null;

		if (emp != null) {
			empId = emp.getEmpId();
		}

		String customerPhoneNo = customerEnquiryModel.getCustomerPhoneNo();
		String customerName = customerEnquiryModel.getCustomerName();

		CustomerEnquiry customerEnquiry = customerEnquiryModel.getCustomerEnquiry();
		customerEnquiry.setEnquiryId(enquiryId);
		customerEnquiry.setCustomerPhoneNo(customerPhoneNo);
		customerEnquiry.setCustomerName(customerName);
		customerEnquiry.setEnquiryDate(enquiryDate);
		customerEnquiry.setEnquiryTime(enquiryTime);
		customerEnquiry.setEmpId(empId);

		CustomerFollowUps customerFollowUps = customerEnquiryModel.getCustomerFollowUps();
		customerFollowUps.setCustomerPhoneNo(customerPhoneNo);
		customerFollowUps.setCustomerName(customerName);

		if (!customerFollowUps.getFollowUpsDate().isEmpty()) {
			DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String inputString = customerFollowUps.getFollowUpsDate();
			LocalDate date1 = LocalDate.parse(inputString, inputFormatter);
			DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			String outputString = date1.format(outputFormatter);

			customerFollowUps.setFollowUpsDate(outputString);
		}

		boolean status1 = customerEnquiryService.addCustomerEnquiryService(customerEnquiry);

		if (status1) {
			boolean status2 = customerFollowUpsService.addCustomerFollowUpsDateService(customerFollowUps);

			if (status2) {
				redirectAttributes.addAttribute("redirect_success", "Hurray! Customer enquiry added successfully");
			} else {
				redirectAttributes.addAttribute("redirect_error", "Oops! Customer enquiry not added");
			}
		} else {
			redirectAttributes.addAttribute("redirect_error", "Oops! Customer enquiry not added");
		}

		return "redirect:/emp/customerEnquiry";
	}

	@GetMapping("/checkPhoneNoAvailability")
	@ResponseBody
	public String openCheckPhoneNoAvailability(@RequestParam("phoneNo") String phoneNo) {
		boolean status = customerEnquiryService.isPhoneNoExistsService(phoneNo);

		if (status) {
			return "exist";
		}

		return "not_exist";
	}

	@GetMapping("/customerEnquiryHistory")
	public String openCustomerEnquiryHistoryPage(@RequestParam("phone_no") String customerPhoneNo, Model model,
			@RequestParam(defaultValue = "1") int page) {
		List<CustomerEnquiry> customerEnquiryList = customerEnquiryService
				.getAllCustomerEnquiryHistoryService(customerPhoneNo);

		model.addAttribute("modelCustomerEnquiryAttr", new CustomerEnquiryModel());

		List<String> courseNameList = productService.getAllCourseNameService();

		model.addAttribute("model_courseName_list", courseNameList);

		// Pagination
		int TOTAL_PRODUCTS = customerEnquiryList.size();

		int TOTAL_PAGES = (int) Math.ceil((double) TOTAL_PRODUCTS / ANOTHER_PAGE_SIZE);

		int LIST_START_INDEX = (page - 1) * ANOTHER_PAGE_SIZE;
		int LIST_LAST_INDEX = Math.min(LIST_START_INDEX + ANOTHER_PAGE_SIZE, TOTAL_PRODUCTS);

		List<CustomerEnquiry> newCustomerEnquiryList = customerEnquiryList.subList(LIST_START_INDEX, LIST_LAST_INDEX);

		model.addAttribute("model_customerEnquiryHistory_list", newCustomerEnquiryList);
		model.addAttribute("model_total_pages", TOTAL_PAGES);
		model.addAttribute("model_current_page", page);

		return "customer-enquiry-history";
	}

	@PostMapping("/customerEnquiryFormm")
	public String openCustomerEnquiryFormm(HttpSession session,
			@ModelAttribute("modelCustomerEnquiryAttr") CustomerEnquiryModel customerEnquiryModel, Model model,
			@RequestParam(defaultValue = "1") int page) {
		Random rand = new Random();
		long id = (long) (rand.nextDouble() * 1000000000000000L);
		String enquiryId = "ENQ" + id;

		LocalDate date = LocalDate.now();
		String enquiryDate = date.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));

		LocalTime time = LocalTime.now();
		String enquiryTime = time.format(DateTimeFormatter.ofPattern("HH:mm:ss"));

		Employee emp = (Employee) session.getAttribute("session_emp");
		String empId = null;

		if (emp != null) {
			empId = emp.getEmpId();
		}

		String customerPhoneNo = customerEnquiryModel.getCustomerPhoneNo();
		String customerName = customerEnquiryModel.getCustomerName();

		CustomerEnquiry customerEnquiry = customerEnquiryModel.getCustomerEnquiry();
		customerEnquiry.setEnquiryId(enquiryId);
		customerEnquiry.setCustomerPhoneNo(customerPhoneNo);
		customerEnquiry.setCustomerName(customerName);
		customerEnquiry.setEnquiryDate(enquiryDate);
		customerEnquiry.setEnquiryTime(enquiryTime);
		customerEnquiry.setEmpId(empId);

		CustomerFollowUps customerFollowUps = customerEnquiryModel.getCustomerFollowUps();
		customerFollowUps.setCustomerPhoneNo(customerPhoneNo);
		customerFollowUps.setCustomerName(customerName);

		if (!customerFollowUps.getFollowUpsDate().isEmpty()) {
			DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String inputString = customerFollowUps.getFollowUpsDate();
			LocalDate date1 = LocalDate.parse(inputString, inputFormatter);
			DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			String outputString = date1.format(outputFormatter);

			customerFollowUps.setFollowUpsDate(outputString);
		}

		boolean status1 = customerEnquiryService.addCustomerEnquiryService(customerEnquiry);

		if (status1) {
			boolean status2 = customerFollowUpsService.addCustomerFollowUpsDateService(customerFollowUps);

			if (status2) {
				model.addAttribute("model_success", "Hurray! Customer enquiry added successfully");
			} else {
				model.addAttribute("model_error", "Oops! Customer enquiry not added");
			}
		} else {
			model.addAttribute("model_error", "Oops! Customer enquiry not added");
		}

		List<CustomerEnquiry> customerEnquiryList = customerEnquiryService
				.getAllCustomerEnquiryHistoryService(customerPhoneNo);

		model.addAttribute("modelCustomerEnquiryAttr", new CustomerEnquiryModel());

		List<String> courseNameList = productService.getAllCourseNameService();

		model.addAttribute("model_courseName_list", courseNameList);

		// Pagination
		int TOTAL_PRODUCTS = customerEnquiryList.size();
		int TOTAL_PAGES = (int) Math.ceil((double) TOTAL_PRODUCTS / ANOTHER_PAGE_SIZE);

		int LIST_START_INDEX = (page - 1) * ANOTHER_PAGE_SIZE;
		int LIST_LAST_INDEX = Math.min(LIST_START_INDEX + ANOTHER_PAGE_SIZE, TOTAL_PRODUCTS);

		List<CustomerEnquiry> newCustomerEnquiryList = customerEnquiryList.subList(LIST_START_INDEX, LIST_LAST_INDEX);

		model.addAttribute("model_customerEnquiryHistory_list", newCustomerEnquiryList);
		model.addAttribute("model_total_pages", TOTAL_PAGES);
		model.addAttribute("model_current_page", page);

		return "customer-enquiry-history";
	}

	@GetMapping("/getCustomerNameUsingPhoneNo")
	@ResponseBody
	public String openGetCustomerNameUsingPhoneNo(@RequestParam("phoneNo") String phoneNo) {
		String customerName = null;

		if (phoneNo.length() == 10) {
			List<CustomerEnquiry> customerEnquiryList = customerEnquiryService
					.getAllCustomerEnquiryHistoryService(phoneNo);

			if (!customerEnquiryList.isEmpty()) {
				customerName = customerEnquiryList.get(0).getCustomerName();
			} else {
				customerName = "";
			}
		}

		return customerName;
	}

	@GetMapping("/sellCourse")
	public String openSellCoursePage(Model model,
			@RequestParam(name = "redirect_success", required = false) String success,
			@RequestParam(name = "redirect_error", required = false) String error) {
		List<String> courseNameList = productService.getAllCourseNameService();

		model.addAttribute("model_courseName_list", courseNameList);

		model.addAttribute("modelSellCourseAttr", new SellCourse());

		model.addAttribute("model_success", success);
		model.addAttribute("model_error", error);

		return "sell-course";
	}

	@GetMapping("/getCoursePrices")
	@ResponseBody
	public Product openGetCoursePrices(@RequestParam("course_name") String courseName) {
		return productService.getSelectedCourseDetailsService(courseName);
	}

	@PostMapping("/sellCourseForm")
	public String openSellCourseForm(@ModelAttribute("modelSellCourseAttr") SellCourse sellCourse, HttpSession session,
			RedirectAttributes redirectAttributes) {
		Random rand = new Random();
		long id = (long) (rand.nextDouble() * 1000000000000000L);
		String sellId = "ORD" + id;

		LocalDate date = LocalDate.now();
		String sellDate = date.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));

		LocalTime time = LocalTime.now();
		String sellTime = time.format(DateTimeFormatter.ofPattern("HH:mm:ss"));

		Product product = productService.getSelectedCourseDetailsService(sellCourse.getCourseName());
		Double sellCourseOriginalPrice = 0.0;
		Double sellCourseSalePrice = 0.0;
		Double sellCourseDiscountedPercentage = 0.0;
		String sellCourseImage = null;

		if (product != null) {
			sellCourseOriginalPrice = product.getCourseOriginalPrice();
			sellCourseSalePrice = product.getCourseSalePrice();
			sellCourseDiscountedPercentage = product.getCourseDiscountedPercentage();
			sellCourseImage = product.getCourseImage();
		}

		Employee emp = (Employee) session.getAttribute("session_emp");
		String empEmail = null;
		String empName = null;

		if (emp != null) {
			empName = emp.getName();
			empEmail = emp.getEmail();
		}

		sellCourse.setSellId(sellId);
		sellCourse.setSellDate(sellDate);
		sellCourse.setSellTime(sellTime);

		sellCourse.setCourseOriginalPrice(sellCourseOriginalPrice);
		sellCourse.setCourseSalePrice(sellCourseSalePrice);
		sellCourse.setCourseDiscountedPercentage(sellCourseDiscountedPercentage);
		sellCourse.setCourseImage(sellCourseImage);

		sellCourse.setEmpName(empName);
		sellCourse.setEmpEmail(empEmail);

		if (sellCourse.getCustomerPhoneNo() != "" && sellCourse.getCustomerPhoneNo().length() == 10
				&& sellCourse.getCustomerName() != "") {
			boolean status = sellCourseService.addSellCourseService(sellCourse);

			if (status) {
				redirectAttributes.addAttribute("redirect_success", "Hurray! Course Sell successfully");
			} else {
				redirectAttributes.addAttribute("redirect_error", "Oops! Course not sell successfully");
			}
		} else {
			redirectAttributes.addAttribute("redirect_error", "Oops! Please enter correct value");
		}

		return "redirect:/emp/sellCourse";
	}

	@GetMapping("/customerFollowUps")
	public String openCustomerFollowUpsPage(@RequestParam(name = "selectedDate", required = false) String selectedDate,
			Model model, @RequestParam(defaultValue = "1") int page) {
		if (selectedDate == null) {
			LocalDate localDate = LocalDate.now();
			selectedDate = localDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
		}

		List<CustomerFollowUps> customerFollowUpsList = customerFollowUpsService
				.getFollowUpsForProvidedDateService(selectedDate);

		// Pagination
		int TOTAL_PRODUCTS = customerFollowUpsList.size();

		int TOTAL_PAGES = (int) Math.ceil((double) TOTAL_PRODUCTS / ANOTHER_PAGE_SIZE);

		int LIST_START_INDEX = (page - 1) * ANOTHER_PAGE_SIZE;
		int LIST_LAST_INDEX = Math.min(LIST_START_INDEX + ANOTHER_PAGE_SIZE, TOTAL_PRODUCTS);

		List<CustomerFollowUps> newCustomerFollowUpsList = customerFollowUpsList.subList(LIST_START_INDEX,
				LIST_LAST_INDEX);

		model.addAttribute("model_follow_ups", newCustomerFollowUpsList);
		model.addAttribute("model_total_pages", TOTAL_PAGES);
		model.addAttribute("model_current_page", page);

		return "customer-followups";
	}

	@GetMapping("/totalSell")
	public String openEmpTotalSellCoursePage(HttpSession session, Model model,
			@RequestParam(defaultValue = "1") int page) {
		Employee emp = (Employee) session.getAttribute("session_emp");
		String empEmail = null;

		if (emp != null) {
			empEmail = emp.getEmail();
		}

		List<SellCourse> sellCourseList = sellCourseService.getAllSellCourseByEmployeeEmailService(empEmail);

		int TOTAL_PRODUCTS = sellCourseList.size();
		int TOTAL_PAGES = (int) Math.ceil((double) TOTAL_PRODUCTS / PAGE_SIZE);

		int LIST_START_INDEX = (page - 1) * PAGE_SIZE;
		int LIST_LAST_INDEX = Math.min(LIST_START_INDEX + PAGE_SIZE, TOTAL_PRODUCTS);

		List<SellCourse> newSellCourseList = sellCourseList.subList(LIST_START_INDEX, LIST_LAST_INDEX);

		model.addAttribute("model_sell_course_list", newSellCourseList);
		model.addAttribute("model_total_pages", TOTAL_PAGES);
		model.addAttribute("model_current_page", page);

		return "total-sell-employee";
	}
}
