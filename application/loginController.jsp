<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex2_8150108.jsp"%>
<%@ page import="adaptoras.*"%> 


    
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
  
	try {
	    UserDAO.authenticate(email,password);
    } catch(Exception e) {
        request.setAttribute("message", e.getMessage());
%>
       <jsp:forward page="index.jsp"/>	
<%	
	}
	User user= new User(email,password);
	session.setAttribute("user-object", user);
%>		
<jsp:forward page="index.jsp"/>
  
  
  
  
