<%@ page import="java.sql.*"%>
<body bgcolor="skyblue">
<%


Statement st=null;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","CYBERNETICS","CYBERNETICS");

	st=con.createStatement();

	ResultSet rs=st.executeQuery("select * from tips_suggestions");

	out.println("<table border=2>");

	
		out.println("<tr>");
		out.println("<td><b>"+"name"+"</b></td>");
		out.println("<td><b>"+"subject"+"</b></td>");
		out.println("<td><b>"+"message"+"</b></td>");
      out.println("</tr>");


	  while(rs.next())
	{

		  out.println("<tr>");
		  out.println("<td><b><i>"+rs.getString(2)+"</b></i></td>");
		  out.println("<td><b><i>"+rs.getString(3)+"</b></i></td>");
		  out.println("<td><b><i>"+rs.getString(4)+"</b></i></td>");
		  out.println("</tr>");
	}

	out.println("</table>");

	}catch(Exception e)
{
e.printStackTrace();
}
%>


