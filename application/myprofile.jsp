<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.sql.ResultSet"%> 
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

		<title>Το Προφίλ μου -Adaptorας</title>
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
			request.setAttribute("message", "You are not authorized to access this resource. Please login.");
		%>   
		    
		    <jsp:forward page="index_1.jsp"/>
		<%
		   
		}
	    int id=UserDAO.getUserId(mail);
		User user=UserDAO.getUserData(id);
		List<String> provides = UserDAO.getUserProvides(id);
		List<String> interests = UserDAO.getUserInterests(id);
		List<Comment> comments= CommentDAO.getUserComments(id);
		
	    %>
		
		<div class="container">
					<div class="row">     				
				<div class="col-md-11">
		
					<div class="panel panel-default">
						<div class="panel-heading">  <h4 >Προφίλ Χρήστη</h4></div>				
						
						<br>
						
						<a href="editprofile.jsp" class="btn btn-info btn-md col-md-offset-11" style="margin-left: 905px;margin-top:25px;" >
							<span class="fa fa-share" ></span> Επεξεργασία
						</a>
						
						<div class="panel-body">
							<div class="box box-info">
								<div class="box-body">
									<div class="col-md-5">
										
										<div align="center"> 
										
											<div class="row">
												<img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive" width="200px">
											</div>
											
											<br>
											<br>
											
											<div class="row">
												<div class="form-group col-md-11 col-md-offset-1">
													<textarea style="margin-right:0px;"class="form-control" rows="4"  id="Overview (max 200 words)" name="Overview (max 200 words)" style="margin-left: 25px"><%if (user.getDescription()==null) {out.print(" ");} else {out.print(user.getDescription());}%></textarea>
												</div>
											</div>

										</div>
										
										<br>
										
									</div>
									
									<div class="col-md-6 col-md-offset-1">
									
										<h4 style="color:#00b1b1;"><%out.print(user.getName());%></h4></span><br>
										
																			
										<div class="row">
											<div class="form-group">								
												<button type="button" <% if (provides.contains("wash")) {%> class="active btn-sm btn btn-warning" <%} else {%> class="disabled btn-sm btn btn-default"<%}%>>Πλυντήριο</button>			
												<button type="button" <% if (provides.contains("sight")) {%> class="active btn-sm btn btn-warning" <%} else {%> class="disabled btn-sm btn btn-default"<%}%>>Ξενάγηση</button> 
												<button type="button" <% if (provides.contains("bed")) {%> class="active btn-sm btn btn-warning" <%} else {%> class="disabled btn-sm btn btn-default"<%}%>>Στέγη</button>
												<button type="button" <% if (provides.contains("food")) {%> class="active btn-sm btn btn-warning" <%} else {%> class="disabled btn-sm btn btn-default"<%}%>>Φαγητό</button>
												<br><br>
											</div>
										</div>
										
										<div class="row">
											<div class="form-group">
												<label class="control-label" for="Name (Full name)">Ονοματεπώνυμο:</label>  
												<label class="control-label" for="Name (Full name)"><%out.print(user.getName());%><%out.print(" "+user.getSurname());%></label> 
											</div>
										</div>
										
										<div class="row">
											<div class="form-group">
												<label class="control-label" for="Name (Full name)">Ημερομηνία γέννησης: </label>  
												<label class="control-label" for="Name (Full name)"><%if (user.getBirthday()==null) {out.print(" ");} else {out.print(user.getBirthday());}%></label> 
											</div>
										</div>
										
										<div class="row">
											<div class="form-group">
												<label class="control-label" for="Name (Full name)">Πόλη διαμονής/σπουδών: </label>  
												<label class="control-label" for="Name (Full name)"><%out.print(user.getLives());%></label> 
											</div>
										</div>
										
										<div class="row">
											<div class="form-group">
												<label class="control-label" for="Name (Full name)">Πόλη καταγωγής: </label>  
												<label class="control-label" for="Name (Full name)"><%if (user.getFrom()==null) {out.print(" ");} else {out.print(user.getFrom());}%></label> 
											</div>
										</div>
										
		
										
										<div class="row">
											<div class="form-group">
												<label class="control-label" for="Name (Full name)">Ηλ/νική Διεύθυνση: </label>  
												<label class="control-label" for="Name (Full name)"><%out.print(user.getEmail());%> </label> 
											</div>
										</div>
										
										<div class="row">
											<div class="form-group">
												<label class="control-label" for="Name (Full name)">Ενδιαφέρονταροντα: </label>  
												
												<%for(String interest : interests) { %>
												<button type="button" class="btn-sm btn"><%out.print(interest);%></button>
											    <%}%>		
											</div>
										</div>
										
										
									</div>
								</div>										
							</div>		
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>	
				</div> 
			</div>


			<div class="row">     
				
				<div class="col-md-11 ">

					<div class="panel panel-default">
						<div class="panel-heading">  <h4 >Σχόλια</h4></div>	
		
					
						
						<div class="panel-body">
							<div class="box box-info">
								<div class="box-body">
								
									<div class="container">									
										
										<%for(Comment comment : comments) { %>
											<div class="row">
												<div class="col-md-1">
													<div class="thumbnail">
														<img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
													</div><!-- /thumbnail -->
												</div><!-- /col-sm-1 -->

												<div class="col-md-6">
													<div class="panel panel-default">
														<div class="panel-heading">
															<a href="viewprofile.jsp?id=<%=comment.getSid()%>"><strong><%out.print(comment.getName());%><%out.print(" "+comment.getSurname());%></strong> </a><span class="text-muted"><%out.print(comment.getDate());%></span>
														</div>
														<div class="panel-body">
														   <%out.print(comment.getComment());%>
														</div>
													</div>
												</div>
											</div>
										<%}%>
									
										
										
									</div>
									
									
									
									
									
								
											

					<!-- /.box-body -->
								</div>
					  <!-- /.box -->

							</div>
				   
						
						</div> 
					</div>
					<br>									
				</div> 
			</div>
		</div>

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
			
			
			<script>
					  $(function() {
			$('#profile-image1').on('click', function() {
				$('#profile-image-upload').click();
			});
		});       
					  </script> 
			   
			   
		
		

		<!-- jQuery Version 1.11.1 -->
		<script src="js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>
        <!-- JavaScript files -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>

</html>




         