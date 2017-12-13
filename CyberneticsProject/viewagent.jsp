<%@ page import="java.sql.*"%>
<body bgcolor="skyblue">
<%


Statement st=null;

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");

	st=con.createStatement();

	ResultSet rs=st.executeQuery("select * from create_agent");
	
	




	out.println("<table border=2>");

	
		out.println("<tr>");
		out.println("<td>"+"agent id"+"</td>");
		out.println("<td>"+"agent name"+"</td>");
		out.println("<td>"+"date of birth"+"</td>");
		out.println("<td>"+"phone number"+"</td>");
		out.println("<td>"+"qualification"+"</td>");
		out.println("<td>"+"address"+"</td>");
		//out.println("<td>"+"password"+"</td>");
      out.println("</tr>");


	  while(rs.next())
	{

		  out.println("<tr>");
		  out.println("<td>"+rs.getString(1)+"</td>");
		  out.println("<td>"+rs.getString(2)+"</td>");
		  out.println("<td>"+rs.getString(3)+"</td>");
		  out.println("<td>"+rs.getString(4)+"</td>");
		  out.println("<td>"+rs.getString(5)+"</td>");
		  out.println("<td>"+rs.getString(6)+"</td>");
		  //out.println("<td>"+rs.getString(7)+"</td>");
		  out.println("</tr>");

		  
	}


	out.println("</table>");

	}catch(Exception e)
{
e.printStackTrace();
}
%>


