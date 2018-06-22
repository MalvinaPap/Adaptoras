<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="adaptoras.*"%> 


<% 
	User user = (User) session.getAttribute("user-object");
    session.invalidate();
%>

<jsp:forward page="index_1.jsp"/>
