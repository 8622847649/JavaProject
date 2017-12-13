<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<body bgcolor="skyblue">
<table BORDER='1'>

<tr><td>JOB_TITLE</td><td>QUALIFICATION</td><td>PERCENTAGE</td><td>EXPERIENCE</td><td>LOCATION</td><td>SALARY</td></tr>
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
	ps=con.createStatement();
	 ResultSet res=ps.executeQuery("select JOB_TITLE,QUALIFICATION,PERCENTAGE,EXPERIENCE,LOCATION,SALARY from JOBS_POST where JOB_TITLE='clerk'");
	 System.out.println("resultset generated");
	while(res.next())
	{
System.out.println("========");
%>
<tr><td><%=res.getString(1)%></td><td><%=res.getString(2)%></td><td><%=res.getInt(3)%></td><td><%=res.getInt(4)%></td><td><%=res.getString(5)%></td>
<td><%=res.getInt(6)%></td></tr>

<%
 
 }
}catch(Exception e)
{
e.printStackTrace();
}
%>
