<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="adaptoras.*"%> 
<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content
		must come *after* these tags -->
		<title>Προφίλ -Adaptorας</title>
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/custom2.css">
		
		
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	
	</head>
	
	<link rel="shortcut icon" href="images/logoMIX.png" />
	
	<body>
	
	<% 
	    String mail= null;
		try {
		  User user = (User) session.getAttribute("user-object");
		  mail=user.getEmail();
		} catch (Exception ex) {
            request.setAttribute("message", "You are not authorized to access this resource. Please login.");
    %>
		    <jsp:forward page="index_1.jsp"/>
     <%
		}
	    request.setCharacterEncoding("UTF-8");
		String id= request.getParameter("id");
		String comment = request.getParameter("comment");
		if (comment != null) {
			int r_id = Integer.parseInt(id);
			int s_id=UserDAO.getUserId(mail);
			Comment com = new Comment(s_id,r_id,comment);
			CommentDAO.saveComment(com);
		}
		response.sendRedirect("viewprofile.jsp?id="+id);
	%>
	   
	
	
	<!-- jQuery Version 1.11.1 -->
		<script src="js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>
        <!-- JavaScript files -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>

</html>