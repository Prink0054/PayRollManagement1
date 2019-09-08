<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

    <h1 style="color: maroon;">Payroll Management System </h1> 
    Welcome!! <font color="Red" size="4"> ${myname}</font>
    <br/><br/>
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

 <font style="color: red;" face="Bold">Messsage:</font>&nbsp &nbsp&nbsp Inbox &nbsp &nbsp&nbsp<a href="/PayRoll/employeeMessageCompose">Compose</a> &nbsp&nbsp&nbsp&nbsp<a href="/PayRoll/employeeOutbox">Outbox</a>
</head>
<body>

  <table border="1">
    <tr style="background: aqua;">
    <th>From</th>
    <th>Message</th>
    <th>Date and Time</th>

    <th>X</th>
    </tr>
    
    <c:forEach items="${employeeInbox}" var="msgInbox">
    <tr style="background: lightyellow" align="center">
    <td><c:out value="${msgInbox.from}"/></td>
    <td><c:out value="${msgInbox.msgBody}"/></td>
    <td><c:out value="${msgInbox.date}"/></td>
    
    <td><a href="/PayRoll/deleteEmployeeMessage?getId=${msgInbox.id}">Delete</td>
    
    </tr>    
    
     </c:forEach>
    
    </table>

</body>
</html>

