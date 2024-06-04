package com.crm.main.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "sell_course")
public class SellCourse {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(unique = true, nullable = false, length = 25)
	private String sellId;

	@Column(nullable = false, length = 10)
	private String customerPhoneNo;

	@Column(nullable = false, length = 50)
	private String customerName;

	@Column(nullable = false)
	private String courseName;

	@Column(nullable = false)
	private Double courseOriginalPrice;

	@Column(nullable = false)
	private Double courseSalePrice;

	@Column(nullable = false)
	private Double courseDiscountedPercentage;

	@Column(nullable = false)
	private String courseImage;

	@Column(nullable = false, length = 50)
	private String empName;

	@Column(nullable = false, length = 50)
	private String empEmail;

	@Column(nullable = false)
	private String sellDate;

	@Column(nullable = false, length = 10)
	private String sellTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSellId() {
		return sellId;
	}

	public void setSellId(String sellId) {
		this.sellId = sellId;
	}

	public String getCustomerPhoneNo() {
		return customerPhoneNo;
	}

	public void setCustomerPhoneNo(String customerPhoneNo) {
		this.customerPhoneNo = customerPhoneNo;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public Double getCourseOriginalPrice() {
		return courseOriginalPrice;
	}

	public void setCourseOriginalPrice(Double courseOriginalPrice) {
		this.courseOriginalPrice = courseOriginalPrice;
	}

	public Double getCourseSalePrice() {
		return courseSalePrice;
	}

	public void setCourseSalePrice(Double courseSalePrice) {
		this.courseSalePrice = courseSalePrice;
	}

	public Double getCourseDiscountedPercentage() {
		return courseDiscountedPercentage;
	}

	public void setCourseDiscountedPercentage(Double courseDiscountedPercentage) {
		this.courseDiscountedPercentage = courseDiscountedPercentage;
	}

	public String getCourseImage() {
		return courseImage;
	}

	public void setCourseImage(String courseImage) {
		this.courseImage = courseImage;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getSellDate() {
		return sellDate;
	}

	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
	}

	public String getSellTime() {
		return sellTime;
	}

	public void setSellTime(String sellTime) {
		this.sellTime = sellTime;
	}
}
