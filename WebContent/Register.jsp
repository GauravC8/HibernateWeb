<%@page import="com.niit.hiber.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Hibernate Demo</title>
</head>
<jsp:useBean id="userBean" class="com.niit.hiber.User" />
<jsp:setProperty name="userBean" property="*"/>
<!--  for all properties -->
<%
int i= UserDAO.register(userBean);
if(i>0)
out.println("You are Successfully registered");
%>
<body>
<!-- Controller -->
</body>
</html>
<!-- User.java
UserDAO.java
Register.jsp
index.jsp -->