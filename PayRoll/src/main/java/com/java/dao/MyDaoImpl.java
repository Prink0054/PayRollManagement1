package com.java.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.model.MessageRecord;
import com.java.model.PaySlipRecord;
import com.java.model.User;

@Repository
public class MyDaoImpl implements MyDao {
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	
	  

	@Override
	public User checkLogin(String email, String password) {
		Session session = sessionFactory.openSession();
		List<User> getAll = session.createQuery("From User").list();
		for (User user : getAll) {
			if (email.equals(user.getEmail()) && password.equals(user.getPassword())) {
				System.out.println(user.getUser_type());
				return user;
			}

		}
		return null;
	}

	@Override
	public void logout() {
		sessionFactory.close();

	}

	

	@Transactional
	@Override
	public void save(User user) {
		System.out.println(user.getContact_number());
		sessionFactory.getCurrentSession().save(user);

	}

	@Transactional
	@Override
	public void deleteUser(String email) {

		Session session = sessionFactory.getCurrentSession();
		User user = session.get(User.class, email);
		session.delete(user);

	}

	
	  
	  @Transactional
	  
	  @Override public void saveMessage(User from, User to, String msgBody) {
	  Session session=sessionFactory.getCurrentSession(); 
	  MessageRecord message=new MessageRecord(); 
	  message.setTo(to); 
	  message.setFrom(from);
	  message.setMsgBody(msgBody); 
	  message.setDate(new Date().toString());
	  session.save(message); 
	  }



//	@Override
//	public List<MessageRecord> getallRecord(String email) {
//		Session session = sessionFactory.openSession();
//		String queryString = "from MessageRecord where FROM = :email";
//		List<MessageRecord> getAllRecord = (List<MessageRecord>) session.createQuery("from MessageRecord  where FROM = :email").setString(1, email);
//	return getAllRecord;
//	}

	@Override
	public List<MessageRecord> getallRecord() {
		Session session = sessionFactory.openSession();
		List<MessageRecord> getAllRecord = session.createQuery("From MessageRecord").list();
		return getAllRecord;
	}

	@Transactional
	@Override
	public User user(String email) {
		Session session=sessionFactory.getCurrentSession();
		User user=session.get(User.class, email);
		return user;
	}

	@Transactional
	@Override
	public List<MessageRecord> sendList(String from) {  //admin
		Session session=sessionFactory.getCurrentSession();
		List<MessageRecord> getByEmail=new ArrayList<>();
		for(MessageRecord record:getallRecord())
		{
			if(from.equals(record.getFrom().getEmail())) //admin==admin
			{
				
				getByEmail.add(record);
			}
		}
		return getByEmail;
	}

	@Transactional
	@Override
	public List<MessageRecord> recivedList(String from) { //sanjeev
		Session session=sessionFactory.getCurrentSession();
		List<MessageRecord> getByEmail=new ArrayList<>();
		for(MessageRecord record:getallRecord())
		{
			if(!from.equals(record.getFrom().getEmail()))  //admin!=admin
			{
				
				getByEmail.add(record);
				
				
			}
		}
		return getByEmail;
	}



	
	
	@Transactional
	public List<MessageRecord> myList(String from)
	{
		List<MessageRecord> getByEmail=new ArrayList<>();
		for(MessageRecord record:getallRecord())
		{
			if(from.equals(record.getTo().getEmail()))
			{
				getByEmail.add(record);
			}
		}
		return getByEmail;
	}
	
	
	@Transactional
	@Override
	public void save(PaySlipRecord record) {
		Session session=sessionFactory.getCurrentSession();
		session.save(record);
	}



	public List<PaySlipRecord> getal() {
		Session session = sessionFactory.openSession();
		List<PaySlipRecord> getAl = session.createQuery("From PaySlipRecord").list();
		return getAl;
	}

	@Override
	public List<User> getall() {
		Session session = sessionFactory.openSession();
		List<User> getAll = session.createQuery("From User").list();
		return getAll;
	}




