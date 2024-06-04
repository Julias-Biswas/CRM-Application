package com.crm.main.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "customer_enquiry")
public class CustomerEnquiry {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(unique = true, nullable = false, length = 25)
	private String enquiryId;

	@Column(nullable = false, length = 10)
	private String customerPhoneNo;

	@Column(nullable = false, length = 50)
	private String customerName;

	@Column(nullable = true, length = 50)
	private String customerEmail;

	@Column(nullable = false)
	private String interestedCourse;

	@Column(nullable = false, columnDefinition = "TEXT")
	private String discussion;

	@Column(nullable = false, length = 50)
	private String enquiryType;

	@Column(nullable = false, length = 1)
	private String status;

	@Column(nullable = false, length = 50)
	private String callTo;

	@Column(nullable = false, length = 10)
	private String enquiryDate;

	@Column(nullable = false, length = 10)
	private String enquiryTime;

	@Column(nullable = false, length = 25)
	private String empId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(String enquiryId) {
		this.enquiryId = enquiryId;
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

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getInterestedCourse() {
		return interestedCourse;
	}

	public void setInterestedCourse(String interestedCourse) {
		this.interestedCourse = interestedCourse;
	}

	public String getDiscussion() {
		return discussion;
	}

	public void setDiscussion(String discussion) {
		this.discussion = discussion;
	}

	public String getEnquiryType() {
		return enquiryType;
	}

	public void setEnquiryType(String enquiryType) {
		this.enquiryType = enquiryType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCallTo() {
		return callTo;
	}

	public void setCallTo(String callTo) {
		this.callTo = callTo;
	}

	public String getEnquiryDate() {
		return enquiryDate;
	}

	public void setEnquiryDate(String enquiryDate) {
		this.enquiryDate = enquiryDate;
	}

	public String getEnquiryTime() {
		return enquiryTime;
	}

	public void setEnquiryTime(String enquiryTime) {
		this.enquiryTime = enquiryTime;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}
}
