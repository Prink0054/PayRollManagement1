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
    <td><a href="/PayRoll/adminHome?email=${myemail}">Home</a></td>
    <td><a href="/PayRoll/addEmployee?email=${myemail}">Employee</td>
    <td><a href="/PayRoll/adminMessage?email=${myemail}">Messages</td>
    <td><a href="/PayRoll/adminPaySlips?email=${myemail}">Payslips</td>
        
    
    <td><a href="/PayRoll/logout">logout</td>
    </tr>   
    </table>
<br/>
<form action="/PayRoll/salaryInfo" method="GET" >
<table>

<tr>
<td>Employee :</td>
<td>
<select name="myEmail">
<c:forEach items="${employeeList}" var="employee">    	
<option value="${employee.email}">${employee.name}</option>
</c:forEach>
</select>
<input type="submit" value=">>>">
</td>		
</tr>
</table>
</form>


</body>
</html>