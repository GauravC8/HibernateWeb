<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="org.hibernate.*,
	org.hibernate.cfg.Configuration,
	java.util.*,
	com.niit.hiber.StudentClass,
	com.niit.hiber.Student"%>
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
StudentClass studentClass =new StudentClass("IT2","BE1");
Student student = new Student("Ankita","Rao","BE/01/15",26,studentClass);
sess.save(student);
t = sess.beginTransaction();
List<Student> students = sess.createQuery("FROM Student").list();
for(Student student2 : students){
	out.println("First Name: " + student2.getFirstName() + "<br>");
	out.println("Last Name: " +student2.getLastName() + "<br>");
	out.println("Roll No : "+student2.getRollNo() + "<br>");
	out.println("Age : "+student2.getAge() + "<br>");
	
	StudentClass studentClass2 = student.getStudentClass();
	out.println("Class Name : "+studentClass2.getClassName() + "<br>");
	out.println("Class Id : "+studentClass2.getClassId() + "<br>");
}
t.commit();
sess.close();




%>
</body>
</html>