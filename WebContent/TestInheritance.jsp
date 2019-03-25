<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
	import="org.hibernate.*,
	org.hibernate.cfg.Configuration,
	java.util.*,
	com.niit.hiber.Person1,
	com.niit.hiber.Employee1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf = cfg.buildSessionFactory();
Session sess= sf.openSession();
Transaction t= sess.beginTransaction();

Person1 person = new Person1("Rocky","Balmer");
sess.save(person);


Employee1 employee = new Employee1("James","Grover",new Date(),"Marketing");

sess.save(employee);
out.println("Executed Successfully");
t.commit();
sess.close();


%>
</body>
</html>