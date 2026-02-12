<%@page import="Action.DBCon"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
<%@page import="java.sql.*"%>
<%@page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="java.io.OutputStream"%>
<%@page import="org.jfree.chart.ChartRenderingInfo"%>
<%@page import="java.awt.BasicStroke"%>
<%@page import="java.awt.Color"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.data.jdbc.JDBCPieDataset"%>

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
	Connection con=DBCon.getConnection();
	Statement st=con.createStatement();
ResultSet	rs = st.executeQuery("select * from user" );
    DefaultPieDataset dataset = new DefaultPieDataset( );
    
    while( rs.next( ) ) {
       dataset.setValue( 
       rs.getString( "name" ) ,
       Double.parseDouble( rs.getString( "password" )));
    }
JFreeChart chart = ChartFactory.createPieChart("QuizApp", dataset, true, true, false);
chart.setBorderPaint(Color.black);
chart.setBorderStroke(new BasicStroke(10.0f));
chart.setBorderVisible(true);
if (chart != null) {
int width = 500;
int height = 350;
final ChartRenderingInfo info = new ChartRenderingInfo (new StandardEntityCollection());
response.setContentType("image/png");
OutputStream outt=response.getOutputStream();
ChartUtilities.writeChartAsPNG(outt, chart, width, height,info);
}
}catch (SQLException e) {
e.printStackTrace();
}
%>
</body>
</html>