package com.crm.main.model;

import com.crm.main.entity.CustomerEnquiry;
import com.crm.main.entity.CustomerFollowUps;

public class CustomerEnquiryModel {
	private String customerPhoneNo;
	private String customerName;
	private CustomerEnquiry customerEnquiry;
	private CustomerFollowUps customerFollowUps;

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

	public CustomerEnquiry getCustomerEnquiry() {
		return customerEnquiry;
	}

	public void setCustomerEnquiry(CustomerEnquiry customerEnquiry) {
		this.customerEnquiry = customerEnquiry;
	}

	public CustomerFollowUps getCustomerFollowUps() {
		return customerFollowUps;
	}

	public void setCustomerFollowUps(CustomerFollowUps customerFollowUps) {
		this.customerFollowUps = customerFollowUps;
	}
}
