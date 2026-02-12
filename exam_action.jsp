<%@page import="java.sql.*"%>
<%@page import="Action.DBCon"%>
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
String uid=session.getAttribute("id").toString();

String type=request.getParameter("type");
String qid=request.getParameter("qid");
String correct_ans=request.getParameter("correct_ans");
String u_ans=request.getParameter("u_ans");

try
{
	Connection con=DBCon.getConnection();
	Statement st=con.createStatement();
	int i=st.executeUpdate("insert into answer(uid,qid,u_ans,correct_ans,status)values('"+uid+"','"+qid+"','"+u_ans+"','"+correct_ans+"','0')");
	
	if(i>0)
	{
		response.sendRedirect("exam.jsp?type="+type);
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