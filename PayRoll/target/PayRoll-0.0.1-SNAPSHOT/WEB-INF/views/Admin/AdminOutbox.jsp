<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

    <h1 style="color: maroon;">Payroll Management System </h1> 
    <font color="Green" size="4">[Login as Adminisrator]</font>
    <table>
    <tr>
    <td><a href="/PayRoll/adminHome?email=${myemail}">Home</a></td>
    <td><a href="/PayRoll/addEmployee?email=${myemail}">Employee</td>
        <td><a href="/PayRoll/adminMessage?email="${myemail}">Messages</td>
            <td><a href="/PayRoll/adminPaySlips?email=${myemail}">Payslips</td>
        
    
    <td><a href="/PayRoll/logout">logout</td>
    </tr>
    <tr>
    <td colspan="3" style="color: green;"><h4>Welcome to Administrator!!!</h4></td>
    </tr>
    
    
    
    </table>

 <font style="color: red;" face="Bold">Messsage:</font>&nbsp &nbsp&nbsp&nbsp Outbox &nbsp &nbsp&nbsp<a href="/PayRoll/adminMessageCompose?email=${myemail}">Compose</a> &nbsp &nbsp&nbsp&nbsp<a href="/PayRoll/adminMessage?email=${myemail}">Inbox</a>
</head>
<body>

  <table border="1">
    <tr style="background: aqua;">
    <th>To</th>
    <th>Message</th>
    <th>Date and Time</th>

    <th>X</th>
    </tr>
    
    <c:forEach items="${msgOutbox}" var="msg">
    <tr style="background: lightyellow" align="center">
    <td><c:out value="${msg.to}"/></td>
    <td><c:out value="${msg.msgBody}"/></td>
    <td><c:out value="${msg.date}"/></td>
    
 
    
    <td><a href="/PayRoll/deleteOutboxMessage?getId=${msg.id}">Delete</td>
    </tr>    
    
     </c:forEach>
    
    </table>

</body>
</html>

