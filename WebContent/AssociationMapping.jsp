<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="org.hibernate.*,
	org.hibernate.cfg.Configuration,
	java.util.*,
	com.niit.hiber.Job,
	com.niit.hiber.Person"%>
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

Job job = new Job();
job.setDesignation("Project Manager");
job.setSalary(5000);
job.setJobDescription("Manages Team and Deliveries");


Person person =new Person();
person.setEmailAddress("person@company.com");
person.setJob(job);
person.setName("Person A");

sess.save(person);
t.commit();
sess.close();

sess = sf.openSession();
Person p = (Person)sess.get(Person.class , person.getId());
out.println(p);
sess.close();
%>
</body>
</html>