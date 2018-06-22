<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="adaptoras.*"%> 

<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>Επεξεργασία Προφίλ -Adaptorας</title>
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous">
		<!-- Bootstrap Core CSS -->
		<!--     <link href="css/bootstrap.min.css" rel="stylesheet"> -->
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<script src="https://www.w3schools.com/lib/w3.js"></script>	
		
	</head>
	
	<link rel="shortcut icon" href="images/logoMIX.png" />
	
	
	
	<body>
	
		<% 
		boolean flag=true;
		String mail=null;
		try {
			User user = (User) session.getAttribute("user-object");
			mail=user.getEmail();
		} catch (Exception ex) {
			flag=false;	
		}
		if (flag) {
		%>	
		    <jsp:include page="navbar_logged.jsp"/>
		<% 
		} else {
			request.setAttribute("message", "You are not logged in!");
		%>
		    <jsp:forward page="index_1.jsp"/>
		<%
		}   
		
		String request_id=request.getParameter("id");
		int rid= Integer.parseInt(request_id);
		String status=request.getParameter("status");
		
		RequestDAO.answerRequest(rid,status);
		
		
        response.sendRedirect("requests.jsp");
        %>
	
	</body>

</html>