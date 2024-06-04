package com.crm.main.service;

import java.util.List;

import com.crm.main.entity.CustomerEnquiry;

public interface CustomerEnquiryService {
	public boolean addCustomerEnquiryService(CustomerEnquiry customerEnquiry);

	public boolean isPhoneNoExistsService(String phoneNo);

	public List<CustomerEnquiry> getAllCustomerEnquiryHistoryService(String customerPhoneNo);
	
	public List<Object[]> getCustomerEnquriesDateCountService();
}
