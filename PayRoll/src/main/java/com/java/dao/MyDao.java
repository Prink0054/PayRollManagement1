package com.java.dao;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import com.java.model.MessageRecord;
import com.java.model.PaySlipRecord;
import com.java.model.User;

public interface MyDao {

	User checkLogin(String email, String password);
	void logout();
	List<User> getall();
	
	
	
	List<PaySlipRecord> getal();
	
	List<MessageRecord> getallRecord();
	
	void updateUser(User user, String email);
	
	
	void deleteMessage(int id);
	void save(User user);
	void deleteUser(String email );
	void deletePaySlip(int id);
	
	void saveMessage(User from, User to, String msgBody);
	

	
	User user(String email);
	
	//Outbox list
	@Transactional
	List<MessageRecord> sendList(String from);
	
	List<MessageRecord> recivedList(String from);
	
	public void save(PaySlipRecord record);
	public int getdaysInMonth(int day, int year);
	public String MonthName(int monthVal);
	public Float salaryPerDay(Float basicSalary, int days);
	public Float salaryDeduction(Float salaryPerDay, int nol);
	public Float salaryNet(Float basicSalary , Float salaryDeduction);
	
	
	public List<PaySlipRecord> getAllPaySlip();
	public List<PaySlipRecord> paySlipRecord(String email);	
	public PaySlipRecord getSLipById(int id);
	
	public void deleteAll();
	public List<MessageRecord> myList(String from);
}
