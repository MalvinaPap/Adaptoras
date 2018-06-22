<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" import="java.io.*"%>
<%@ page import="adaptoras.*"%>   

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content
		must come *after* these tags -->
		<title>Αρχική -Adaptorας</title>
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/custom_signin.css">

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

	</head>

	<link rel="shortcut icon" href="images/logoMIX.png" />

	<body>
        <% 
		boolean flag=true;
		try {
		  User user = (User) session.getAttribute("user-object");
		  String mail=user.getEmail();
		} catch (Exception ex) {
         flag=false;	
		}
		if (flag) {
		%>	
		    <jsp:include page="navbar_logged.jsp"/>
		<% 
		} else {
		%>
		    <jsp:include page="navbar_notlogged.jsp"/>
		<%
		}
	    %>
		

	
        <p>Message:</p>
        <%=exception.getMessage()%> <br><br>

        <p>StackTrace:</p>
		<%
			StringWriter stringWriter = new StringWriter();
			PrintWriter printWriter = new PrintWriter(stringWriter);
			exception.printStackTrace(printWriter);
			out.println(stringWriter);
			printWriter.close();
			stringWriter.close();
		%>

		

		


	

		<!-- JavaScript files -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>