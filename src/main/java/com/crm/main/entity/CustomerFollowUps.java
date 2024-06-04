package com.crm.main.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "customer_follow_ups")
public class CustomerFollowUps {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(unique = true, nullable = false, length = 10)
	private String customerPhoneNo;

	@Column(nullable = false, length = 50)
	private String customerName;

	@Column(nullable = false, length = 10)
	private String followUpsDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getFollowUpsDate() {
		return followUpsDate;
	}

	public void setFollowUpsDate(String followUpsDate) {
		this.followUpsDate = followUpsDate;
	}
}
