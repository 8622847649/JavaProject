<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<body bgcolor="skyblue">
<table BORDER='1'>

<tr><td>Sl.NO</td><td>TITLE</td><td>DISCRIPTION</td></tr>
<%

String title=request.getParameter("storytitle");
String desc=request.getParameter("description");
Statement ps=null;
CallableStatement cs=null;

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("Hai1");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");
System.out.println("Hai");

ps=con.createStatement();

  ResultSet res=ps.executeQuery("select * from success_stories");
 while(res.next())
	{
%>
<tr><td><%=res.getInt(1)%></td><td><%=res.getString(2)%></td><td><B><I><%=res.getString(3)%></B></I></td></tr>

<%
 
 }
}catch(Exception e)
{
e.printStackTrace();
}
%>
<table>