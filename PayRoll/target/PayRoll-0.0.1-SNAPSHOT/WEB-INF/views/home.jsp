<%@ page language="java" contentType="text/html; 
charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<center> 
    <font color="DarkRed" size="6">Payroll Management System </font> 
</center>
</head>
<body>
<form action="/PayRoll/checkUser" method="post" modelAttribute="user">
<center>
<table border="1" cellpadding="5" cellspacing="0">
<thead>
	<tr>
	<th colspan="2">Login Here</th>
	</tr>
</thead>
<tbody>
<font style="color: green;">${msg}</font>
	<tr>
		<td>Username</td>
		<td><input type="text" name="email" required="required"></td>
	</tr>
	
	<tr>
	<td>Password</td>
		<td><input type="password" name="password" required="required"></td>
	</tr>
	<tr>
         <td colspan="2" align="center"><input type="submit" value="Login" />
                            &nbsp;&nbsp;
                            <input type="reset" value="Reset" />
          </td>                        
     </tr>     		
</tbody>	
</table>
<font style="color: Red"> ${message}</font>
</center>
</form>
</body>
</html>

