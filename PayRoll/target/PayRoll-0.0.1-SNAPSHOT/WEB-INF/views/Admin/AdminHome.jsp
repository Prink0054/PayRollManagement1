<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

    <h1 style="color: maroon;">Payroll Management System </h1> 
    Welcome!! <font color="red" size="4"> ${myname}</font>
    
    <h1>${myemail}</h1>
    <table>
    <tr>
    <td><a href="/PayRoll/adminHome">Home</a></td>
    <td><a href="/PayRoll/addEmployee">Employee</td>
    <td><a href="/PayRoll/adminMessage">Messages</td>
    <td><a href="/PayRoll/adminPaySlips">Payslips</td>
        
    
    <td><a href="/PayRoll/logout">logout</td>
    </tr>
    <tr>
    <td colspan="3" style="color: green;"><h4>Welcome to Administrator!!!</h4></td>
    </tr>
    
    
    
    </table>

</head>
<body>

</body>
</html>

