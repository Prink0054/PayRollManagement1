package com.java.controller;


import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.time.Year;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.java.dao.MyDao;
import com.java.model.MessageRecord;
import com.java.model.PaySlipRecord;

import com.java.model.User;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfCell;

@Controller
public class MyController {

	@Autowired
	MyDao dao;
	
	
	@RequestMapping(value="/")
	public String getHome()
	{
		return "home";
	}
	
	//Login Code POST MAPPING
	@RequestMapping(value="/checkUser",method=RequestMethod.POST)
	public String postLogin(@ModelAttribute("user")User user,Model model,final RedirectAttributes redirectAttributes,
			HttpSession session)
	{
		User loginUser=dao.checkLogin(user.getEmail(), user.getPassword());
		session.setAttribute("loginuser", loginUser);
		if(session==null)
		{
			return "redirect:/";
		}

		if(loginUser != null && loginUser.getUser_type().equals("Hr"))
		{
			model.addAttribute("myemail2", loginUser.getEmail());
			return "redirect:/adminHome"; 
		}
		
		else if(loginUser != null && loginUser.getUser_type().equals("Employee"))
			return "redirect:/employeeHome";
		else 
			return "redirect:/";
	}
	
	//Admin Home
	@RequestMapping(value="/adminHome")
	public String getAdminHome(Model model,HttpSession session)
	{
		User user=(User) session.getAttribute("loginuser");
		if(user==null)
		{
			return "redirect:/";
		}
		model.addAttribute("myname", user.getName());
		model.addAttribute("empList", dao.getall());
		model.addAttribute("adminInbox", dao.recivedList(user.getEmail()));
		model.addAttribute("adminOutbox" , dao.sendList(user.getEmail()));
		model.addAttribute("myemail",user.getEmail());	
		model.addAttribute("employeeList", dao.getall());

		
		
		//model.addAttribute("BasicSalary", userSlip.getBasic_salary());
		

		return "Admin/AdminHome";
	}
	
	//Employee List
	@RequestMapping(value="/addEmployee")
	public String addEmployee(Model model,HttpSession session) {
		User user=(User) session.getAttribute("loginuser");
		if(user==null)
		{
			return "redirect:/";
		}
		model.addAttribute("myname", user.getName());
		model.addAttribute("employeeList",dao.getall() );
		return "Admin/AdminEmployeeList";
	}
	
	//Get New Employee
	@RequestMapping(value="/getSaveEmployee")
	public String getAddEmployee(HttpSession session,Model model) {
		User user=(User) session.getAttribute("loginuser");
		if(user==null)
		{
			return "redirect:/";
		}
		model.addAttribute("myname", user.getName());
		return "Admin/NewEmployee";
	}
	
	//Save New Employee
	@RequestMapping(value="/saveEmployee", method=RequestMethod.POST)
	public String saveEmployee(@ModelAttribute("name")String name,@ModelAttribute("contact_number")String contact_number,
			@ModelAttribute("user_type")String user_type,
			@ModelAttribute("email")String email,@ModelAttribute("password")String password,@ModelAttribute("basicSalary") Double basic_salary,HttpSession session,
			@ModelAttribute("empId")Integer id
			
			
			
			) {
		User login=(User)session.getAttribute("loginuser");
		if(login==null)
		{
			return "redirect:/";
		}
		User user=new User();
		user.setEmployeeid(id);
		user.setName(name);
		user.setEmail(email);
		user.setContact_number(contact_number);
		user.setUser_type(user_type);
		user.setPassword(password);
		user.setBasic_salary(basic_salary);
		dao.save(user);
		return "redirect:/adminHome";
	}
	
	//Message List
	@RequestMapping(value="/adminMessage")
	public String adminMessage(Model model,HttpSession session) {
		User user=(User)session.getAttribute("loginuser");
		
		if(user==null)
		{
			return "redirect:/";
		}
		model.addAttribute("myname", user.getName());
		
		
		model.addAttribute("adminInbox", dao.recivedList(user.getEmail()));
		return "Admin/AdminInbox" ;
	}
	
