<%@ page import="java.sql.*"%>
<body bgcolor="skyblue">
<%


Statement st1=null;
Statement st2=null;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");

	st1=con.createStatement();

	//ResultSet rs1=st1.executeQuery("select case_id,case_name,resources from defence_case_creation");
	
	ResultSet rs1=st1.executeQuery("select a.case_id,a.agent_id,d.case_name,a.status,a.evidence,d.resources from CASE_ASSIGN_AGENT a ,DEFENCE_CASE_CREATION d where d.case_id=a.case_id ");

	




	//st2=con.createStatement();

	//ResultSet rs2=st2.executeQuery("select agent_id,status,evidence from case_assign_agent");

	out.println("<table border=2>");

	
		out.println("<tr>");
		out.println("<td><b>"+"caseid"+"</b></td>");
		out.println("<td><b>"+"agent id"+"</b></td>");
		out.println("<td><b>"+"case name"+"</b></td>");
		out.println("<td><b>"+"status"+"</b></td>");
		out.println("<td><b>"+"evidence"+"</b></td>");
		out.println("<td><b>"+"resources"+"</b></td>");
      out.println("</tr>");


	  while(rs1.next())
	{

		  out.println("<tr>");
		  out.println("<td><b><i>"+rs1.getInt(1)+"</i></b></td>");
		  out.println("<td><b><i>"+rs1.getString(2)+"</i></b></td>");
		  out.println("<td><b><i>"+rs1.getString(3)+"</i></b></td>");
		  out.println("<td><b><i>"+rs1.getString(4)+"</b></i></td>");
		  out.println("<td><b><i>"+rs1.getString(5)+"</b></i></td>");
		  out.println("<td><b><i>"+rs1.getString(6)+"</b></i></td>");
		  
	}

/* while(rs2.next())
	{

		 
		  out.println("<td><b><i>"+rs2.getInt(1)+"</i></b></td>");
		  out.println("<td><b><i>"+rs2.getString(2)+"</i></b></td>");
		  out.println("<td><b><i>"+rs2.getString(3)+"</i></b></td>");
		  out.println("</tr>");
	}*/
	out.println("</table>");

	}catch(Exception e)
{
e.printStackTrace();
}
%>


