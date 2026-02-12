<%@page import="java.sql.*"%>
<%@page import="Action.DBCon"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>


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
		try {
			int ii=0;
			String s1 = request.getParameter("f1");
			String file = request.getParameter("f2");
			File excelFile = null;
			FileInputStream fileInputeStream = null;
			Workbook workbook = null;
			Sheet sheet = null;
			Row row = null;
			excelFile = new File("D:/" + file);
			fileInputeStream = new FileInputStream(excelFile);
			//System.out.println(fileInputeStream);
			workbook = WorkbookFactory.create(fileInputeStream);
			sheet = workbook.getSheetAt(0); 
			int lastRow = sheet.getLastRowNum();
			for (int i = sheet.getFirstRowNum() + 1; i <= lastRow; i++) {
				row = (Row) sheet.getRow(i);
				String s2 = row.getCell(0).getStringCellValue();
				String s3 = row.getCell(1).getStringCellValue();
				String s4 = row.getCell(2).getStringCellValue();
				String s5 = row.getCell(3).getStringCellValue();
				String s6 = row.getCell(4).getStringCellValue();
				String s7 = row.getCell(5).getStringCellValue();
				String ss="insert into questionslist(topic,question,option_a,option_b,option_c,option_d,correct_answer,status)values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','0')";
				Connection con=DBCon.getConnection();
				Statement st=con.createStatement();
				ii=st.executeUpdate(ss);
			}
			if(ii>0)
			{
				%>
				<script type="text/javascript">
				alert("Added Question");
				</script>
				<%
				response.setHeader("Refresh", "0;url=questions_view.jsp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	%>
</body>
</html>