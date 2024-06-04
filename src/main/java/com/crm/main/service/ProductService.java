package com.crm.main.service;

import java.util.List;

import com.crm.main.entity.Product;

public interface ProductService {
	public boolean addProductService(Product product);

	public List<Product> getAllProductsService();

	public Product getProductDetailsService(String courseId);

	public List<String> getAllCourseNameService();

	public Product getSelectedCourseDetailsService(String courseName);
}
