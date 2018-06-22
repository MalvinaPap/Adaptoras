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
		<link rel="stylesheet" href="css/style.css">
		 <link rel="stylesheet" href="css/prism.css">
		 <link rel="stylesheet" href="css/chosen.css">
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
		<link rel="stylesheet" href="css/editprofile.css">
		
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
		
	    %>
		
		<div class="container">
			<div class="row">     						  
				<div class="col-md-12 ">
					<div class="panel panel-default">
						<div class="panel-heading">  <h4 >Επεξεργασία Προφίλ Χρήστη-Συμπλήρωσε τα πεδία που θέλεις να αλλάξεις</h4></div>
						<div class="panel-body">
							<div class="box box-info">
								<div class="box-body">
										
									
									<div class="col-md-9">
									<form class="form-horizontal" action="editController.jsp" method="post">
										<fieldset>
											<!-- Text input-->
											<br>
											<div class="form-group">
												<label class="col-md-4 control-label" for="name">Όνομα: </label>  
												<div class="col-md-5">
												 <div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-user">
														</i>
													</div>
													   <input id="name" name="name" type="text" placeholder=<%=user.getName()%> class="form-control input-md box-input">
													</div>
												 </div>
											</div>
											<div class="form-group">
												<label class="col-md-4 control-label" for="surname">Επώνυμο: </label>  
												<div class="col-md-5">
												 <div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-user">
														</i>
													</div>
													   <input id="surname" name="surname" type="text" placeholder=<%=user.getSurname()%> class="form-control input-md box-input">
													</div>
												 </div>
											</div>
											<!-- File Button --> 
											
											<!-- Text input-->
											<div class="form-group">
												<label class="col-md-4 control-label" for="Date Of Birth">Ημερομηνία γέννησης: </label>  
												<div class="col-md-5">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-birthday-cake"></i>	
														</div>
														<input id="bd" name="bd" type="text" <% if (user.getBirthday()==null) { %> placeholder="yyyy-mm-dd"<%} else {%> placeholder=<%=user.getBirthday()%> <%}%> class="form-control input-md box-input">
													</div>
												</div>
											</div>
											
											
											<!-- Multiple Radios (inline) -->
											<div class="checkbox">
												<label class="col-md-4 control-label" for="Gender"><b>Φύλο:  </b></label>
												<div class="col-md-5"> 
													<label class="radio-inline" for="Gender-0">
														<input type="radio" name="gender" id="Gender-0" value="Male" <% if (user.getGender().equals("Male")) {%> checked<%}%>>
														Άντρας
													</label> 
													<label class="radio-inline" for="Gender-1">
														<input type="radio" name="gender" id="Gender-1" value="Female"  <% if (user.getGender().equals("Female")) {%> checked<%}%>>
														Γυναίκα
													</label> 
												</div>
											
											<div class="form-group">
												<label class="col-md-4 control-label" for="lives city">Πόλη διαμονής/σπουδών: </label>  
												<div class="col-md-5">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-home"></i>
														</div>
														<input id="lives" name="lives" type="text" placeholder=<%=user.getLives()%> class="form-control input-md box-input">
													</div> 
												</div>
											</div>

											<div class="form-group">
												<label class="col-md-4 control-label" for="lives city">Πόλη καταγωγής: </label>  
												<div class="col-md-5">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-home"></i>	
														</div>
														<input id="from" name="from" type="text" <% if (user.getFrom()==null) { %> placeholder="πόλη καταγωγής"<%} else {%> placeholder=<%=user.getFrom()%> <%}%> class="form-control input-md box-input">
													</div> 
												</div>
											</div>
											

											<!-- Text input-->
											<div class="form-group">
												<label class="col-md-4 control-label" for="Email Address">Ηλ/νική Διεύθυνση: </label>  
												<div class="col-md-5">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-envelope-o"></i>
														</div>
														<input id="email" name="email" type="text" placeholder=<%=user.getEmail()%> class="form-control input-md box-input">
													</div>
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-4" for="sel2">Προσφέρω: </label>
												<div class="col-md-5" id="sel2">
													<select name="provides" class="chosen-select" multiple="multiple" tabindex="3">
														<option>Επίλεξε υπηρεσίες που θες να προσφέρεις</option>
														<option value="bed">Φιλοξενία</option>
														<option value="food">Φαγητό</option>
														<option value="wash">Πλυντήριο</option>
														<option value="sight">Ξενάγηση</option>
													</select>
												</div>
											</div> 

											<div class="form-group">
												<label class="control-label col-md-4" for="sel2">Ενδιαφεροντα: </label>
												<div class="col-md-5" id="sel2">
													<select name="interests" class="chosen-select" multiple="multiple" tabindex="3">
														<option>--- Διάλεξε τα ενδιαφέροντά σου ---</option>
														<option value="Αθλητισμός">Αθλητισμός</option>
														<option value="Χορός">Χορός</option>
														<option value="Μουσική">Μουσική</option>
														<option value="Ταξίδια">Ταξίδια</option>
														<option value="Βιβλία">Βιβλία</option>
														<option value="Ιστιοπλοϊα">Ιστιοπλοϊα</option>
														<option value="Ταινίες">Ταινίες</option>
														<option value="Τέχνες">Τέχνες</option>
														<option value="Πεζοπορίες">Πεζοπορίες</option>
													</select>
												</div>
											</div> 


											<!-- Textarea -->
											<div class="form-group">
												<label class="col-md-4 control-label" for="Overview (max 200 words)">Περιγραφή (έως 200 λέξεις)</label>
												<div class="col-md-5"> 										
													<textarea class="form-control" rows="10"  id="description"  name="description"><%if (user.getDescription()==null) {out.print(" ");} else {out.print(user.getDescription());}%></textarea>
												</div>
											</div>


											<div class="form-group">
												<label class="col-md-4 control-label" ></label>  
												<div class="col-md-5">
												    <a href="#"><button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-thumbs-up"></span> Αποθήκευση</button></a>
									                <button type="reset" class="btn btn-danger" name="cancel" value="cancel"><span class="glyphicon glyphicon-remove-sign"></span> Καθαρισμός πεδίων</button>
												</div>
											</div>

										</fieldset>
									</form>	
									</div>
									
									
									<div class="col-md-3">
									<form action="#" method="post" enctype="multipart/form-data">
										<div style="margin-right:60px; margin-top:40px;">
											<img alt=".." src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive"> 
										</div>
										<label class="btn btn-default btn-file btn-sm" style="margin-top:5px;">
													<b>---επίλεξε εδώ εικόνα προφίλ---</b><input type="file" name="uploadFile" style="display: none; ">
												<div>
												</div>
										</label>
										<input type="submit" value="Upload">
									</form>
									</div>
									
									<!-- /input-group -->
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>			
					</div> 
				</div>
			</div>  
			 	   
		</div>

		<!-- jQuery Version 1.11.1 -->
		<script src="js/jquery.js"></script>
		<script src="js/chosen.jquery.js" type="text/javascript"></script>
        <script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/init.js" type="text/javascript" charset="utf-8"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>
        <!-- JavaScript files -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>

</html>




         