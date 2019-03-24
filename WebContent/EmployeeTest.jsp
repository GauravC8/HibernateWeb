<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,com.niit.hiber.Employee"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
Session sess  = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
Transaction t =sess.beginTransaction();
Employee employee = new Employee();
employee.setEmployeeName("Gaurav");
Set<String> phoneNumbers =new HashSet<String>();
phoneNumbers.add("963850");
phoneNumbers.add("863859");
phoneNumbers.add("763858");
phoneNumbers.add("663857");
employee.setPhoneNumbers(phoneNumbers);
sess.save(employee);
t.commit();
Query query =sess.createQuery("From Employee");
List<Employee> list = query.list();
Iterator<Employee> it = list.iterator();

while(it.hasNext())
{
	Employee emp  = it.next();
	out.println("Employeee Name :"+emp.getEmployeeName());
	
	Set<String> set = emp.getPhoneNumbers();
	Iterator<String> it2 = set.iterator();
	while(it2.hasNext()){
		out.println(it2.next());
	}
	out.println("<br>");
}
sess.close();

%>
</body>
</html>