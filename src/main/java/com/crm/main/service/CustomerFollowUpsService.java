package com.crm.main.service;

import java.util.List;

import com.crm.main.entity.CustomerFollowUps;

public interface CustomerFollowUpsService {
	public boolean addCustomerFollowUpsDateService(CustomerFollowUps customerFollowUps);
	
	public List<CustomerFollowUps> getFollowUpsForProvidedDateService(String date);
	
	public List<Object[]> getCustomerFollowUpsDateCountService();
}