	//Message Compose
	@RequestMapping(value="/adminMessageCompose")
	public String adminMessageCompose(Model model,HttpSession session) {
		User user=(User)session.getAttribute("loginuser");
		if(user==null)
		{
			return "redirect:/";
		}
		model.addAttribute("myemail",user.getEmail());	
		model.addAttribute("employeeList", dao.getall());
		
		return "Admin/AdminCompose";
	}

	//Messsage Send Post
	@RequestMapping(value="/sendMessage",method=RequestMethod.POST)
	public String sendMessage(@ModelAttribute("toEmail") String to,@ModelAttribute("fromEmail")String from,@ModelAttribute("msgBody")String msgBody,Model model,HttpSession session)
	{	
		User user=(User) session.getAttribute("loginuser");
		if(user==null)
		{
			return "redirect:/";
		}
		
		User fromuser = dao.user(from);
		User touser = dao.user(to);
		dao.saveMessage(fromuser, touser, msgBody);
		return "redirect:/adminHome";
	}
	

	//Admin Outbox
	@RequestMapping(value="/adminOutbox")
	public String getAdminOutbox(Model model,HttpSession session)
	{
		User user=(User)session.getAttribute("loginuser");
		if(user==null)
		{
			return "redirect:/";
		}
		model.addAttribute("msgOutbox", dao.sendList(user.getEmail()));
		return "Admin/AdminOutbox";
	}
	
	
	//Admin PaySlip
	 @RequestMapping(value="/adminPaySlips") 
	  public String adminPaySlips(Model model,HttpSession session) 
	  {
		 User user=(User)session.getAttribute("loginuser");
		 if(user==null)
		 {
			 return "redirect:/";
		 }
		 
		 model.addAttribute("myname", user.getName());
		 model.addAttribute("employeeList",dao.getall());
		 return "Admin/AdminPaySlips"; 
	  }
	
	//Admin Salary Emp List
	 @RequestMapping(value="/salaryInfo")
	public String getSalaryInfo(Model model,@ModelAttribute("myEmail")String email,HttpSession session,@RequestParam(value="getEmail") String email1 )
	{
			User user=(User)session.getAttribute("loginuser");
			if(user==null)
			{
				return "redirect:/";
			}
			
			
			
			User userSlip=dao.user(email1);
		
			model.addAttribute("myname", user.getName()); 
			

			model.addAttribute("SlipUser", userSlip); 	
			
			//model.addAttribute("BasicSalary", userSlip.getBasic_salary());
			model.addAttribute("paySlip", dao.paySlipRecord(email1));
			model.addAttribute("currDate", new Date());
			return "Admin/SalaryInfo";
			
		}

	 //GenerateSlip
	 @RequestMapping(value="/generateSlip")
		public String getGenerateSlip(Model model,@RequestParam("email")String email,HttpSession session)
		{
			User user=(User)session.getAttribute("loginuser");
			if(user==null)
			{
				return "redirect:/";
			}
			User slipuser=dao.user(email);
			model.addAttribute("user", slipuser);
			model.addAttribute("myname", user.getName());
			int year=Year.now().getValue();
			model.addAttribute("yearName", year);
			model.addAttribute("currDate", new Date());
			return "Admin/GenenateSlip";
		}
	

