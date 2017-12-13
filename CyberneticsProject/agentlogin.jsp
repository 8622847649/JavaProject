<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
try
{
	System.out.println("Hello");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");
	Statement st=con.createStatement();
	 String s1=null,s2=null;
 s1=request.getParameter("agentname");
 s2=request.getParameter("agentpassword");
 
 ResultSet rs=null;
  //rs = st.executeQuery("select agent_name,password from create_agent where agent_name='"+s1+"' and password='"+s2+"'");

  rs = st.executeQuery("select username,password from agent_login where username='"+s1+"' and password='"+s2+"'");
if(rs.next())
	{
	System.out.println("akl;fand;f");
session.setAttribute("agentuname",s1);
session.setAttribute("agentpwd",s2);

	System.out.println("eeeeeeeeeee");
	



	
	   
%>
<frameset cols="20%,80%">
<frame src="agentlink1.html"name="agentlink1" scrolling="no"/>


<frame src="agentlink2.html"name="agentlink2"/>
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



