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
		<meta name="description" content="">
		<meta name="author" content="">

		<title>Δημιουργία Αιτήματος -Adaptorας</title>
		<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" /> 

		<!--Font Awesome (added because you use icons in your prepend/append)-->
		<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

		<link rel="stylesheet" type="text/css" href="css/prof.css">
		<link rel="stylesheet" type="text/css" href="css/calendar.css">
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous">
		<!-- Bootstrap Core CSS -->
		<!--     <link href="css/bootstrap.min.css" rel="stylesheet"> -->
		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
		<link rel="stylesheet" href="css/custom_request.css">
		
		<link rel="stylesheet" href="css/style.css">
		 <link rel="stylesheet" href="css/prism.css">
		 <link rel="stylesheet" href="css/chosen.css">
		<link rel="stylesheet" href="css/request.css">
			
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
			request.setAttribute("message", "You are not authorized to access this resource. Please login.");
		%>
		    <jsp:forward page="index.jsp"/>
		<%
		}
	    String s_id=request.getParameter("sid");
		String r_id=request.getParameter("rid");
		int rid=Integer.parseInt(r_id);
		List<String> provides = UserDAO.getUserProvides(rid);
	    %>
		
		
		<div class="container">
			<div class="row">
			
				<div class="col-md-7 ">

					<div class="panel panel-default">
						<div class="panel-heading">  <h4 >Αποστολή Αιτήματος</h4></div>						
						<div class="panel-body">
							<div class="box box-info">
								<div class="box-body">
										
									<form class="form-horizontal" action="requestController.jsp?rid=<%=r_id%>&sid=<%=s_id%>" method="post">
										<fieldset>
											<!-- Text input-->	
											
											<div class="form-group" style="padding-top: 20px;">
												<!-- αν πατηθει το κουμπι ρικουεστ απο τα αποτελεσματα αναζήτης να γεμιζει αυτόματα -->
												<label class="control-label col-md-4" for="sel1">Ζητάω: </label>
												<div class="col-md-7">
													<select class="form-control" id="department" name="service">
														<option value="0">--- Διάλεξε υπηρεσία ---</option>
														<%for(String p : provides) { %>
														  <option value=<%=p%>><%if(p.equals("wash")){%>Πληντύριο<%} else if(p.equals("bed")){%>Φιλοξενία<%}else if(p.equals("sight")){%>Ξενάγηση<%}else if(p.equals("food")){%>Φαγητό<%}%></option>
												        <%}%>
													</select>
												</div>
											</div>
											
											<div class="form-group" style="padding-top: 20px;">
												<label class="control-label col-md-4" for="sel1">Ημερομηνίες: </label>
												
												<div class="col-md-3">
													<input  type="date" name="date1"  class="form-control" placeholder="mm/dd/yyyy" required>	
												</div>
												<div class="col-md-1">
													<span>έως</span>	
												</div>
												<div class="col-md-3">
													<input  type="date" name="date2"  class="form-control" placeholder="mm/dd/yyyy">	
												</div>
												
												
											</div>
											
											
											
											<div class="form-group" style="padding-top: 20px;">
												<label class="col-md-4 control-label" for="comments">Σχόλια: </label>  
												<div class="col-md-7">                     
													<textarea class="form-control" rows="3"  id="ps" name="ps">....</textarea>
												</div>
											</div>
											
											
											
											<div class="form-group" style="padding-top: 20px;">
												<div class="col-sm-10 col-sm-offset-2">
												   <a href="requests.html"><button class=btn btn-warning fa fa-share" name="submit" type="submit" style="margin-left: 200px;"> Αποστολή</button></a>
												   <button type="reset" class=btn btn-warning fa fa-share" name="cancel" value="cancel">Καθαρισμός πεδίων</button>
												</div>
											</div>
											
											
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end container -->
		
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
		<!-- Extra JavaScript/CSS added manually in "Settings" tab -->
		<!-- Include jQuery -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

		<!-- Include Date Range Picker -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
		<script>
			$(document).ready(function(){
				var date_input=$('input[name="date"]'); //our date input has the name "date"
				var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
				date_input.datepicker({
					format: 'mm/dd/yyyy',
					container: container,
					todayHighlight: true,
					autoclose: true,
				})
			})
		</script>
	
	</body>
</html>