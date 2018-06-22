<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
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
			response.sendRedirect("index_1.jsp");
		}
		
		if(request.getAttribute("message") != null) {
			if (request.getAttribute("message").equals("Επιτυχής Εγγραφή.")) { %>	
			<div class="alert alert-success text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
	    <%
		    } else {
	    %>
		    <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
		<%
		    }
		} 
		%>

		<header class="jumbotron main">
        <!-- Main component for a primary marketing message or call to action -->
			<div class="container">
				<div class="row row-header">
					<div class="col-xs-12 col-sm-8 col-md-9">
						<h1>Συνδέσου-Βρες-Προσαρμόσου</h1>
						<p>Είσαι φοιτητής; Πέρασες σε σχολή μακριά από το σπίτι σου; </br>
                           Τότε ο adaptorας είναι η εφαρμογή που ψάχνεις! Ο adaptorας θα σου λύσει τα χέρια! </p>
					</div>
				</div>
			</div>
		</header>

		<div class="container">
			<!-- first row -->
			<div class="row row-content">
				<div class="col-xs-12">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="images/students-things.jpg" alt="girls walking" class="img-responsive">
								<div class="carousel-caption">
									<h2>Φιλοξενία</h2>
									<p>
									<h4>Βρες προσωρινή φιλοξενία όσο αναζητάς στέγη!</h4>
									</p>
								</div>
							</div>
							<div class="item">
								<img src="images/friends-coffee.jpg" alt="friends drinking coffee" class="img-responsive">
								<div class="carousel-caption">
									<h2>Φαγητό</h2>
									<p>
										<h4>Δέξου ένα γεύμα από ανθρώπους που θα το ετοιμάσουν με φροντίδα για εσένα!</h4>
									</p>
									<p>

									</p>
								</div>
							</div>
							<div class="item">
								<img src="images/students-bike.jpg" alt="friends drinking coffee" class="img-responsive">
								<div class="carousel-caption">
									<h2>Φιλία</h2>
									<p>
										<h4>Απόκτησε ένα καινούργιο φίλο που θα σε ξεναγήσει στην πόλη και θα σε βοηθήσει στην προσαρμογή σου!</h4>
									</p>
									<p>

									</p>
								</div>
							</div>

						</div>

						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
						</a>

					</div>
				</div>
			</div>
		</div><!-- /.container -->

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





