package com.crm.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CrmProjectApplication {
	public static void main(String[] args) {
		SpringApplication.run(CrmProjectApplication.class, args);
		System.out.println("---------- Project Run Successfully ----------");
	}
}
