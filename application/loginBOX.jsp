<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="../error.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="UTF-8">
	<title>Sign-Up/Login Form</title>
	<link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	<link href="https://fonts.googleapis.com/css?family=Advent+Pro&amp;subset=greek" rel="stylesheet"> 
	<link rel="stylesheet" href="css/style.css">
	
</head>

<body>
  <div class="form" >
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Εγγραφή</a></li>
        <li class="tab"><a href="#login">Σύνδεση</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Εγγραφή στο κόσμο του adaptorα</h1>
          
			<form action="registerController.jsp" method="post">

				<div class="top-row">
				<div class="field-wrap">
				  <label class="textbox-label">
					Όνομα<span class="req">*</span>
				  </label>
				  <input type="name" name="name" id="name" required autocomplete="off" />
				</div>

				<div class="field-wrap">
				  <label class="textbox-label">
					Επώνυμο<span class="req">*</span>
				  </label>
				  <input type="surname" name="surname" id="surname" required autocomplete="off"/>
				</div>
				</div>

				<div class="field-wrap">
				<label  class="textbox-label">
				  Ηλ/νική Διεύθυνση<span class="req">*</span>
				</label>
				<input type="email" name="email" id="email" required autocomplete="off"/>
				</div>

				<div class="field-wrap">
				<label class="textbox-label">
				  Κωδικός<span class="req">*</span>
				</label>
				<input type="password" name="password" id="password" required autocomplete="off"/>
				</div>

				<div class="field-wrap">
					<select id="selectbasic" name="selectbasic" required>
						<option selected value="">Διάλεξε την πόλη που μένεις</option>
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
				
				<div class="field-wrap">
					<div style="display:inline-block;">
						<input name="gender" value="Male" type="radio" required>
						<label class="col-sm-3 control-label">Άντρας</label>
					</div>
					<div style="display:inline-block;">
						<input name="gender" value="Female" type="radio" required>
						<label class="col-sm-3 control-label">Γυναίκα</label>
					</div>
				</div>		

				<button type="submit" class="button button-block"/>Εγγραφη</button>
          
			</form>
        </div>
        
        <div id="login">   
          <h1>Σύνδεσου στο λογαριασμό σου</h1>
          
          <form action="../loginController.jsp" method="post">
          
            <div class="field-wrap">
				<label>
				  Ηλ/νική Διεύθυνση<span class="req">*</span>
				</label>
				<input name="email" id="email"type="email"required autocomplete="off"/>
			</div>_
          
          <div class="field-wrap">
            <label>
              Κωδικός<span class="req">*</span>
            </label>
            <input name="password" id="password" type="password"required autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="#">Ξέχασες τον κωδικό σου;</a></p>
          
          <button class="button button-block"/>Συνδεση</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script  src="js/index.js"></script>

</body>
</html>
