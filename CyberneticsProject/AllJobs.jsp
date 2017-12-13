<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<body bgcolor="skyblue">
<table BORDER='1'>

<!--<tr><td>Sl.NO</td><td>TITLE</td><td>DISCRIPTION</td></tr>-->
<%

//String title=request.getParameter("storytitle");
//String desc=request.getParameter("description");
Statement ps=null;
CallableStatement cs=null;

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("Hai1");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");
System.out.println("Hai");

ps=con.createStatement();

  ResultSet res=ps.executeQuery("select JOB_TITLE from JOBS_POST");
 while(res.next())
	{
%>
<tr><td><b><i><%=res.getString(1)%></td></B></I></tr>

<%
 
 }
}catch(Exception e)
{
e.printStackTrace();
}
%>
<table>