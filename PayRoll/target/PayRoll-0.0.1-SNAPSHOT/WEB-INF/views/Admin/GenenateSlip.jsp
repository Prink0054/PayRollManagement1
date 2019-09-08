<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!DOCTYPE html>
<html>
<head>

</head>	



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


    <h1 style="color: maroon;">Payroll Management System </h1> 
    Welcome!! <font color="Red" size="4">${myname}</font>
    <br/><br/>
    <table>
    <tr>
    <td><a href="/PayRoll/adminHome">Home</a></td>
    <td><a href="/PayRoll/addEmployee">Employee</td>
    <td><a href="/PayRoll/adminMessage">Messages</td>
    <td><a href="/PayRoll/adminPaySlips">Payslips</td>
    <td><a href="/PayRoll/logout">logout</td>
    </tr>
    </table>
<br/>
<form method="post" action="/PayRoll/generateRecord">	
<table>
<tr>
<th>Name:</th>
<td> 
<input type="text" value="${user.email}" hidden="true" name="email">
<input type="text" readonly="readonly" name="userName" value="${user.name}">  
</td>
</tr>

<tr>
<th>Basic Salary:</th>
<td><input name="basicSalary" type="text" readonly="readonly" value="${user.basic_salary}"> </td>
</tr>


<tr>
<th>Month</th>
<td><select name="monthName">
<option value="1">Jan</option>
<option value="2">Feb</option>
<option value="3">Mar</option>
<option value="4">April</option>
<option value="5">May</option>
<option value="6">June</option>
<option value="7">July</option>
<option value="8">Aug</option>
<option value="9">Sept</option>
<option value="10">Oct</option>
<option value="11">Nov</option>
<option value="12">Dec</option>
<input type="text" name="year" value="${yearName}" readonly="readonly">
</td>
</tr>

<tr>
<th>No. Of Leaves</th>
<td><input type="text" name="NOL"></td>
</tr>
<tr>
<td><input type="submit" value="Generate"></td>
</tr>
<tr>
<th></th>
<td></td>
</tr>


</table>

</form>
</body>
</html>