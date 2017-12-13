<%@ page import="java.sql.*"%>
<body bgcolor="skyblue">
<%


Statement st=null;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");

	st=con.createStatement();

	ResultSet rs=st.executeQuery("select case_id,case_name,case_details,resources from defence_case_creation");

	out.println("<table border=2>");

	
		out.println("<tr>");
		out.println("<td><b>"+"Case ID"+"</b></td>");
		out.println("<td><b>"+"Name of case assigned to you"+"</b></td>");
		out.println("<td><b>"+"Case details"+"</b></td>");
		out.println("<td><b>"+"Resources allocated to u"+"</b></td>");
      out.println("</tr>");


	  while(rs.next())
	{

		  out.println("<tr>");
		  out.println("<td><b><i>"+rs.getString(1)+"</i></b></td>");
		  out.println("<td><b><i>"+rs.getString(2)+"</i></b></td>");
		  out.println("<td><b><i>"+rs.getString(3)+"</i></b></td>");
		   out.println("<td><b><i>"+rs.getString(3)+"</i></b></td>");
		  out.println("</tr>");
	}

	out.println("</table>");

	}catch(Exception e)
{
e.printStackTrace();
}
%>