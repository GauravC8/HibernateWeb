<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,com.niit.hiber.User"%>
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
Query query =sess.createQuery("From User");
List<User> list = (List<User>)query.list();
for(User st :list)
{
	out.println(st.getId() + " " + st.getName() + " " + st.getEmail() + "<br>");
}

out.println("<br>");
out.println("<br>");

String hql = "Select U.name from User U";
query = sess.createQuery(hql);
List<String> list1 = (List<String>)query.list();
out.println("List of Names <br>");
for(String st :list1)
{
	out.println(st +"<br>");
}

out.println("<br> Counting all User <br>");
out.println("<br> ");

query =sess.createQuery("Select count(*) from User");
List<Integer> list2 = query.list();
out.println("Total Names::<br>");
out.println(list2.get(0)+"<br>");

out.println("<br>Named Parameter");
out.println("<br> ");

query =sess.createQuery("From User U where U.id=:id");
query.setInteger("id", 2);
List<User> list3 = (List<User>)query.list();
for(User st :list3)
{
	out.println(st.getId() + " " + st.getName() + " " + st.getEmail());
}

out.println("<br>");
out.println("<br>");
out.println("Order By");
out.println("<br>");

query =sess.createQuery("From User U order by U.name");
List<User> list4 = (List<User>)query.list();
for(User st :list4)
{
	
	out.println(st.getId() + "\t" + st.getName() + "\t " + st.getEmail()+ "<br>");
}



t.commit();
sess.close();
sf.close();
%>
</body>
</html>