	 //Save Generate Slip record
	 @RequestMapping(value="/generateRecord",method=RequestMethod.POST)
	public String postGenerateSlip(Model model,
			
			@ModelAttribute("userName")String name,
			@ModelAttribute("email")String email,
			@ModelAttribute("basicSalary") Float basicSalary,
			@ModelAttribute("NOL")Integer NOL,
			@ModelAttribute("year")Integer year,
			@ModelAttribute("monthName")Integer month,
			HttpSession session)
	 {
		 
		 User user=(User) session.getAttribute("loginuser");
			if(user==null)
			{
				return "redirect:/";
			}
			
			
			System.out.println(month);
			User generateSlipUser=dao.user(email);
			Date date = new Date();
			PaySlipRecord record=new PaySlipRecord();
			record.setName(name);
			record.setBasicSalary(basicSalary);
			record.setNoofLeaves(NOL);
			record.setMonth(month.toString());
			record.setYear(year);
			String monthName=dao.MonthName(month);
			record.setNameOfMonth(monthName);
			int Days=dao.getdaysInMonth(month, year);
			
			Float salaryPerDay=dao.salaryPerDay(basicSalary, Days);
			record.setSalaryperday(salaryPerDay);
			
			Float deductionFOrLeaves = dao.salaryDeduction(salaryPerDay, NOL);
			record.setDeductionforLeaves(deductionFOrLeaves);
			
			Float netSalary=dao.salaryNet(basicSalary, deductionFOrLeaves);
			record.setNetSalary(netSalary);
			
			record.setGeneratedOn(date.toString());
			record.setUser(generateSlipUser);
			dao.save(record);
	
			return "redirect:/salaryInfo?getEmail="+email;
			
			
		}
 
	 
	 //Download Slip
	 
	 @RequestMapping(value="/downloadSlip")
	 public String downloadSlip(HttpSession session,@RequestParam("myEmail")String email,
			 @RequestParam("getId")int id,Model model
			 ) throws FileNotFoundException, DocumentException
	 {
		 User user=(User) session.getAttribute("loginuser");
		 if(user==null)
		 {
			 return "redirect:/";
		 }
		 
		 model.addAttribute("myname", user.getName());
		 PaySlipRecord record=dao.getSLipById(id);
		 model.addAttribute("month", record.getNameOfMonth());
		 model.addAttribute("year", record.getYear());
		 model.addAttribute("empId", record.getUser().getEmployeeid());
		 model.addAttribute("name", record.getName());
		 model.addAttribute("phone", record.getUser().getContact_number());
		 model.addAttribute("email", record.getUser().getEmail());
		 model.addAttribute("createOn", record.getGeneratedOn());
		 model.addAttribute("basicSalary", record.getBasicSalary());
		 model.addAttribute("nol", record.getNoofLeaves());
		 model.addAttribute("deduction", record.getDeductionforLeaves());
		 model.addAttribute("netSalary", record.getNetSalary());
		 
		 return "Admin/MySlip";
	 }
	 
	 //Delete Payslip
	 
		
	
		
	 
	
	@RequestMapping(value="/getEmployeename")
	public String getEmployeename(Model model) {
		model.addAttribute("allemp2", dao.getall());
		return "AdminMessageCompose";
		
	}
	


	
	
	@RequestMapping(value="/managerHome")
	public String getManagerHome(Model model)
	{
		return "ManagerHome";
	}
	
	 

	

	

//	EmployeeList
	
//	@RequestMapping(value="/allEmployee")
//	public String allEmployee(Model model) {
//		System.out.println(dao.getall());
//		model.addAttribute("allemp",dao.getall() );
//		return "Manager_EmployeeList";
//	}

	
	@RequestMapping(value="/allEmployee")
	public String allEmployee(Model model) {
		model.addAttribute("allemp1", dao.getall());
		return "Manager_EmployeeList";
		
	}
	
	@RequestMapping(value="/deleteUser")
	public String deleteUser(Model model,@RequestParam(value="getEmail")String email,HttpSession session) {
		User user=(User) session.getAttribute("loginuser");
		System.out.println(user.getEmail());
		System.out.println(email);
	
		dao.deleteUser(email);
		return "redirect:/adminHome";
	}
	
	@RequestMapping(value="/deleteMessage")
	public String deleteMessage(Model model,@RequestParam(value="getId")int id,HttpSession session) {
		User user=(User) session.getAttribute("loginuser");
		System.out.println(id);
		dao.deleteMessage(id);
	
		
		return "redirect:/adminHome";
	}
	

	
	@RequestMapping(value="/deleteOutboxMessage")
	public String deleteOutboxMessage(Model model,@RequestParam(value="getId")int id,HttpSession session) {
		User user=(User) session.getAttribute("loginuser");
		System.out.println(id);
		dao.deleteMessage(id);
	
		
		return "redirect:/adminHome";
	}
	
