<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#submit {
 background-color: green;
 padding: .5em;
 -moz-border-radius: 5px;
 -webkit-border-radius: 5px;
 border-radius: 6px;
 color: #fff;
 font-family: 'Oswald';
 font-size: 20px;
 text-decoration: none;
 border: none;
}

</style>


<link rel = "stylesheet"
   type = "text/css"
   href = "resources/css/tablebutton.css" />
   
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
<div style="margin-top: -20px"><h2 style="background: red; color: white;">PaySlip Record</h2>
</div>
<p align="right">${currDate}</p>
<br/>
<table cellspacing="10px" cellpadding="5px">
<tr>
<th style="background: black; color: white;font-size: large;">Employee Id</th>
<td style="font-size: large;">${SlipUser.employeeid}</td>
</tr>
<tr>
<th style="background: black; color: white;font-size: large;">Name</th>
<td style="font-size: large;">${SlipUser.name}</td>
</tr>
<tr>
<th style="background: black; color: white;font-size: large;">Basic Salary</th>
<td style="font-size: large;">${SlipUser.basic_salary}</td>
</tr>

</table>
<input type="button" id="submit" value="Generate New" onclick="location.href='/PayRoll/generateSlip?email=${SlipUser.email}'">

<br/><br/>
<table  id="customers">
 <tr style="background: aqua;">
    <th>Payslip ID</th>
    <th>Month and Year</th>
    <th>Generated On</th>
    <th>Basic Salary</th>
    <th>No. of Leaves</th>
    <th>Salary Per Day</th>
    <th>Deduction For Leaves</th>
    <th>Net Salary</th>
    <th>View</th>
    </tr>
     <c:forEach items="${paySlip}" var="slip">
     <tr style="background: white" align="center">
         <td>${slip.payslipID}</td>
         <td>${slip.nameOfMonth} ${slip.year}</td>
         <td>${slip.generatedOn}</td>
         <td>${slip.user.basic_salary}</td>
         <td>${slip.noofLeaves}</td>
         <td>${slip.salaryperday}</td>
         <td>${slip.deductionforLeaves}</td>
         <td>${slip.netSalary}</td>
       	 <td><a href="/PayRoll/downloadSlip/?myEmail=${slip.user.email}&getId=${slip.payslipID}"">Show</a></td>
	</tr>
   </c:forEach>

</table>
    </center>

    
</body>
</html>