<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,com.niit.hiber.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HQL DML Operation</title>
</head>
<body>
<%
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf = cfg.buildSessionFactory();
Session sess= sf.openSession();
Transaction t= sess.beginTransaction();


Query query =sess.createQuery("Update User set password =:password where id = :id");
query.setParameter("password", "pass578");
query.setParameter("id", 2);

int rowaffected = query.executeUpdate();
out.println("<br>"+"Number of row Affected" + rowaffected);


query = sess.createQuery("DELETE FROM User where id= :id");
query.setParameter("id",new Integer(3));
int result =query.executeUpdate();
out.println("Row Affected" + result);

%>
</body>
</html>