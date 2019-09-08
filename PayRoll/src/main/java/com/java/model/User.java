package com.java.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Employee")
public class User {

	
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="EmployeeID")
	private int employeeid;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="CONTACT_NUMBER")
	private String contact_number;
	
	@Id
	@Column(name="EMAIL")
	private String email;
	
	@Column(name="PASSWORD")
	private String password;
	
	@Column(name="USER_TYPE")
	private String user_type;
	
	


	


	public int getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(int employeeid) {
		this.employeeid = employeeid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContact_number() {
		return contact_number;
	}

	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}


	
	@Column(name="BASIC_SALARY")
	private Double basic_salary;







	public Double getBasic_salary() {
		return basic_salary;
	}

	public void setBasic_salary(Double basic_salary) {
		this.basic_salary = basic_salary;
	}
	
	
}
