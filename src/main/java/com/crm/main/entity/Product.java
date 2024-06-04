package com.crm.main.entity;

import org.springframework.web.multipart.MultipartFile;

import com.crm.main.urls.OtherUrls;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "product")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(unique = true, nullable = false, length = 25)
	private String courseId;

	@Column(unique = true, nullable = false)
	private String courseHeader;

	@Column(nullable = false)
	private String courseTitle;

	@Column(nullable = false, columnDefinition = "TEXT")
	private String courseSyllabus;

	@Column(nullable = false)
	private Double courseOriginalPrice;

	@Column(nullable = false)
	private Double courseSalePrice;

	@Column(nullable = false)
	private Double courseDiscountedPercentage;

	@Column(nullable = false)
	private Integer courseValidity;

	@Column(name = "course_img_url", nullable = false)
	private String courseImage;

	@Column(nullable = false, length = 50)
	private String trainerName;

	@Column(nullable = false, columnDefinition = "TEXT")
	private String trainerDetails;

	@Column(name = "trainer_img_url", nullable = false)
	private String trainerImage;

	@Column(columnDefinition = "TEXT")
	private String otherDetails;

	@Column(nullable = false, length = 10)
	private String coursePostedDate;

	private double courseRating;
	private int courseRatingByUserNumber;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public String getCourseHeader() {
		return courseHeader;
	}

	public void setCourseHeader(String courseHeader) {
		this.courseHeader = courseHeader;
	}

	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}

	public String getCourseSyllabus() {
		return courseSyllabus;
	}

	public void setCourseSyllabus(String courseSyllabus) {
		this.courseSyllabus = courseSyllabus;
	}

	public Double getCourseOriginalPrice() {
		return courseOriginalPrice;
	}

	public void setCourseOriginalPrice(Double courseOriginalPrice) {
		this.courseOriginalPrice = courseOriginalPrice;
	}

	public Double getCourseSalePrice() {
		return courseSalePrice;
	}

	public void setCourseSalePrice(Double courseSalePrice) {
		this.courseSalePrice = courseSalePrice;
	}

	public Double getCourseDiscountedPercentage() {
		return courseDiscountedPercentage;
	}

	public void setCourseDiscountedPercentage(Double courseDiscountedPercentage) {
		this.courseDiscountedPercentage = courseDiscountedPercentage;
	}

	public Integer getCourseValidity() {
		return courseValidity;
	}

	public void setCourseValidity(Integer courseValidity) {
		this.courseValidity = courseValidity;
	}

	public String getCourseImage() {
		return courseImage;
	}

	public void setCourseImage(MultipartFile file) {
		this.courseImage = OtherUrls.IMAGE_UPLOAD_URL + file.getOriginalFilename();
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public String getTrainerDetails() {
		return trainerDetails;
	}

	public void setTrainerDetails(String trainerDetails) {
		this.trainerDetails = trainerDetails;
	}

	public String getTrainerImage() {
		return trainerImage;
	}

	public void setTrainerImage(MultipartFile file) {
		this.trainerImage = OtherUrls.IMAGE_UPLOAD_URL + file.getOriginalFilename();
	}

	public String getOtherDetails() {
		return otherDetails;
	}

	public void setOtherDetails(String otherDetails) {
		this.otherDetails = otherDetails;
	}

	public String getCoursePostedDate() {
		return coursePostedDate;
	}

	public void setCoursePostedDate(String coursePostedDate) {
		this.coursePostedDate = coursePostedDate;
	}

	public double getCourseRating() {
		return courseRating;
	}

	public void setCourseRating(double courseRating) {
		this.courseRating = courseRating;
	}

	public int getCourseRatingByUserNumber() {
		return courseRatingByUserNumber;
	}

	public void setCourseRatingByUserNumber(int courseRatingByUserNumber) {
		this.courseRatingByUserNumber = courseRatingByUserNumber;
	}
}
