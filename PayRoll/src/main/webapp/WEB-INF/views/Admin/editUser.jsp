<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background="resources/images/background.jpg">
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
</div>
<br/><br/><br/><br/><br/><br/><br/><br/>
<center>
	<form action="/PayRoll/editEmployee" method="post"  >
    <table style="background: white;">
        <tr>
        <th colspan="2" align="center" style="color: red;"><h3>Edit Record</h3></th>
        </tr>
        <tr>
    	<th>Employee Id </th>
    	<td><input type="text" name ="empId" value="${userDetail.employeeid}"></td>
    	</tr>
    	
    	
        <tr>
    	<th>Name</th>
    	<td><input type="text" name ="name"  value="${userDetail.name}"></td>
    	</tr>
    	
    	<tr>
    	<th>Contact Number</th>
    	<td><input type="text" name ="contact_number" value="${userDetail.contact_number}"></td>
    	</tr>
    	
    	<tr>     
    	<th>User Type</th>
    	<td> 
    	<input type="radio" name="user_type" value="Hr">Hr
    	<input type="radio" name="user_type" value="Employee">Employee
		</td>
    	</tr>
    	
    	<tr>
    	<th>Basic Salary</th>
    	<td><input type="text" name="basicSalary" value="${userDetail.basic_salary}"></td>
    	</tr>
    
    
    	<tr>
    	<th>Email</th>
    	<td><input type="text" name ="email" value="${userDetail.email}"></td>
    	</tr>
    
    
    <tr>
    	<th>Password</th>
    	<td><input type="password" name ="password" value="${userDetail.password}"></td>
    </tr>
    
    <tr align="center">
    <td colspan="2"><input type="submit" value="Save" style="color: white; background: green;font-size: x-large;">
    <input type="reset" value="Clear" style="color: white; background: green;font-size: x-large;">
    </td>
    </tr>
    <tr>
    
    </tr>
    </table>
    </form>
    </center>
</body>
</html>