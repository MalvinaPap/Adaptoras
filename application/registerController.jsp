<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="adaptoras.*"%> 
	
	<%     
	       request.setCharacterEncoding("UTF-8");
		   String name = request.getParameter("name");
		   String surname = request.getParameter("surname");
		   String email = request.getParameter("email");
		   String password = request.getParameter("password");
		   String city = request.getParameter("selectbasic");
		   String gender = request.getParameter("gender");
		   
		   DataValidation valid = new DataValidation();
		   
		   boolean v1 = valid.isNameValid(name);
		   boolean v2 = valid.isSurnameValid(surname);
		   boolean v3 = valid.isValidEmailAddress(email);
		   boolean v4 = valid.isPasswordValid(password);
		   boolean v5 = valid.isValidGender(gender);
		   boolean v6 = valid.isCityValid(city);
	

          if (v1 && v2 && v3 && v4 && v5 && v6) {
			   User user= new User(email,password);
	           session.setAttribute("user-object", user);
			   
			   User user1=new User(email,password,name,surname,gender,city);
			 
		       UserDAO.saveUser(user1);
			   request.setAttribute("message", "Επιτυχής Εγγραφή.");
	%>
	           <jsp:forward page="index.jsp"/>
	<%		   
	      }  else {
			   String message = "";
			   if (!v1||!v2){
				  message=message+"Μη έγκυρο Ονοματεπώνυμο (πάνω από 3 χαρακτήρες).  \n";
			   }
			    if (!v3){
				  message=message+"Μη έγκυρο Email.  \n";
				}
				if (!v4){
					message=message+"Μη έγκυρος Kωδικός.  \n";
			    }
				if (!v5){
					message=message+"Δεν έχετε επιλέξει φύλο.  \n";
			    }
				if (!v6){
					message=message+"Δεν έχετε επιλέξει πόλη.  \n";
			    }
				request.setAttribute("message", message);
    %>
	           <jsp:forward page="index_1.jsp"/>
	<%		
	      }
	
	%>	
	
