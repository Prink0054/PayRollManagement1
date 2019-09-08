<%@ page language="java" contentType="text/html; 
charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body background="resources/images/background.jpg">

<br/><br/><br/><br/><br/>
<p align="center" style="font-size: xx-large; color: white;">WELCOME</p> 
<br/>
<p align="center" style="font-size: xx-large; color: white;">TO</p> 
<br/><br/>
<h1 align="center" style="color: lightyellow">HR & EMPLOYEE PAYROLL SYSTEM</h1>

<br/><br/>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("#dialog").dialog({
            modal: true,
            autoOpen: false,
            title: "Login Here",
            width: 320,
            height: 500
        });
        $("#btnShow").click(function () {
            $('#dialog').dialog('open');
        });
    });
</script>
<center><div id="parent-div" style="width: 100px; height: 100px;" >
<input type="button" id="btnShow" value="Login Here" style="width: 100%; height: 40%; font-size: large;"/>
</div>
</center>

<div id="dialog" style="display: none" align = "center">
    <img src="resources/images/icon.png">
   <div id="parent-div" style="width: 290px; height: 100px;" align="center">
 		<form method="POST" action="/PayRoll/checkUser">
 		<div id="text1Div">
 			<input type="text" name="email" placeholder="Enter Username" style="width: 100%; height: 20%;">
 		</div>
 		<br/>
 		<div id="text2Div">
 			<input type="password" name="password" placeholder="Enter Password" style="width: 100%; height: 20%;">
 		</div>
 		
 		<br/>
 		<div id="btn_div">
 			<input type="submit" value="Login" style="width: 100%; height: 20%; background: green; color: white;">
 		</div>
 		
 		</form>
	</div>
</div>
</body>
</html>

