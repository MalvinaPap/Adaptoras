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
							<li><a id="loginbtn" data-toggle="modal" data-target="#loginModal">
								<span class="glyphicon glyphicon-log-in"></span> Σύνδεση</a>
							</li>
							<li><a id="registerbtn" data-toggle="modal" data-target="#RegisterModal">
								<span class="glyphicon glyphicon-user"></span> Εγγραφή</a>
							</li>
						</ul>

					</div>
					<!--/.nav-collapse -->
				
				</div>
				<!--/.container-fluid -->
			</nav>

		</div>	
		
		
		<!-- login modal -->
		<div id="loginModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Σύνδεση </h4>
					</div>
					<div class="modal-body">

						<form  method="post" action="loginController.jsp" class="form-horizontal">
							<div class="form-group">
								<label for="email" class="col-sm-2 control-label">Ηλ/νική Διεύθυνση</label>
								<div class="col-sm-10">
									<input type="email" name="email" id="email" class="form-control" placeholder="Ηλ/νική Διεύθυνση" required>
								</div>							
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">Κωδικός</label>
								<div class="col-sm-10">
									<input type="password" name="password" id="password" class="form-control" placeholder="κωδικός" required>
								</div>								
							</div>
							<div class="form-group">
								<div class="col-sm-10 col-sm-offset-2">
									<label class="checkbox-inline"><input type="checkbox" name="rememberme"> Θυμίσου με</label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10 col-sm-offset-2">
									<a href="#"><button class="btn btn-success" type="submit">Σύνδεση</button></a>
									<button type="reset" class="btn btn-danger" name="cancel" value="cancel">Ακύρωση</button>
								</div>
							</div>
							
						</form>
					</div> <!-- /.modal-body -->
				</div> <!-- /.modal-content -->
			</div>  <!-- /.modal-dialog -->
		</div> <!-- /#loginModal -->
		<!-- End login modal -->

		
		<!-- register modal -->
		<div id="RegisterModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Εγγραφή </h4>
					</div>
					<div class="modal-body">

						<form  class="form-horizontal" action="registerController.jsp" method="post" >
						    <div class="form-group">
								<label for="name" class="col-sm-2 control-label">Όνομα</label>
								<div class="col-sm-4">
									<input type="name" name="name" id="name" class="form-control" placeholder="Όνομα" required>
								</div>	
                                <label for="surname" class="col-sm-2 control-label">Επώνυμο</label>
								<div class="col-sm-4">
									<input type="surname" name="surname" id="surname" class="form-control" placeholder="Επώνυμο" required>
								</div>									
							</div>
							
							
							
							<div class="form-group">
								<label for="email" class="col-sm-2 control-label">Ηλ/νική Διεύθυνση</label>
								<div class="col-sm-10">
									<input type="email" name="email" id="email" class="form-control" placeholder="Ηλ/νική Διεύθυνση" required>
								</div>							
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">Κωδικός</label>
								<div class="col-sm-10">
									<input type="password" name="password" id="password" class="form-control" placeholder="Κωδικός" required>
								</div>								
							</div>
							
							<div class="form-group">
							<label for="city" class="col-sm-2 control-label">Πόλη</label>
							    <div class="col-md-10">
								<select id="selectbasic" name="selectbasic" class="form-control">
									<option value="0" >***Διάλεξε την πόλη που μένεις***</option>
									<option value="Άγιος Νικόλαος">Άγιος Νικόλαος</option>
                                    <option value="Αγρίνιο">Αγρίνιο</option>									
									<option value="Αθήνα">Αθήνα</option>
									<option value="Αίγιο">Αίγιο</option>
									<option value="Αλεξανδρούπολη">Αλεξανδρούπολη</option>
									<option value="Αμαλιάδα">Αμαλιάδα</option>
									<option value="Άρτα">Άρτα</option>
									<option value="Βόλος">Βόλος</option>
									<option value="Γρεβενά">Γρεβενά</option>
									<option value="Διδυμότειχο">Διδυμότειχο</option>
									<option value="Ζάκυνθος">Ζάκυνθος</option>
									<option value="Ηγουμενίτσα">Ηγουμενίτσα</option>
									<option value="Ηράκλειο">Ηράκλειο</option>
									<option value="Θεσσαλονίκη">Θεσσαλονίκη</option>
									<option value="Θήβα">Θήβα</option>
									<option value="Ιεράπετρα">Ιεράπετρα</option>
									<option value="Ιωάννινα">Ιωάννινα</option>
									<option value="Καβάλα">Καβάλα</option>
									<option value="Καλαμάτα">Καλαμάτα</option>
									<option value="Καρδίτσα">Καρδίτσα</option>
									<option value="Καρπενήσι">Καρπενήσι</option>
									<option value="Καστοριά">Καστοριά</option>
									<option value="Κατερίνη">Κατερίνη</option>
									<option value="Κέρκυρα">Κέρκυρα</option>
									<option value="Κεφαλονιά">Κεφαλονιά</option>
									<option value="Κιλκίς">Κιλκίς</option>
									<option value="Κοζάνη">Κοζάνη</option>
									<option value="Κομοτηνή">Κομοτηνή</option>
									<option value="Κόρινθος">Κόρινθος</option>
									<option value="Λαμία">Λαμία</option>
									<option value="Λάρισα">Λάρισα</option>
									<option value="Λευκάδα">Λευκάδα</option>
									<option value="Λήμνος">Λήμνος</option>
									<option value="Μεσολόγγι">Μεσολόγγι</option>
									<option value="Μυτιλήνη">Μυτιλήνη</option>
									<option value="Ναύπακτος">Ναύπακτος</option>
									<option value="Ναύπλιο">Ναύπλιο</option>
									<option value="Νέα Μουδανιά">Νέα Μουδανιά</option>
									<option value="Ξάνθη">Ξάνθη</option>
									<option value="Ορεστιάδα">Ορεστιάδα</option>
									<option value="Πάτρα">Πάτρα</option>
									<option value="Πειραιάς">Πειραιάς</option>
									<option value="Πρέβεζα">Πρέβεζα</option>
									<option value="Πύργος">Πύργος</option>
									<option value="Ρέθυμνο">Ρέθυμνο</option>
									<option value="Ρόδος">Ρόδος</option>
									<option value="Σάμος">Σάμος</option>
									<option value="Σέρρες">Σέρρες</option>
									<option value="Σητεία">Σητεία</option>
									<option value="Σπάρτη">Σπάρτη</option>
									<option value="Σπέτσες">Σπέτσες</option>
									<option value="Σύρος">Σύρος</option>
									<option value="Τρίκαλα">Τρίκαλα</option>
									<option value="Τρίπολη">Τρίπολη</option>
									<option value="Φλώρινα">Φλώρινα</option>
									<option value="Χαλκίδα">Χαλκίδα</option>
									<option value="Χανιά">Χανιά</option>
									<option value="Χίος">Χίος</option>
									
									
                                </select>
								</div>
							</div>
							
							<div class="checkbox" style="margin-left:80px;">
								<label class="col-sm-2 control-label">
									<input name="gender" value="Male" type="radio" >
									Άντρας
								</label>
								<label class="col-sm-2 control-label">
									<input name="gender" value="Female" type="radio" >
									Γυναίκα
								</label>
								
							</div>
							<br></br>
							
							<div class="form-group">
								<div class="col-sm-10 col-sm-offset-2">
									<a href="#"><button class="btn btn-success" type="submit">Εγγραφή</button></a>
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