	@RequestMapping(value="/deleteSlip")
	public String deleteSlip(Model model,@RequestParam("getId")int id,HttpSession session) {
		User user=(User) session.getAttribute("loginuser");
		dao.deletePaySlip(id);			
		return "redirect:/adminPaySlips";
	}	
	
	
	
	
	
	
	//**************************************************Employeee*********************************************************
	
	
	
	//Employee Home
	@RequestMapping(value="/employeeHome")
	public String getEmployeeHome(HttpSession session,Model model)	{
		
		User user = (User) session.getAttribute("loginuser");
		if(user == null) {
			return "redirect:/";
		}
		
		model.addAttribute("myname", user.getName());
		
		model.addAttribute("myemail", user.getEmail());
	//	model.addAttribute("employeeInbox", dao.recivedList(user.getEmail()));
		model.addAttribute("employeeInbox", dao.myList(user.getEmail()));
		model.addAttribute("employeeOutbox", dao.sendList(user.getEmail()));
		model.addAttribute("employeeList", dao.getall());
		model.addAttribute("paySlip", dao.paySlipRecord(user.getEmail()));
		
		return "Employee/EmployeeHome";
		}
	
	
	//Employee Message
	
	@RequestMapping(value="/employeeMessage")
	public String getEmployeeMessage(HttpSession session,Model model) {
		
		User user = (User) session.getAttribute("loginuser");
		if(user == null) {
			return "redirect:/";
		}
		
		model.addAttribute("myname", user.getName());
		model.addAttribute("myemail", user.getEmail());
		model.addAttribute("employeeInbox", dao.recivedList(user.getEmail()));
	
		
		return "Employee/EmployeeInbox";
	}
	
		//Employee Message Compose
		
	@RequestMapping(value="/employeeMessageCompose")
	public String getemployeeMessageCompose(HttpSession session,Model model)
	{
		User user = (User) session.getAttribute("loginuser");
		if(user == null) {
			return "redirect:/";
		}
		
		model.addAttribute("myname", user.getName());
		model.addAttribute("myemail", user.getEmail());
		model.addAttribute("employeeList", dao.getall());
		
		return "Employee/employeeHome";
		
	}
			
	//Employee Message Outbox
	
	@RequestMapping(value="/employeeOutbox")
	public String getemployeeOutbox(HttpSession session,Model model)
	{

		User user = (User) session.getAttribute("loginuser");
		if(user == null) {
			return "redirect:/";
		}
		
		model.addAttribute("myname", user.getName());
		model.addAttribute("myemail", user.getEmail());
		model.addAttribute("msgOutbox", dao.sendList(user.getEmail()));
		
		return "Employee/EmployeeOutbox";
		
	}
	
	
	//EMployee Message Send
	
	@RequestMapping(value="/employeeSendMessage",method=RequestMethod.POST)
	public String sendemployeeSendMessage(@ModelAttribute("toEmail") String to,@ModelAttribute("fromEmail")String from,@ModelAttribute("msgBody")String msgBody,Model model,HttpSession session)
	{	
		User user=(User) session.getAttribute("loginuser");
		if(user==null)
		{
			return "redirect:/";
		}
		User fromuser = dao.user(from);
		User touser = dao.user(to);
		dao.saveMessage(fromuser, touser, msgBody);
		return "redirect:/employeeHome";
	}
	
	
	//EMployee Delete Message
	
	@RequestMapping(value="/deleteEmployeeMessage")
	public String getdeleteEmployeeMessage(HttpSession session,Model model,@RequestParam("getId") int id) {
		
		User user = (User) session.getAttribute("loginuser");
		if(user == null) {
			return "redirect:/";
		}
		
		model.addAttribute("myname", user.getName());
		dao.deleteMessage(id);
		
		return "redirect:/employeeHome";
		
	}
	

	//EMployee Delete Outbox Message
	
