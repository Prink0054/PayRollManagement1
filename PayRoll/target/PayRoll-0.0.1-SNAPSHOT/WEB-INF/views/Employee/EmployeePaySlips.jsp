<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

  
</head>
<body>
  <h1 style="color: maroon;">Payroll Management System </h1> 
    Welcome!! <font color="Red" size="4"> ${myname}</font>
    <br/><br/>
    <table>
    <tr>
    <td><a href="/PayRoll/employeeHome?email=${myemail}">Home</a></td>
    <td><a href="/PayRoll/employeeMessage?email=${myemail}">Messages</td>
    <td><a href="/PayRoll/employeePaySlips?email=${myemail}">Payslips</td>
        
    
    <td><a href="/PayRoll/logout">logout</td>
    </tr>   
    </table>
	<br/>
<table  border="1">


 <tr style="background: aqua;">
    <th>Payslip ID</th>
    <th>Month and Year</th>
    <th>Generated On</th>
    <th>Basic Salary</th>
    <th>No. of Leaves</th>
    <th>Salary Per Day</th>
    <th>Deduction For Leaves</th>
    <th>Net Salary</th>
    <th></th>
    </tr>
     <c:forEach items="${paySlip}" var="slip">
     <tr style="background: lightyellow" align="center">
         <td>${slip.payslipID}</td>
         <td>${slip.monthName} ${slip.year}</td>
         <td>${slip.generatedOn}</td>
         <td>${slip.user.basic_salary}</td>
         <td>${slip.noofLeaves}</td>
         <td>${slip.salaryperday}</td>
         <td>${slip.deductionforLeaves}</td>
         <td>${slip.netSalary}</td>
         <td><a href="/PayRoll/employeedownloadSlip?myEmail=${slip.user.email}&getId=${slip.payslipID}"">View</a></td>
         <input type="text" value="${slip.user.email}" name="email" hidden="true">
	</tr>
   </c:forEach>

</table>



</body>
</html>