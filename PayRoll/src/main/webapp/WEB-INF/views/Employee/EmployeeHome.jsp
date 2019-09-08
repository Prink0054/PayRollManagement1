<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
   type = "text/css"
   href = "resources/css/tablebutton.css" />
   
</head>
<body background="resources/images/background.jpg">



<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("#dialog").dialog({
            modal: true,
            autoOpen: false,
            title: "Employee Record",
            width: 1840,
            height: 850
        });
        $("#btnShow").click(function () {
            $('#dialog').dialog('open');
        });
    });
</script>



<div id="dialog" style="display: none" align = "center">
 <div align="left" id="btns">
 <button id="btnShow1" style="background: #000000; border-radius: 10px; padding: 7px 0; color: #fff; width: 210px;height: 37px">Add New</button>
 <button id="submit"  onclick="location.href='/PayRoll/adminDeleteAll'">Delete All</button>
 </div>
 <br/>
 <table id="customers">
  <tr>
    <th>Employee Id</th>
    <th>Name</th>
    <th>Contact</th>
    <th>Email</th>
    <th>User Type</th>
    <th>Password</th>
    <th colspan="2">Choose</th>
  </tr>
  <c:forEach items="${empList}" var="emps">
  <tr>
    <td>${emps.employeeid}</td>
    <td>${emps.name}</td>
    <td>${emps.contact_number}</td>
    <td>${emps.email}</td>
    <td>${emps.user_type}</td>
    <td>${emps.password}</td>
    <td align="center"><a href="/PayRoll/editUser?getEmail=${emps.email}"><img src="resources/images/edit.jpeg" width="20" height="20"></a></td>
    <td align="center"><a href="/PayRoll/deleteUser?getEmail=${emps.email}"><img src="resources/images/delete.png" width="20" height="20"></a></td>
    
  </tr>
  </c:forEach>
</table>
</div>



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
<div align="center" style="margin-top: 200px">
<h1> <font color="lightyellow"; size="40px">Welcome ${myname}</font></h1>
<br><br><br><br>


<input type="button" id="btnShow2" value="Messsage Record"" style="background: #000000; border-radius: 10px; padding: 7px 0; color: #fff; width: 210px; height: 37px" ><br><br><br>

<div id="btn_div">
 		<input type="button"  id="btnShow7"value="PaySlip Record"" style="background: #000000; border-radius: 10px; padding: 7px 0; color: #fff; width: 210px;height: 37px" ><br><br><br>
 		</div>

</div>
</div>



<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("#dialog1").dialog({
            modal: true,
            autoOpen: false,
            title: "Register",
            width: 400,
            height: 480
        });
        $("#btnShow1").click(function () {
            $('#dialog1').dialog('open');
        });
    });
</script>



<div id="dialog1" style="display: none" align = "center">
 <br/> 
 	<form action="/PayRoll/saveEmployee" method="post" >
    <table>
        <tr>
    	<th>Employee Id </th>
    	<td><input type="text" name ="empId"></td>
    	</tr>
    	
    	
        <tr>
    	<th>Name</th>
    	<td><input type="text" name ="name"></td>
    	</tr>
    	
    	<tr>
    	<th>Contact Number</th>
    	<td><input type="text" name ="contact_number"></td>
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
    	<td><input type="text" name="basicSalary"></td>
    	</tr>
    
    
    	<tr>
    	<th>Email</th>
    	<td><input type="text" name ="email"></td>
    	</tr>
    
    
    <tr>
    	<th>Password</th>
    	<td><input type="password" name ="password"></td>
    </tr>
    
    <tr align="center">
    <td colspan="2"><input type="submit" value="Save" style="color: white; background: green;font-size: x-large;">
    <input type="reset" value="Clear" style="color: white; background: green;font-size: x-large;">
    </td>
    </tr>
    </table>
    
    </form>	
 
</div> 
 <!-- Message Record -   onclick="location.href='/PayRoll/adminPaySlips'"-->
 
 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("#dialog2").dialog({
            modal: true,
            autoOpen: false,
            title: "Message Record",
            width: 1000,
            height: 800
        });
        $("#btnShow2").click(function () {
            $('#dialog2').dialog('open');
        });
    });
</script>