	@RequestMapping(value="/deleteEmployeeOutboxMessage")
	public String getdeleteOutboxEmployeeMessage(HttpSession session,Model model,@RequestParam("getId") int id) {
		User user = (User) session.getAttribute("loginuser");
		if(user == null) {
			return "redirect:/";
		}
		
		model.addAttribute("myname", user.getName());
		dao.deleteMessage(id);
		
		return "redirect:/employeeHome";
		
	}
	
	
	//Employee PaySlip
	
	@RequestMapping(value="/employeePaySlips")
	public String employeePaySLips(HttpSession session,Model model) {
		
		User user = (User) session.getAttribute("loginuser");
		if(user == null) {	
			return "redirect:/";
		}
		
		model.addAttribute("myname", user.getName());
		model.addAttribute("paySlip", dao.paySlipRecord(user.getEmail()));
		
		return "Employee/EmployeePaySlips";
		
	}
	
	
	
	 @RequestMapping(value="/employeedownloadSlip")
	 public String getemployeedownloadSlip(HttpSession session,@RequestParam("myEmail")String email,
			 @RequestParam("getId")int id,Model model
			 ) throws FileNotFoundException, DocumentException
	 {
		 User user=(User) session.getAttribute("loginuser");
		 if(user==null)
		 {
			 return "redirect:/";
		 }
		 
		 PaySlipRecord record=dao.getSLipById(id);
		 model.addAttribute("month", record.getNameOfMonth());
		 model.addAttribute("year", record.getYear());
		 model.addAttribute("empId", record.getUser().getEmployeeid());
		 model.addAttribute("name", record.getName());
		 model.addAttribute("phone", record.getUser().getContact_number());
		 model.addAttribute("email", record.getUser().getEmail());
		 model.addAttribute("createOn", record.getGeneratedOn());
		 model.addAttribute("basicSalary", record.getBasicSalary());
		 model.addAttribute("nol", record.getNoofLeaves());
		 model.addAttribute("deduction", record.getDeductionforLeaves());
		 model.addAttribute("netSalary", record.getNetSalary());
		 model.addAttribute("myname", user.getName());
		 
		 return "Employee/MySlip";
	 }
	
	
	
	//Logout Session
	@RequestMapping(value="/logout")
	public String doneLogout(Model model,HttpSession session)
	{
		session.getAttribute("loginuser");
		session.invalidate();
		model.addAttribute("message", "Logout successfull");
		
		return "home";
	}
	
	@RequestMapping(value="/editUser")
	public String editUser(Model model,@RequestParam(value="getEmail")String email,HttpSession session) {
		User user=(User) session.getAttribute("loginuser");
		if(user==null)
		{
			return "redirect:/";
		}
		model.addAttribute("myname", user.getName());
		
		User user1 = dao.user(email);
		model.addAttribute("userDetail", user1);
		
		return "Admin/editUser";
	}
	@RequestMapping(value="/editEmployee", method=RequestMethod.POST)
	public String editEmployee(@ModelAttribute("name")String name,@ModelAttribute("contact_number")String contact_number,
			@ModelAttribute("user_type")String user_type,
			@ModelAttribute("email")String email,@ModelAttribute("password")String password,@ModelAttribute("basicSalary") Double basic_salary,HttpSession session,
			@ModelAttribute("empId")Integer id
			
			
			
			) {
		User login=(User)session.getAttribute("loginuser");
		if(login==null)
		{
			return "redirect:/";
		}
		User user=new User();
		user.setEmployeeid(id);
		user.setName(name);
		user.setEmail(email);
		user.setContact_number(contact_number);
		user.setUser_type(user_type);
		user.setPassword(password);
		user.setBasic_salary(basic_salary);
		dao.updateUser(user, email);
		return "redirect:/adminHome";
	}
	
	
	@RequestMapping(value="/adminDeleteAll")
	public String adminDeleteAll(HttpSession session) {
		
		User login=(User)session.getAttribute("loginuser");
		if(login==null)
		{
			return "redirect:/";
		}

		dao.deleteAll();
		return "redirect:/adminHome";
	}
	


} 
