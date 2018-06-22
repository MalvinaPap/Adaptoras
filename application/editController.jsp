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
		   int id=UserDAO.getUserId(mail);
	       request.setCharacterEncoding("UTF-8");
		   String name = request.getParameter("name");
		   String  surname = request.getParameter("surname");
		   String birthday = request.getParameter("bd");
		   String gender = request.getParameter("gender");
		   String lives = request.getParameter("lives");
		   String isfrom = request.getParameter("from");
		   String email = request.getParameter("email");
		   String[] provides = request.getParameterValues("provides");
		   String[] interests = request.getParameterValues("interests");
		   String description = request.getParameter("description");
		   
		   DataValidation valid = new DataValidation();
		 
           List<String> toChange =  new ArrayList<String>();
		   List<String> newValues =  new ArrayList<String>();
		 
		   if (valid.isNameValid(name)) {
			   toChange.add("name");
			   newValues.add(name);
		   }
		   if (valid.isSurnameValid(surname)) {
			   toChange.add("surname");
			   newValues.add(surname);
		   }
		   if (valid.isValidEmailAddress(email)) {
			   toChange.add("email");
			   newValues.add(email);
		   }
		   if (valid.isValidGender(gender)) {
			   toChange.add("gender");
			   newValues.add(gender);
		   }
		   if (lives.length() >=3 ) {
			   toChange.add("lives");
			   newValues.add(lives);
		   }
		   if (isfrom.length() >=3) {
			   toChange.add("isfrom");
			   newValues.add(isfrom);
		   }
		   if (description.length() >=3 ) {
			   toChange.add("description");
			   newValues.add(description);
		   }
		   if (valid.isValidBirthday(birthday)) {
			   toChange.add("birthday");
			   newValues.add(birthday);
		   }
		   
		   EditData.updateProfile(id,toChange,newValues);
		   EditData.updateProvides(id,provides);
		   EditData.updateInterests(id,interests);
		   response.sendRedirect("myprofile.jsp");
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