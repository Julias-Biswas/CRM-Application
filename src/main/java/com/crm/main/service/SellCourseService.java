package com.crm.main.service;

import java.util.List;

import com.crm.main.entity.SellCourse;

public interface SellCourseService {
	public boolean addSellCourseService(SellCourse sellCourse);

	public List<Object[]> getSellCourseCountService();

	public List<SellCourse> getAllSellCourseService();
	
	public List<SellCourse> getAllSellCourseByEmployeeEmailService(String empEmail);
}
