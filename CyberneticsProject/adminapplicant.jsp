<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<body bgcolor="skyblue">
<table BORDER='1'>

<tr><td>APP_ID</td><td>APP_NAME</td><td>DATE_OF_BIRTH</td><td>QUALIFICATION</td><td>PERCENTAGE</td><td>EXPERIENCE
</td><td>JOB_TITLE</td><td>MOBILENUMBER</td></tr>
<%

Statement ps=null;
CallableStatement cs=null;

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("Hai1");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");
	
	ps=con.createStatement();
	 ResultSet res=ps.executeQuery("select APP_ID,FIRST_NAME,DATE_OF_BIRTH,QUALIFICATION,PERCENTAGE,EXPERIENCE,JOB_TITLE ,PHONE from JOB_APPLICATION_FORM ");
	 System.out.println("resultset generated");
	while(res.next())
	{
System.out.println("===============");
%>
<tr>
<td><%=res.getInt(1)%></td>
<td><%=res.getString(2)%></td>
<td><%=res.getString(3)%></td>
<td><%=res.getString(4)%></td>
<td><%=res.getInt(5)%></td>
<td><%=res.getInt(6)%></td>
<td><%=res.getString(7)%></td>
<td><%=res.getString(8)%></td></tr>

<%
 
 }
}catch(Exception e)
{
e.printStackTrace();
}
%>
</table>