	@Override
	public int getdaysInMonth(int day, int year) {
		
		int getdays = 0;
		
		switch(day)
		{
		case 1:
		{
		
			getdays = 31;
			break;
		}
		case 2:
		{
			
			if((year%400==0)||((year%4==0)&&(year%100!=0))) {
				getdays = 29;
			}
			else {
				getdays = 28;
			}
			
		}
		
		case 3:
		{
			getdays = 31;
			break;
		}
		
		case 4:
		{
			getdays = 30;
			break;
		}
		case 5:
		{
			getdays = 31;
			break;
		}
		
		case 6:
		{
			getdays = 30;
			break;
		}
		case 7:
		{
			getdays = 31;
			break;
		}
		case 8:
		{
			getdays = 31;
			break;
		}
		case 9:
		{
			getdays = 30;
			break;
		}
		case 10:
		{
			getdays = 31;
			break;
		}
		case 11:
		{
			getdays = 30;
			break;
		}
		case 12:
		{
			getdays = 31;
			break;
		}
		}
		return getdays;
		
	}

	@Override
	public String MonthName(int monthVal) {
		String getMonth = null;
		
		switch(monthVal)
		{
		case 1:
		{
		
			getMonth = "Jan";
			break;
		}
		case 2:
		{
			getMonth = "Feb";
			break;
		}
		
		case 3:
		{
			getMonth = "March";
			break;
	
		}
		
		case 4:
		{
			getMonth = "April";
			break;
	
		}
		case 5:
		{
			getMonth = "May";
			break;
	
		}
		
		case 6:
		{
			getMonth = "June";
			break;
	
		}
		case 7:
		{
			getMonth = "July";
			break;
	
		}
		case 8:
		{
			getMonth = "Aug";
			break;
	
		}
		case 9:
		{
			getMonth = "Sept";
			break;
	
		}
		case 10:
		{
			getMonth = "Oct";
			break;
	
		}
		case 11:
		{
			getMonth = "Nov";
			break;
	
		}
		case 12:
		{
			getMonth = "Dec";
			break;
	
		}
		}
		return getMonth;

	}




	@Override
	public Float salaryPerDay(Float basicSalary, int days) {
		
		Float salary = basicSalary/days;
		return salary;
	}




	@Override
	public Float salaryDeduction(Float salaryPerDay, int nol) {
		
		Float salaryDeduction = salaryPerDay * nol;
		return salaryDeduction;
		
	}




	@Override
	public Float salaryNet(Float basicSalary, Float salaryDeduction) {
		
		Float netSlaray = basicSalary - salaryDeduction;
		
		return netSlaray;
	}



	@Transactional
	@Override
	public void deleteMessage(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		MessageRecord messageRecord = session.get(MessageRecord.class, id);
		session.delete(messageRecord);
		
	}



	@Transactional
	@Override
	public void deletePaySlip(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		PaySlipRecord  paySlipRecord = session.get(PaySlipRecord.class, id);
		session.delete(paySlipRecord);
		
	}
	

	@Transactional
	@Override
	public List<PaySlipRecord> getAllPaySlip() {
		Session session=sessionFactory.getCurrentSession();
		return session.createQuery("FROM PaySlipRecord").list();
	}



	@Transactional
	@Override
	public List<PaySlipRecord> paySlipRecord(String email) {
		
		List<PaySlipRecord> myPay=new ArrayList<>();
		for(PaySlipRecord record:getAllPaySlip())
		{
			if(email.equals(record.getUser().getEmail()))
			{
				myPay.add(record);				
			}
		}
		return myPay;
	}



	@Transactional
	@Override
	public PaySlipRecord getSLipById(int id) {

		Session session = sessionFactory.getCurrentSession();
		
		PaySlipRecord paySlipRecord = session.get(PaySlipRecord.class, id);
		
				return paySlipRecord;
	}



@Transactional
	@Override
	public void updateUser(User user,String email) {
		
		Session session = sessionFactory.getCurrentSession();
		
		User user2 = session.get(User.class, email);
		
		user2.setEmployeeid(user.getEmployeeid());
		user2.setName(user.getName());
		user2.setBasic_salary(user.getBasic_salary());
		user2.setContact_number(user.getContact_number());
		user2.setEmail(user.getEmail());
		user2.setPassword(user.getPassword());
		user2.setUser_type(user.getUser_type());
		session.update(user2);
		
		
	}



@Transactional
@Override
public void deleteAll() {
	Session session = sessionFactory.getCurrentSession();
	
	List<User> alluser = getall();
	String hr="Hr";
	for(User user : alluser) {
		
		if(!hr.equals(user.getUser_type()))
		{
			session.delete(user);
		}
		
	}
	
}




	




	
	 

}
