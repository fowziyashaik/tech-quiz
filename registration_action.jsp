<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@page import="Action.Email"%>
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
String s1=request.getParameter("f1");
String s2=request.getParameter("f2");
String s3=request.getParameter("f3");
String s4=request.getParameter("f4");
String s5=request.getParameter("f5");
String s6=request.getParameter("f6");
String s7=request.getParameter("f7");

try
{
	Connection con=DBCon.getConnection();
	Statement st=con.createStatement();
	int i=st.executeUpdate("insert into user(name,qualification,gender,email,mobile,skills,password,status)values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','0')");
	
	if(i>0)
	{
		
		String msg = "You have  register successfully in Quiz Application Username: " + s1+" and password:"+s7+" .";
	    Email.sendMail("Quiz Application",msg, s4);

		
		%>
		<script type="text/javascript">
		alert("Successfully Registered");
		</script>
		<%
		response.setHeader("Refresh", "0;url=index.html");
	}
	else
	{
		%>
		<script type="text/javascript">
			alert("Connection Error");
		</script>
		<%
		response.setHeader("Refresh", "0;url=index.html");
	}
	con.close();
}			
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>