<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
   type = "text/css"
   href = "resources/css/tablebutton.css" /> 
</head>	



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="parent-div" style="width: 1825px; height: 42px; background-color: lightyellow; margin-top: -20px" >
<div style="margin-top: -10px">
<h3 >Hello  <font style="color: red;">${myname}</font>
</h3>
</div>

<div align="right" style="margin-top: -55px">
	<table>
	<tr>
	 <td ><h3><a href="/PayRoll/adminHome">Home</a></h3></td>
    <td><h3><a href="/PayRoll/logout">logout</a></h3></td>
    </tr>
	</table>
</div>
<div style="margin-top: -20px"><h2 style="background: red; color: white;">Generate Payment Record</h2>
</div>
<p align="right">${currDate}</p>
<br/>

<form method="post" action="/PayRoll/generateRecord">	
<center>
<table id="customers">
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
<td><input type="text" name="NOL" value="0"></td>
</tr>
<tr>
<td colspan="2" align="center"><input id="submit" type="submit" value="Generate"></td>
</tr>

</table>
</center>
</form>
</body>
</html>