<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="lib/bootstrap.min.css">
<script src="lib/jquery.min.js"></script>
<script src="lib/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<table class="table table-striped">
<tr><th>S.NO</th><th>Topic</th><th>Question</th><th>Correct&nbsp;Answer</th><th>User&nbsp;Answer</th></tr>
<%
String uid=session.getAttribute("id").toString();
String ans=null,ans1=null;
int count=0;
int cans=0;
try
{
	Connection con=DBCon.getConnection();
    Statement st = con.createStatement();
	ResultSet rs=st.executeQuery("select * from answer where uid='"+uid+"' ");
	while(rs.next())
	{
		count=count+1;
		Statement stmt1 = con.createStatement();
		ResultSet rs1=stmt1.executeQuery("select * from questionslist where id='"+rs.getString("qid")+"' ");
		if(rs1.next())
		{
			if(rs.getString("u_ans").equals(rs.getString("correct_ans"))){
				cans=cans+1;
			}
			if(rs.getString("u_ans").equals("A")){
				ans=rs1.getString("option_a");
			}
			else if(rs.getString("u_ans").equals("B")){
				ans=rs1.getString("option_b");
			}
			else if(rs.getString("u_ans").equals("C")){
				ans=rs1.getString("option_c");
			}
			else if(rs.getString("u_ans").equals("D")){
				ans=rs1.getString("option_d");
			}
			
			
			if(rs.getString("correct_ans").equals("A")){
				ans1=rs1.getString("option_a");
			}
			else if(rs.getString("correct_ans").equals("B")){
				ans1=rs1.getString("option_b");
			}
			else if(rs.getString("correct_ans").equals("C")){
				ans1=rs1.getString("option_c");
			}
			else if(rs.getString("correct_ans").equals("D")){
				ans1=rs1.getString("option_d");
			}
			%>
			<tr><td><%=count%></td><td><%=rs1.getString("topic") %></td><td><%=rs1.getString("question") %></td><td><%=ans1 %></td><td><%=ans %></td></tr>
			<%
		}
	}
	con.close();
}			
catch(Exception e)
{
	out.println(e);
}
%>
<tr align="center"><td colspan="5">Marks gained <%=cans %> out of <%=count %></td></tr>
</table>
</body>
</html>