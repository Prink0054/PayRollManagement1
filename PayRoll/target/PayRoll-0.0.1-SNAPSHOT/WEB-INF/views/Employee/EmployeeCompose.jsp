<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

    <h1 style="color: maroon;">Payroll Management System </h1> 
    Welcome!! <font color="red" size="4"> ${myname}</font>
    
    <table>
    <tr>
    <td><a href="/PayRoll/employeeHome">Home</a></td>
    <td><a href="/PayRoll/employeeMessage">Messages</td>
    <td><a href="/PayRoll/employeePaySlips">Payslips</td>     
    <td><a href="/PayRoll/logout">logout</td>
    </tr>
    <tr>
    <td colspan="3" style="color: green;"><h4>Welcome to Employee!!!</h4></td>
    </tr>
    </table>

 <font style="color: red;" face="Bold">Messsage:</font>&nbsp&nbsp&nbsp&nbsp Compose &nbsp&nbsp<a href="/PayRoll/employeeMessage?email=${myemail}">Inbox</a>&nbsp&nbsp&nbsp&nbsp<a href="/PayRoll/employeeOutbox?email=${myemail}">Outbox</a>
</head>
<body>
<form action="/PayRoll/employeeSendMessage" method="POST" >
<table>
<tr>
<td>From:</td>
<td>
<input type="text" readonly="readonly" name="fromEmail" value="${myemail}">
</td>		
</tr>


<tr>
<td>To:</td>
<td>
<select name="toEmail">
<c:forEach items="${employeeList}" var="employee">    	
<option value="${employee.email}">${employee.name}</option>
</c:forEach>
</select>
</td>		
</tr>

<tr>
<td>Message:</td>
<td><textarea cols="30" rows="5" name="msgBody"></textarea>
</tr>

<tr>
<td><input type="submit" value="send">
</tr>

</table>
</form>
</body>
</html>