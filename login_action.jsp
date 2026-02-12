<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

	String a="admin";
	String s="user";

	String c=request.getParameter("usertype");
	String c1 = request.getParameter("name");
	String c2 = request.getParameter("pswrd");
	
System.out.println(c+"  "+c1+""+c2);

	try {
		
	Connection con=DBCon.getConnection();
	Statement st = con.createStatement();
	
	if(c.equals(a)){

		ResultSet rs = st.executeQuery("select * from admin where name='" + c1	+ "' and pwd='" + c2 + "' ");
	if (rs.next()) {
		session.setAttribute("admin",c1);
		response.sendRedirect("admin.html");
	}
	} 
	else if(c.equals(s)){
		ResultSet rs = st.executeQuery("select * from user where name='"+c1+"' and password='"+c2+"'");
	
		if(rs.next()) {
			session.setAttribute("Ne",rs.getString("Name"));
			session.setAttribute("id",rs.getString("id"));
		response.sendRedirect("user.html");
		}
	
	}
	else{
		response.sendRedirect("index.jsp");
	}
} catch (Exception e) {
	e.printStackTrace();
	
}
%>
</body>
</html>