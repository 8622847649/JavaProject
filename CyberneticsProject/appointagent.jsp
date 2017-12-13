<%@ page import="java.sql.*"%>
<body bgcolor="skyblue">
<%

int cid=Integer.parseInt(request.getParameter("caseid"));
int aid=Integer.parseInt(request.getParameter("agentid"));
String name=request.getParameter("agentname");

PreparedStatement ps=null;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cybernetics","cybernetics");

	ps=con.prepareStatement("update case_assign_agent set agent_id="+aid+" where case_id="+cid);
	int res=ps.executeUpdate();
	if(res==1)
	{
		out.println("<h2><font color='green'>agent appointed!!!</font></h2>");
	}
	else
	{
		out.println("<h2><font color='red'>agent not appointed......</font></h2>");
	}
	
	
	}catch(Exception e)
{
e.printStackTrace();
}
%>


