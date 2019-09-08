<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<br/>
<h1 style="background: black;color: white;" align="center">Mobile Programming India Pvt. Ltd.</h1>
<h3 align="center" style="color: black;">Mohali</h3>
<h3 align="center" style="color: black;">Salary Slip for the month of ${month} ${year}</h3>
<hr>
<br/>
<center>
<table>
<tr>
<td>Employee Id:</td>
<td>${empId}</td>
</tr>

<tr>
<td>Employee Name:</td>
<td>${name}</td>
</tr>


<tr>
<td>Phone:</td>
<td>${phone}</td>
</tr>


<tr>
<td>Email:</td>
<td>${email}</td>
</tr>


<tr>
<td>Created On</td>
<td>${createOn}</td>
</tr>

<tr>
<td>Basic Salary</td>
<td>${basicSalary}</td>
</tr>

<tr>
<td>No. Of leaves</td>
<td>${nol}</td>
</tr>

<tr>
<td>Deduction for leaves</td>
<td>${deduction}</td>
</tr>
<tr>
<td><font style="font: bold;">Net Salary:</font></td>
<td>${netSalary}</td>
</tr>
</table>
<br>
<a href="employeePaySlips">Goto</a>

</center>

</body>
</html>