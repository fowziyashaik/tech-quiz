<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
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
	int i=st.executeUpdate("insert into questionslist(topic,question,option_a,option_b,option_c,option_d,correct_answer,status)values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','0')");
	
	if(i>0)
	{
		%>
		<script type="text/javascript">
		alert("Added Question");
		</script>
		<%
		response.setHeader("Refresh", "0;url=viewquestions.jsp");
	}
	else
	{
		%>
		<script type="text/javascript">
			alert("Connection Error");
		</script>
		<%
		response.setHeader("Refresh", "0;url=addquestions.jsp");
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