<div id="dialog2" style="display: none" align = "center">
 <button id="btnShow4" style="background: green; border-radius: 10px; padding: 7px 0; color: #fff; width: 110px;height: 45px">Inbox</button>
 <button id="btnShow5" style="background: green; border-radius: 10px; padding: 7px 0; color: #fff; width: 110px;height: 45px">Outbox</button>
 <button id="btnShow6" style="background: green; border-radius: 10px; padding: 7px 0; color: #fff; width: 110px;height: 45px">Compose</button>
 
 
 <div>
 <img src="resources/images/imagePic.jpg">
 </div>
</div>





<!-- Inbox button  onclick="location.href='/PayRoll/adminMessage?email=${myemail2}'"-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("#dialog4").dialog({
            modal: true,
            autoOpen: false,
            title: "Inbox Message",
            width: 1000,
            height: 800
        });
        $("#btnShow4").click(function () {
            $('#dialog4').dialog('open');
        });
    });
</script>
<div id="dialog4" style="display: none" align = "center">
 
<table id="customers">
  <tr>
    <th>From</th>
    <th>Message</th>
    <th>Date and Time</th>
   <th>Delete</th>
  </tr>
  <c:forEach items="${employeeInbox}" var="inbox">
  <tr>
    <td>${inbox.from.email}</td>
    <td>${inbox.msgBody}</td>
    <td>${inbox.date}</td>
 
    <td align="center"><a href="/PayRoll/deleteEmployeeMessage?getId=${inbox.id}"><img src="resources/images/crossIcon.jpg" width="20" height="20"></a></td>
    
  </tr>
  </c:forEach>
</table>
 
</div>



<!-- Outbox button  onclick="location.href='/PayRoll/adminMessage?email=${myemail2}'"-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("#dialog5").dialog({
            modal: true,
            autoOpen: false,
            title: "Outbox Message",
            width: 1000,
            height: 800
        });
        $("#btnShow5").click(function () {
            $('#dialog5').dialog('open');
        });
    });
</script>

<div id="dialog5" style="display: none" align = "center">

<table id="customers">
  <tr>
    <th>To</th>
    <th>Message</th>
    <th>Date and Time</th>
   <th>Delete</th>
  </tr>
  <c:forEach items="${employeeOutbox}" var="outbox">
  <tr>
    <td>${outbox.to.email}</td>
    <td>${outbox.msgBody}</td>
    <td>${outbox.date}</td>
 
    <td align="center"><a href="/PayRoll/deleteEmployeeOutboxMessage?getId=${outbox.id}"><img src="resources/images/crossIcon.jpg" width="20" height="20"></a></td>
    
  </tr>
  </c:forEach>
</table>


</div>


<!-- COmpose button  onclick="location.href='/PayRoll/adminMessage?email=${myemail2}'"-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
    	
        $("#dialog6").dialog({
            modal: true,
            autoOpen: false,
            title: "Compose Message",
            width: 500,
            height: 400
        });
        $("#btnShow6").click(function () {
            $('#dialog6').dialog('open');
        });
    });
</script>

<div id="dialog6" style="display: none" align = "center">

<form action="/PayRoll/employeeSendMessage" method="POST" >
<table>
<tr>
<td>From:</td>
<td>
<input type="text" readonly="readonly" name="fromEmail" value="${myemail}">
</td>		
</tr>


<tr>
<td>To:</td>
<td>
<select name="toEmail">
<c:forEach items="${employeeList}" var="employee">    	
<option value="${employee.email}">${employee.name}</option>
</c:forEach>
</select>
</td>		
</tr>

<tr>
<td>Message:</td>
<td><textarea cols="30" rows="5" name="msgBody"></textarea>
</tr>

<tr>
<td colspan="2" align="center">
<input type="submit" value="Send" style="color: white; background: green; font-size: x-large;">&nbsp;&nbsp;&nbsp;	
<input type="reset" value="Clear" style="color: white; background: green; font-size: x-large;">
</tr>

</table>
</form>


</div>





<!-- PaySlip button  '"-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("#dialog7").dialog({
            modal: true,
            autoOpen: false,
            title: "Payslip	 Record",
            width: 1840,
            height: 850
        });
        $("#btnShow7").click(function () {
            $('#dialog7').dialog('open');
        });
    });
</script>



<div id="dialog7" style="display: none" align = "center">

 <div align="left" id="btns">
 </div>
 <br/>
 <table id="customers">
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
       	 <td><a href="/PayRoll/employeedownloadSlip/?myEmail=${slip.user.email}&getId=${slip.payslipID}"">Show</a></td>
	</tr>
   </c:forEach>
</table>
</div>

</body>
</html>

