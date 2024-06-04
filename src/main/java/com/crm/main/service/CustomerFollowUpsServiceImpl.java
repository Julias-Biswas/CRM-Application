package com.crm.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.main.entity.CustomerFollowUps;
import com.crm.main.repository.CustomerFollowUpsRepository;

@Service
public class CustomerFollowUpsServiceImpl implements CustomerFollowUpsService {
	@Autowired
	CustomerFollowUpsRepository customerFollowUpsRepository;

	@Override
	public boolean addCustomerFollowUpsDateService(CustomerFollowUps customerFollowUps) {
		boolean status = false;

		try {
			CustomerFollowUps customerFollowUpsDB = customerFollowUpsRepository
					.findByCustomerPhoneNo(customerFollowUps.getCustomerPhoneNo());
			if (customerFollowUpsDB != null) {
				customerFollowUpsDB.setFollowUpsDate(customerFollowUps.getFollowUpsDate());
				customerFollowUpsRepository.save(customerFollowUpsDB);
			} else {
				customerFollowUpsRepository.save(customerFollowUps);
			}

			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}

		return status;
	}

	@Override
	public List<CustomerFollowUps> getFollowUpsForProvidedDateService(String date) {
		return customerFollowUpsRepository.findByFollowUpsDate(date);
	}
	
	@Override
	public List<Object[]> getCustomerFollowUpsDateCountService() {
		return customerFollowUpsRepository.countByFollowUpsDate();
	}

}
