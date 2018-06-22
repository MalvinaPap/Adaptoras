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
		<link rel="stylesheet" type="text/css" href="css/navcss.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->		
		
		<link href="https://fonts.googleapis.com/css?family=Advent+Pro:400,500&amp;subset=greek" rel="stylesheet">
		
	</head>
	
	<link rel="shortcut icon" href="images/logoMIX.png" />
		
	<body>
		<!-- Fixed navbar -->
		<div class="example">		 	
			<nav class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
						  <span class="sr-only">Toggle navigation</span>
						  <span class="icon-bar"></span>
						  <span class="icon-bar"></span>
						  <span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="index.jsp"> <input type="image" src="images/adaptoras.png" alt="Submit" style="width:180px;height:75px;margin:0px;padding:0px;"></a>
					</div>

					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-left">
							<li id="search" class="dropdown">
							<form action="results.jsp" class="navbar-form navbar-search" role="search" method="post">
								<div class="input-group">
								
									<div class="input-group-btn">
										<button type="button" class="dropbtn btn btn-search btn-default dropdown-toggle" data-toggle="dropdown">
											<span class="label-icon">Ψάχνω για...</span>
											<span class="caret"></span>
										</button>

										<ul class="dropdown-menu pull-left selection" role="menu" name="city">
										   <li value="sight">
												<a>
													<span class="glyphicon glyphicon-user"></span>
													<span class="label-icon">Φίλο adaptorα</span>
												</a>
											</li>
											<li value="food">
												<a>
												<span class="glyphicon glyphicon-cutlery"></span>
												<span class="label-icon">Ένα πιάτο φαΐ</span>
												</a>
											</li>
											<li value="wash">
												<a>
													<span class="glyphicon glyphicon-tint"></span>
													<span class="label-icon">Μία σκάφη να κάνω μπουγάδα</span>
												</a>
											</li>
											<li value="bed">
												<a>
												<span class="glyphicon glyphicon-home"></span>
												<span class="label-icon">Μια κλίνη να αποκάμω</span>
												</a>
											</li>
											<li class="divider"></li>
											<li value="0"><a href="#all">Ότιδήποτε</a></li>
										</ul>
									</div>
									
								</div>  
								
								<input type="hidden" name="thenumbers">
								
								<input type="text" name="city" placeholder=" πόλη..." class="form-control enjoy-css" />
								
								<button id="btn-searching" type="submit" value="Submit"><span class="glyphicon glyphicon-search"></span></button>
								
							</form>   
							</li>
																
							<li><a href="about.jsp">Σχετικά</a></li>
							
						</ul>
						
						<ul style="font-size:50%" class="nav navbar-nav navbar-right">
							<li><a href="requests.jsp">
								<span class="glyphicon glyphicon-globe"></span> Αιτήματα
							</a></li>
							<li><a href="myprofile.jsp">
								<span class="glyphicon glyphicon-user"></span> Το προφίλ μου</a>
							</li>
							<li><a id="logoutbtn" data-toggle="modal" data-target="#logoutModal">
								<span class="glyphicon glyphicon-log-out"></span> Αποσύνδεση</a>
							</li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				
				</div>
				<!--/.container-fluid -->
			</nav>

		</div>	


		<!-- logout modal -->
		<div id="logoutModal" class="modal fade" role="dialog">
			<div class="modal-dialog" style="width:30%;">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="text-align:center;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Αποσύνδεση </h4>
					</div>
					<div class="modal-body">
						<form method="post" action="logoutController.jsp" class="form-horizontal">
							<div class="form-group">
								<div class="col-sm-7 col-sm-offset-2" style="padding-left:35px;">
									<a href="index.jsp"><button  class="btn btn-success" type="submit">Αποσύνδεση</button></a>
									<button type="reset" class="btn btn-danger" name="cancel" value="cancel">Ακύρωση</button>
								</div>
							</div>
						</form>
					</div> <!-- /.modal-body -->
				</div> <!-- /.modal-content -->
			</div>  <!-- /.modal-dialog -->
		</div> <!-- /#loginModal -->
		<!-- End login modal -->

		<!-- JavaScript files -->
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/script.js"></script> 
		<script src="js/fauxSelect.js"></script> 
	</body>
</html>