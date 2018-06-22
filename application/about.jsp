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
		<title> Σχετικά -Adaptorας</title>
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		
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
			request.setAttribute("message", "You are not authorized to access this resource. Please login.");
		%>
		    <jsp:forward page="index_1.jsp"/>
		<%
		}
	    %>

		<section id="about" class="section-padding">
		<div class="container">
			<!--<div class="row">-->
				<class = "container-fluid text-center">
					<h1>Οι δυνατότητες σου<small> -Για εσένα που ζητάς</small></h1>
					<p>Μόλις βγήκαν τα αποτελέσματα των Πανελληνίων και έμαθες ότι πέρασες 
					σε σχολή μακριά από την πόλη σου. Αρχικά <b><font color="#FF8000"> συγχαρητήρια!</font></b> Ήρθε η στιγμή 
					να ζήσεις τη μοναδική εμπειρία της φοιτητικής ζωής που όλοι σου υπόσχονταν.</p>
					<p>Στη συνέχεια  όμως, ερωτήματα όπως τα παρακάτω αρχίζουν να σε περιτριγυρίζουν…</p>
					<p>Ηρέμισε, διότι ο σκοπός του adaptorα είναι να απαντήσει έμπρακτα σε κάθε έναν από τους πιθανούς σου προβληματισμούς.<br><br></p>
			 
			<div class="row slideanim">	
				<div class="col-md-6 col-sm-6">
					<h3 class=""> <button class="btn btn-warning fa fa-share" name="food" type="submit">
					<span class="glyphicon glyphicon-home"></span></button> Πόσο γρήγορα θα βρω σπίτι;</h2>
					<b><hr class="botm-line"></b>
						<p> Μέσω της συγκεκριμένης εφαρμογής θα σου δοθεί η δυνατότητα να ζήσεις
						μια πρωτόγνωρη εμπειρία φιλοξενίας από ντόπιους ώστε να γίνει η αναζήτηση
						κατοικίας ξέγνοιαστα. Ο «adaptorας» θα σε φέρει σε επαφή με ανθρώπους που μπορούν
						να ανοίξουν την πόρτα του σπιτιού τους για εσένα μέχρι να βρεις σπίτι. Έτσι,
						θα εξοικονομήσεις τα χρήματα που θα έδινες σε κάποιο ξενοδοχείο για τις αντίστοιχες μέρες,
						ενώ παράλληλα θα έχεις μια έγκυρη πηγή για τα καλά ακίνητα στην πόλη. 
						Ταυτόχρονα, θα γνωρίσεις ανθρώπους έτοιμους να λύσουν τις αρχικές σου απορίες.<br><br>
						</p>
				</div>
				<div class="col-md-6 col-sm-6">
					<h3 class=""> <button class="btn btn-warning fa fa-share" name="food" type="submit">
					<span class="glyphicon glyphicon-user"></span></button> Η μελλοντική γειτονιά μου θα έχει ότι χρειάζομαι;</h3>
					<b><hr class="botm-line"></b>
					<p> Συνδέσου στον «adaptorα» και βρες άτομα που έχουν τη διάθεση να σου δείξουν
						κάθε μέρος στη νέα πόλη. Από τα πιο χρήσιμα και αναγκαία, μέχρι τα καλύτερα
						μαγαζιά για διασκέδαση αλλά και τα πιο απόμερα για ηρεμία και χαλάρωση… 
						<b>Γνώρισε τους, γνώρισε την πόλη, γνώρισε κομμάτια της νέας σου ζωής!</b><br>
					</p>
				</div>
			</div>
			<div class="row slideanim">	
				<div class="col-md-6 col-sm-6">
					<h3 class=""> <button class="btn btn-warning fa fa-share" name="food" type="submit">
					<span class="glyphicon glyphicon-cutlery"></span></button> Οχχχ… το πορτοφόλι μου θα αδειάσει και
					το delivery θα πίνει νερό στο όνομα μου;</h3>
					<b><hr class="botm-line"></b>
					<p> Για εσένα που δεν ξέρεις να βράζεις ούτε μακαρόνια ενώ ονειρεύεσαι παστίτσιο,<br> 
					για εσένα που λόγω της αναστάτωσης που λόγω της πρόσφατης μετακόμισης δεν έχεις 
					ετοιμοπόλεμη την κουζίνα,<br> για εσένα που λόγω φόρτου εργασίας δεν προλαβαίνεις να μαγειρέψεις 
					ή<br> για εσένα που απλά δεν έχεις όρεξη να μαγειρέψεις και παρόλα αυτά επιθυμείς σπιτικό φαγητό… 
					<p>Στον «adaptorας» υπάρχουν άλλοι άνθρωποι φοιτητές ή μη, που αφουγκράζονται τις ανάγκες σου, 
					έχουν ένα φαγητό παραπάνω και θα ήθελαν να στο δώσουν.<br></p>
					</p>
				</div>
				<div class="col-md-6 col-sm-6">
					<h3 class=""> <button class="btn btn-warning fa fa-share" name="food" type="submit">
					<span class="glyphicon glyphicon-tint"></span></button> Τι θα γίνει με τα ρούχα μου; Θα βάζω πλυντήριο; Αν το νέο μου σπίτι δεν έχει, θα πρέπει να αγοράσω αναγκαστικά; </h3>
					<b><hr class="botm-line"></b>
					<p> Ξέρουμε, ξέρουμε, είσαι παιδί για σπίτι. Γι’ αυτό και εμείς νοικοκύρη φοιτητή θέλουμε
					να συνδράμουμε στο έργο σου. Στην κακιά την ώρα που θα σου χαλάσει το πλυντήριο αν έχεις,
					ή αν δεν έχεις ο «adaptoρας» θα είναι εκεί. Όχι, δεν είμαστε τεχνικοί, αλλά θα σε δια συνδέσουμε με
					άλλους οι οποίοι θα είναι διατεθειμένοι να βάλουν το πλυντήριο τους να δουλέψει και για εσένα...</p>
					<br></p>
				</div>	
			</div>
		</div>
		</section>

		<!-- footer -->
		<footer>
			<div class="container">
				<div class="row">             
					<div class="col-xs-12">
						<br><br><p class="text-center">&copy; Copyright 2017 Adaptoras</p>
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