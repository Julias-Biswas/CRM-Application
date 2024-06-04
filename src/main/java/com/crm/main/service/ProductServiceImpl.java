package com.crm.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.main.entity.Product;
import com.crm.main.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductRepository productRepository;

	@Override
	public boolean addProductService(Product product) {
		boolean status = false;

		try {
			productRepository.save(product);
			status = true;
		} catch (Exception e) {
			status = false;
			e.printStackTrace();
		}

		return status;
	}

	@Override
	public List<Product> getAllProductsService() {
		return productRepository.findAll();
	}

	@Override
	public Product getProductDetailsService(String courseId) {
		return productRepository.findByCourseId(courseId);
	}

	@Override
	public List<String> getAllCourseNameService() {
		return productRepository.findCourseName();
	}

	@Override
	public Product getSelectedCourseDetailsService(String courseName) {
		return productRepository.findByCourseHeader(courseName);
	}
}
