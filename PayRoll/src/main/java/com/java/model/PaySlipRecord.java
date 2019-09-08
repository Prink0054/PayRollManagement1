package com.java.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="PaySlipRecord")
public class PaySlipRecord {

	@Id
	@GeneratedValue
	@Column(name="payslipID")
	private int payslipID;
	

	@Column(name="NAME")
	private String name;
	
	@OneToOne
	private User user;
	
	@Column(name="month")
	private String month;
	
	
	@Column(name="year")
	private Integer year;
	
	@Column(name="generatedOn")
	private String generatedOn;
	
	@Column(name="BasicSalary")
	private float BasicSalary;
	
	@Column(name="noofLeaves")
	private Integer noofLeaves;
	
	@Column(name="SalaryPerDay")
	private float salaryperday;
	
	@Column(name="deductionforLeaves")
	private float deductionforLeaves;
	
	@Column(name="netSalary")
	private float netSalary;
	
	
	
	
	public int getPayslipID() {
		return payslipID;
	}

	public void setPayslipID(int payslipID) {
		this.payslipID = payslipID;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getGeneratedOn() {
		return generatedOn;
	}

	public void setGeneratedOn(String generatedOn) {
		this.generatedOn = generatedOn;
	}

	public float getBasicSalary() {
		return BasicSalary;
	}

	public void setBasicSalary(float basicSalary) {
		BasicSalary = basicSalary;
	}

	public float getNoofLeaves() {
		return noofLeaves;
	}

	

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public void setNoofLeaves(Integer noofLeaves) {
		this.noofLeaves = noofLeaves;
	}


	public float getSalaryperday() {
		return salaryperday;
	}

	public void setSalaryperday(float salaryperday) {
		this.salaryperday = salaryperday;
	}

	public float getDeductionforLeaves() {
		return deductionforLeaves;
	}

	public void setDeductionforLeaves(float deductionforLeaves) {
		this.deductionforLeaves = deductionforLeaves;
	}

	public float getNetSalary() {
		return netSalary;
	}

	public void setNetSalary(float netSalary) {
		this.netSalary = netSalary;
	}

	private String nameOfMonth;




	public String getNameOfMonth() {
		return nameOfMonth;
	}

	public void setNameOfMonth(String nameOfMonth) {
		this.nameOfMonth = nameOfMonth;
	}
	

	
	
	
	
}
