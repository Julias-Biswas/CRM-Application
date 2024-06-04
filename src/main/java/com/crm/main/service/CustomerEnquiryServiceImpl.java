package com.crm.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.main.entity.CustomerEnquiry;
import com.crm.main.repository.CustomerEnquiryRepository;

@Service
public class CustomerEnquiryServiceImpl implements CustomerEnquiryService {
	@Autowired
	CustomerEnquiryRepository customerEnquiryRepository;

	@Override
	public boolean addCustomerEnquiryService(CustomerEnquiry customerEnquiry) {
		boolean status = false;

		try {
			customerEnquiryRepository.save(customerEnquiry);
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}

		return status;
	}

	@Override
	public boolean isPhoneNoExistsService(String phoneNo) {
		return customerEnquiryRepository.existsByCustomerPhoneNo(phoneNo);
	}

	@Override
	public List<CustomerEnquiry> getAllCustomerEnquiryHistoryService(String customerPhoneNo) {
		return customerEnquiryRepository.findAllByCustomerPhoneNo(customerPhoneNo);
	}

	@Override
	public List<Object[]> getCustomerEnquriesDateCountService() {
		return customerEnquiryRepository.countByCustomerEnquriesDate();
	}
}
