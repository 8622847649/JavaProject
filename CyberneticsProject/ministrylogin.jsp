
<%@ page import="java.sql.*"%>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");
	Statement st=con.createStatement();
	 String s1=null,s2=null;
 s1=request.getParameter("ministryname");
 s2=request.getParameter("ministrypassword");
 ResultSet rs=null;
  rs = st.executeQuery("select username,password from defence_login where username='"+s1+"' and password='"+s2+"'");
System.out.println("verified the database");
if(rs.next())
	{
	System.out.println("akl;fand;f");
session.setAttribute("ministryname",s1);
session.setAttribute("ministrypwd",s2);

	System.out.println("eeeeeeeeeee");

%>
<frameset cols="20%,80%">
<frame src="ministrylink1.html"name="ministrylink1"scrolling="no">

</frame>
<frame src="ministrylink2.html"name="ministrylink2"/>
</frameset>



	<%
	}
	else
	{
	out.println("login failedddddddddddsssssssss");
	}


}catch(Exception e)
	{
	e.printStackTrace();
	}%>



