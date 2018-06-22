<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="adaptoras.*"%> 
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content
		must come *after* these tags -->
		<title>Αιτήματα -Adaptorας</title>
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
		String mail= null;
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
		if(request.getAttribute("message") != null) { %>	
			<div class="alert alert-success"" ><%=(String)request.getAttribute("message") %></div>
		<% } 
		int myid=UserDAO.getUserId(mail);
		List<Request> requests_received = RequestDAO.getRequestsReceived(myid);
		List<Request> requests_sent = RequestDAO.getRequestsSent(myid);
	    %>
		
		<!-- container -->
		
		<div class="container theme-showcase" role="main">
		<div style="margin-left:50px">
		<div class="col-md-6 col-sm-6">
		<div class="row slideanim">	
		     
			 
			 
			 
			<div class="page-header">
				<h1 style="margin-left:20px">Ληφθέντα Αιτήματα</h1>
			</div>
			
			
			
			<% for(Request r : requests_received) {  %>
               		
					    <div class="container">
						<div class="row">
						
							<div class="col-md-5 ">

								<div class="panel panel-default">
									<div class="panel-heading">  
											
											    
												<%if (r.getStatus().equals("pending")) { %>
												<h4 >
												     <a href="viewprofile.jsp?id=<%=r.getSenderId()%>"><%=r.getFullname()%></a>
													 <a href="answerRequest.jsp?id=<%=r.getId()%>&status=accepted"><button  class="btn btn-success btn-sm"  style="margin-left:60px">Αποδοχή</button></a>
									                 <a href="answerRequest.jsp?id=<%=r.getId()%>&status=declined"><button class="btn btn-danger btn-sm" >Απόρριψη</button></a>
											    </h4>
												<% } else { %>
												
												<h4 >
												     <a href="viewprofile.jsp?id=<%=r.getSenderId()%>"><%=r.getFullname()%></a>
													 <button class="btn btn-success btn-sm" type="submit" style="margin-left:140px">Εγκρίθηκε</button>
											    </h4>
												<% }%>
									</div>
									
									<div class="panel-body">
										<div class="box box-info">
											<div class="box-body">
                                                <label class="col-md-4 control-label" for="name">Υπηρεσία:</label>
													<%if (r.getCause().equals("bed")) {%>
														<p>φιλοξενία</p>
													<%} else if (r.getCause().equals("wash")) {%>
														<p>πληντύριο</p>
													<%} else if (r.getCause().equals("sight")) {%>
														<p>ξενάγηγη</p>
													<%} else if (r.getCause().equals("food")) {%>
														<p>φαγητό</p>
													<%} else {%>
														<p>δεν έχει επιλεγεί</p>
													<%} %>
                                               
												<label class="col-md-4 control-label" for="name">Ημερομηνία/ες:</label>
                                                <p><%=r.getPeriod()%></p>
												<label class="col-md-4 control-label" for="name">Σχόλια:</label>
                                                <p><%=r.getComment()%></p>
													
									        </div>
								        </div>
									</div>
								</div>
							</div>
						</div>
						</div>		
						
			<%  }    %>			
						
		               
			
			
		</div>	
		</div>
		
		
		
		
		
		<!-- container -->
		<div class="container theme-showcase" role="main">
		<div class="col-md-5 col-sm-5">
		<div class="row slideanim">
		
			<div class="page-header">
				<h1 style="margin-left:20px">Απεσταλμένα Αιτήματα</h1>
			</div>
			
			
			    <% for(Request r : requests_sent) {  %>
			
					    <div class="container">
						<div class="row">
						
							<div class="col-md-5 ">

								<div class="panel panel-default">
									<div class="panel-heading">  
											<%if (r.getStatus().equals("pending")) { %>
											    <h4 >
												     <a href="viewprofile.jsp?id=<%=r.getReceipientId()%>"><%=r.getFullname()%></a>
													 <button class="btn btn-default btn-sm" type="submit" style="margin-left:150px">Eκρεμεί</button>
											    </h4>
											<% } else if (r.getStatus().equals("accepted")) {  %>	
												<h4 >
												     <a href="viewprofile.jsp?id=<%=r.getReceipientId()%>"><%=r.getFullname()%></a>
													 <button class="btn btn-success btn-sm" type="submit" style="margin-left:140px">Εγκρίθηκε</button>
											    </h4>
										 	<% } else { %>
												 <h4 >
												     <a href="viewprofile.jsp?id=<%=r.getReceipientId()%>"><%=r.getFullname()%></a>
													 <button type="reset" class="btn btn-danger btn-sm" name="cancel" value="cancel" style="margin-left:120px">Απορρίφθηκε</button>
											    </h4>
											<% }%>
									</div>
									
									
										
									<div class="panel-body">
										<div class="box box-info">
											<div class="box-body">
                                                <label class="col-md-4 control-label" for="name">Υπηρεσία:</label>
                                                <%if (r.getCause().equals("bed")) {%>
														<p>φιλοξενία</p>
													<%} else if (r.getCause().equals("wash")) {%>
														<p>πληντύριο</p>
													<%} else if (r.getCause().equals("sight")) {%>
														<p>ξενάγηγη</p>
													<%} else if (r.getCause().equals("food")) {%>
														<p>φαγητό</p>
													<%} else {%>
														<p>δεν έχει επιλεγεί</p>
												<%} %>
												<label class="col-md-4 control-label" for="name">Ημερομηνία/ες:</label>
                                                <p><%=r.getPeriod()%></p>
												<label class="col-md-4 control-label" for="name">Σχόλια:</label>
                                                <p><%=r.getComment()%></p>
													
									        </div>
								        </div>
									</div>
								</div>
							</div>
						</div>
						</div>
				<%  }    %>			
						
						
						
						
						
				
		                
		</div>
		</div>
		</div>
		
		
		</div>	
			
			
	
	
		<!-- footer -->
		<br>
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
