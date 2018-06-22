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
		<title>Αποτελέσματα Αναζήτησης -Adaptorας</title>
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/custom2.css">
		<link rel="stylesheet" type="text/css" href="css/results.css">
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->		
	
	</head>
	
	<link rel="shortcut icon" href="images/logoMIX.png" />
	
	<body>
	
        <% 
		String mail=null;
		boolean flag=true;
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
			request.setAttribute("message", "You are not authorized to access this resource. Please login.");
		%>
		    <jsp:forward page="index_1.jsp"/>
		<%
		}
		int myid=UserDAO.getUserId(mail);
		request.setCharacterEncoding("UTF-8");
		String city=request.getParameter("city");
		String provides=request.getParameter("thenumbers");
		
		List<User> users = new ArrayList<User>();
		if (city.length()>=3 && provides.length()>=3) {
			users = Search.searchUsers(city,provides);
		} else if (city.length()>=3) {
			users = Search.searchUsersByCity(city);
		} else if (provides.length()>=3) {
			users = Search.searchUsersByProvides(provides);
		} 
	    %>
		<!-- container -->
		<div class="container theme-showcase" role="main">
                <%	
		           if (users.size()==0) {
				%>
				    <div class="page-header">
					    <h1>Λυπούμαστε δεν βρέθηκαν αποτελέσματα στην αναζήτησή σας...</h1>
					</div>
				<%				
				   } else {
	            %>
		
					<div class="page-header">
						<h1>Αποτελέσματα Αναζήτησης...</h1>
					</div>
					<%				
				         for (User u : users ) {
						  if (myid!=u.getId()) {
	                %>	
					    
							<div class="jumbotron">
								<div class="media">
									<div class="media-left">
										<img src="images/profile.jpg" class="media-object">
									</div>
									<div class="media-body">
										<h4 class="media-heading">
											<a href="viewprofile.jsp?id=<%=u.getId()%>"><%=u.getName()%><%out.print(" ");%><%=u.getSurname()%></a>
											<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<a href="request.jsp?rid=<%=u.getId()%>&sid=<%=myid%>"><button type="button" class="btn" style="font-size:100%;"><span class="glyphicons glyphicons-plus-sign"></span> Αίτημα</button></a>
										</h4>
										
									</div>
								</div>
							</div>
				<%	     
				         }
						 }
				   } 
	            %>
			
			
			
		</div>
		<!-- /container -->
	
		<!-- footer -->
		<footer>
			<div class="container">
				<div class="row">             
					<div class="col-xs-12">
						<p class="text-center">&copy; Copyright 2017 Adaptoras</p>
					</div>
				</div>
			</div>
		</footer>
		<!-- End footer -->
			
		<!-- JavaScript files -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>
