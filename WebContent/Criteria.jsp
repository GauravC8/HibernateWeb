<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,org.hibernate.criterion.*,com.niit.hiber.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Criteria Demo</title>
</head>
<body>
	<%
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf = cfg.buildSessionFactory();
Session sess= sf.openSession();
Criteria cr = sess.createCriteria(User.class);
/* Transaction t= sess.beginTransaction(); no DML no need*/
//to get records having firstname statring with r

/* cr.add(Restrictions.like("name","G%")); */
/* cr.add(Restrictions.eq("id",5)); */
cr.addOrder(Order.asc("name"));
cr.setMaxResults(5);
List<User> list = (List<User>)cr.list();
out.println("List of Employee :"+"<br>");
out.println("<table border='1'>");
out.println("<tr bgcolor='green'>");
out.println("<th>User Id</th>");
out.println("<th>User Name</th>");
out.println("<th>Email</th>");
out.println("</tr>");
Iterator it = list.iterator();
while(it.hasNext())
{
	User u  =(User)it.next();
	out.println("<tr bgcolor='yellow'>");
	out.println("<th>"+u.getId()+"</th>");
	out.println("<th>"+u.getName()+"</th>");
	out.println("<th>"+u.getEmail()+"</th>");
	out.println("</tr>");
}
out.println("</table>");
sess.close();
sf.close();

%>
</body>
</html>