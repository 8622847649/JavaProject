<%@ page import="java.sql.*"%>
<body bgcolor="skyblue">
<%

int id=Integer.parseInt(request.getParameter("caseid"));

String stat=request.getParameter("status");

String evid=request.getParameter("evidence");
String evid1=request.getParameter("evidence1");

PreparedStatement ps=null;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");

	ps=con.prepareStatement("update case_assign_agent set status='"+stat+"' ,evidence='"+evid+"' where case_id= "+id);
	int res=ps.executeUpdate();
	if(res==1)
	{
		out.println("<h2><font color='green'>Updated successfully!!!</font></h2>");
	}
	else
	{
		out.println("<h2><font color='green'>Case Id Not Found/Invalid Details....</font></h2>");
	}
	
	
	}catch(Exception e)
{
e.printStackTrace();
}
%>


