package com.crm.main.controllers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crm.main.entity.Employee;
import com.crm.main.entity.Product;
import com.crm.main.entity.SellCourse;
import com.crm.main.service.CustomerEnquiryService;
import com.crm.main.service.CustomerFollowUpsService;
import com.crm.main.service.EmployeeService;
import com.crm.main.service.ProductService;
import com.crm.main.service.SellCourseService;
import com.crm.main.urls.OtherUrls;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminController {
	public static final int PAGE_SIZE = 5;
	public static final int ANOTHER_PAGE_SIZE = 10;

	@Autowired
	EmployeeService empService;

	@Autowired
	ProductService productService;

	@Autowired
	SellCourseService sellCourseService;

	@Autowired
	CustomerEnquiryService customerEnquiryService;

	@Autowired
	CustomerFollowUpsService customerFollowUpsService;

	@GetMapping("/profile")
	public String openAdminProfilePage() {
		return "admin-profile";
	}

	@GetMapping("/")
	public String openAdminDashboardPagee(Model model) {
		List<Object[]> courseSaleCount = sellCourseService.getSellCourseCountService();
		List<Object[]> customerFollowUpsDateCount = customerFollowUpsService.getCustomerFollowUpsDateCountService();
		List<Object[]> customerEnquriesDateCount = customerEnquiryService.getCustomerEnquriesDateCountService();

		model.addAttribute("model_courseSellCountAdmin", courseSaleCount);
		model.addAttribute("model_customerFollowUpsDateCountAdmin", customerFollowUpsDateCount);
		model.addAttribute("model_customerEnquiresDateCountAdmin", customerEnquriesDateCount);

		return "admin-dashboard";
	}

	@GetMapping("/dashboard")
	public String openAdminDashboardPage(Model model) {
		List<Object[]> courseSaleCount = sellCourseService.getSellCourseCountService();
		List<Object[]> customerFollowUpsDateCount = customerFollowUpsService.getCustomerFollowUpsDateCountService();
		List<Object[]> customerEnquriesDateCount = customerEnquiryService.getCustomerEnquriesDateCountService();

		model.addAttribute("model_courseSellCountAdmin", courseSaleCount);
		model.addAttribute("model_customerFollowUpsDateCountAdmin", customerFollowUpsDateCount);
		model.addAttribute("model_customerEnquiresDateCountAdmin", customerEnquriesDateCount);

		return "admin-dashboard";
	}

	@GetMapping("/changePass")
	public String openChangePasswordPage() {
		return "change-password";
	}

	@GetMapping("/addEmp")
	public String openAddEmployeePage(Model model) {
		model.addAttribute("modelEmpAttr", new Employee());

		return "add-employee";
	}

	@GetMapping("/empList")
	public String openEmployeesListPage(@RequestParam(name = "redirectAttr_success", required = false) String success,
			@RequestParam(name = "redirectAttr_error", required = false) String error, Model model,
			@RequestParam(defaultValue = "1") int page) {
		List<Employee> empList = empService.getAllEmployeeService("Employee");

		int TOTAL_PRODUCTS = empList.size();
		int TOTAL_PAGES = (int) Math.ceil((double) TOTAL_PRODUCTS / ANOTHER_PAGE_SIZE);

		int LIST_START_INDEX = (page - 1) * ANOTHER_PAGE_SIZE;
		int LIST_LAST_INDEX = Math.min(LIST_START_INDEX + ANOTHER_PAGE_SIZE, TOTAL_PRODUCTS);

		List<Employee> newEmpList = empList.subList(LIST_START_INDEX, LIST_LAST_INDEX);

		model.addAttribute("model_emp_list", newEmpList);
		model.addAttribute("model_total_pages", TOTAL_PAGES);
		model.addAttribute("model_current_page", page);

		model.addAttribute("model_success", success);
		model.addAttribute("model_error", error);

		return "employees-list";
	}

	@PostMapping("/addEmpForm")
	public String openAddEmployeeForm(@Valid @ModelAttribute("modelEmpAttr") Employee emp, BindingResult br,
			Model model) {
		if (!emp.getPassword().equals(emp.getRePassword())) {
			model.addAttribute("model_error", "Oops! Password didn't matched");
		} else {
			Random rand = new Random();
			long id = (long) (rand.nextDouble() * 10000000000L);
			String empId = "EMP" + id;

			SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy");
			String joiningDate = ft.format(new Date());

			emp.setEmpId(empId);
			emp.setProfilePic(OtherUrls.IMAGE_UPLOAD_URL + "profile-pic.png");
			emp.setJoiningDate(joiningDate);
			emp.setModule("Employee");

			if (!br.hasErrors()) {
				boolean status = empService.addEmployeeService(emp);

				if (status) {
					model.addAttribute("model_success", "Hurray! Employee added successfully");
				} else {
					model.addAttribute("model_error", "Oops! Employee not added");
				}

				emp.setName("");
				emp.setEmail("");
				emp.setPassword("");
				emp.setRePassword("");
				emp.setPhoneNo("");
			}
		}

		return "add-employee";
	}

	@GetMapping("/deleteEmp")
	public String openDeleteEmployee(@RequestParam("emp_id") String empId, RedirectAttributes redirectAttributes) {
		boolean status = empService.deleteEmployeeService(empId);

		if (status) {
			redirectAttributes.addAttribute("redirectAttr_success", "Hurray! Employee deleted successfully");
		} else {
			redirectAttributes.addAttribute("redirectAttr_error", "Oops! Employee not deleted");
		}

		return "redirect:/admin/empList";
	}

	@GetMapping("/editEmp")
	public String openEditEmployeePage(@RequestParam("emp_id") String empId, Model model) {
		Employee emp = empService.searchByEmpIdService(empId);

		model.addAttribute("modelEmpAttr", new Employee());
		model.addAttribute("model_emp", emp);

		return "edit-employee";
	}

	@PostMapping("/updateEmpForm")
	public String openUpdateEmployeeForm(@Valid @ModelAttribute("modelEmpAttr") Employee emp, BindingResult br,
			Model model) {
		if (!emp.getPassword().equals(emp.getRePassword())) {
			model.addAttribute("model_error", "Oops! Password didn't matched");
		} else {
			if (!br.hasErrors()) {
				Employee existingEmp = empService.searchByEmpIdService(emp.getEmpId());

				existingEmp.setName(emp.getName());
				existingEmp.setPassword(emp.getPassword());
				existingEmp.setPhoneNo(emp.getPhoneNo());

				boolean status = empService.updateEmployeeService(existingEmp);

				if (status) {
					model.addAttribute("model_success", "Hurray! Employee updated successfully");
				} else {
					model.addAttribute("model_error", "Oops! Employee not updated");
				}
			}
		}

		return "edit-employee";
	}

	@GetMapping("/addProducts")
	public String openAddProductsPage(Model model,
			@RequestParam(name = "redirectAttr_success", required = false) String success,
			@RequestParam(name = "redirectAttr_error", required = false) String error) {
		model.addAttribute("modelProductAttr", new Product());

		model.addAttribute("model_success", success);
		model.addAttribute("model_error", error);

		return "add-products";
	}

	@PostMapping("/addCourseForm")
	public String openAddCourseForm(@Valid @ModelAttribute("modelProductAttr") Product product,
			@RequestParam("courseImage") MultipartFile courseImg,
			@RequestParam("trainerImage") MultipartFile trainerImg, RedirectAttributes redirectAttributes,
			BindingResult br) {
		boolean status1 = saveUploadedImage(courseImg);
		if (!status1) {
			System.out.println("Course image not uploaded");
		}

		boolean status2 = saveUploadedImage(trainerImg);
		if (!status2) {
			System.out.println("Trainer image not uploaded");
		}

		Random rand = new Random();
		long id = (long) (rand.nextDouble() * 1000000000000000L);
		String courseId = "PROD" + id;

		Double originalPrice = product.getCourseOriginalPrice();
		Double salePrice = product.getCourseSalePrice();

		Double totalDiscountedPrice = originalPrice - salePrice;
		Double discount = totalDiscountedPrice / originalPrice;
		Double discountedPercentage = discount * 100;

		SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy");
		String coursePostedDate = ft.format(new Date());

		product.setCourseId(courseId);
		product.setCourseDiscountedPercentage(discountedPercentage);
		product.setCoursePostedDate(coursePostedDate);

		if (!br.hasErrors()) {
			boolean status = productService.addProductService(product);

			if (status) {
				redirectAttributes.addAttribute("redirectAttr_success", "Hurray! Product added successfully");
			} else {
				redirectAttributes.addAttribute("redirectAttr_error", "Oops! Product not added");
			}
		}

		return "redirect:/admin/addProducts";
	}

	private boolean saveUploadedImage(MultipartFile file) {
		boolean status = false;

		try {
			String fileName = file.getOriginalFilename();
			Path filePath = Paths.get(OtherUrls.IMAGE_UPLOAD_FOLDER, fileName);
			Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}

		return status;
	}

	@GetMapping("/productsList")
	public String openProductsListPage(Model model, @RequestParam(defaultValue = "1") int page) {
		List<Product> productsList = productService.getAllProductsService();

		int TOTAL_PRODUCTS = productsList.size();
		int TOTAL_PAGES = (int) Math.ceil((double) TOTAL_PRODUCTS / PAGE_SIZE);

		int LIST_START_INDEX = (page - 1) * PAGE_SIZE;
		int LIST_LAST_INDEX = Math.min(LIST_START_INDEX + PAGE_SIZE, TOTAL_PRODUCTS);

		List<Product> newProductsList = productsList.subList(LIST_START_INDEX, LIST_LAST_INDEX);

		model.addAttribute("model_products_list", newProductsList);
		model.addAttribute("model_total_pages", TOTAL_PAGES);
		model.addAttribute("model_current_page", page);

		return "products-list";
	}

	@GetMapping("/courseDetails")
	public String openCourseDetailsPage(@RequestParam("course_id") String courseId, Model model) {
		Product product = productService.getProductDetailsService(courseId);

		model.addAttribute("model_product", product);

		return "course-details";
	}

	@GetMapping("/totalSell")
	public String openTotalSellPage(Model model, @RequestParam(defaultValue = "1") int page) {
		List<SellCourse> sellCourseList = sellCourseService.getAllSellCourseService();

		int TOTAL_PRODUCTS = sellCourseList.size();
		int TOTAL_PAGES = (int) Math.ceil((double) TOTAL_PRODUCTS / PAGE_SIZE);

		int LIST_START_INDEX = (page - 1) * PAGE_SIZE;
		int LIST_LAST_INDEX = Math.min(LIST_START_INDEX + PAGE_SIZE, TOTAL_PRODUCTS);

		List<SellCourse> newSellCourseList = sellCourseList.subList(LIST_START_INDEX, LIST_LAST_INDEX);

		model.addAttribute("model_sell_course_list", newSellCourseList);
		model.addAttribute("model_total_pages", TOTAL_PAGES);
		model.addAttribute("model_current_page", page);

		return "total-sell-admin";
	}
}
