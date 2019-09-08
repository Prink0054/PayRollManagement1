<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New</title>
</head>
<body>
<h1 style="color: maroon;">Payroll Management System </h1> 
    
    Welcome!! <font style=" color: red;">${myname}</font>
    <br/><br/>
    <table>
    <tr>
    <td><a href="/PayRoll/adminHome">Home</a>
    </td>
    <td><a href="/PayRoll/addEmployee">Employee</td>
    <td><a href="/PayRoll/logout">logout</td>
    </tr>
    <tr>
    </tr>
    </table>
    
    <br/>
   <font style="color: red;" face="Bold" size="3">New Employee:</font> 
    <br/><br/>
    <form action="/PayRoll/saveEmployee" method="post" >
    <table>
    
        <tr>
    	<td>Employee Id </td>
    	<td><input type="text" name ="empId"></td>
    	</tr>
    	
    	
        <tr>
    	<td>Name</td>
    	<td><input type="text" name ="name"></td>
    	</tr>
    	
    	<tr>
    	<td>Contact Number</td>
    	<td><input type="text" name ="contact_number"></td>
    	</tr>
    	
    	<tr>     
    	<td>User Type</td>
    	<td> 
    	<input type="radio" name="user_type" value="Manager">Manager
    	<input type="radio" name="user_type" value="Employee">Employee
		</td>
    	</tr>
    	
    	<tr>
    	<td>Basic Salary</td>
    	<td><input type="text" name="basicSalary"></td>
    	</tr>
    
    
    	<tr>
    	<td>Email</td>
    	<td><input type="text" name ="email"></td>
    	</tr>
    
    
    <tr>
    	<td>Password</td>
    	<td><input type="text" name ="password"></td>
    </tr>
    
    <tr>
    <td><input type="submit" value="Save"></td>
    </tr>
     
    
    </table>
    
    </form>

</body>
</html>