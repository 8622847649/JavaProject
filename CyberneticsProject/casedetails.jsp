<%@ page import="java.sql.*"%>
<body bgcolor="skyblue">
<%
int id=Integer.parseInt(request.getParameter("caseid"));


Statement st1=null;
Statement st2=null;
int count=0;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");

	st1=con.createStatement();

	ResultSet rs1=st1.executeQuery("select case_id,case_name,case_details,resources  from defence_case_creation where case_id=" +id   );
	
	




	st2=con.createStatement();

	ResultSet rs2=st2.executeQuery("select agent_id,status,evidence from case_assign_agent where case_id="+id);
	System.out.println(" rs 1 "+rs1);
		System.out.println(rs2);
	
	out.println("<table border=2>");

	
		out.println("<tr>");
		out.println("<td><b>"+"caseid"+"</b></td>");
		out.println("<td><b>"+"case name"+"</b></td>");
		out.println("<td><b>"+"case details"+"</b></td>");
		out.println("<td><b>"+"resources"+"</b></td>");
	    out.println("<td><b>"+"agent id"+"</b></td>");
		out.println("<td><b>"+"status"+"</b></td>");
		out.println("<td><b>"+"solution"+"</b></td>");
      out.println("</tr>");


	  while(rs1.next())
	{
		  count++;
System.out.println("1st while");
		  out.println("<tr>");
		  out.println("<td><b><i>"+rs1.getInt(1)+"</b></i></td>");
		  out.println("<td><b><i>"+rs1.getString(2)+"</b></i></td>");
		  out.println("<td><b><i>"+rs1.getString(3)+"</b></i></td>");
		   out.println("<td><b><i>"+rs1.getString(4)+"</b></i></td>");
		  /*  out.println("<td><b><i>"+rs1.getString(5)+"</b></i></td>");
			  out.println("<td><b><i>"+rs1.getString(6)+"</b></i></td>");
	
	  out.println("<td><b><i>"+rs1.getString(7)+"</b></i></td>");*/
	
	}

		  
	

 while(rs2.next())
	{

		 
		  out.println("<td><b><i>"+rs2.getInt(1)+"</b></i></td>");
		  out.println("<td><b><i>"+rs2.getString(2)+"</b></i></td>");
		  out.println("<td><b><i>"+rs2.getString(3)+"</b></i></td>");
		  out.println("</tr>");
	}
	
	out.println("</table>");

	if(count==0){
	  out.println("<b><i>No Records Found</b></i>");
	}
	}catch(Exception e)
{
e.printStackTrace();
}
%>


