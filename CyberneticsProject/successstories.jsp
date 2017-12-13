<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<body bgcolor="skyblue">
<%

String title=request.getParameter("storytitle");
String desc=request.getParameter("description");
PreparedStatement ps=null;
CallableStatement cs=null;

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");

String qry="{?=call get_story_id()}";
cs=con.prepareCall(qry);
cs.registerOutParameter(1,Types.INTEGER);
 cs.execute();
int storyid=cs.getInt(1);
ps=con.prepareStatement("insert into success_stories values(?,?,?)");
ps.setInt(1,storyid);
 ps.setString(2,title);
 ps.setString(3,desc);


  int res=ps.executeUpdate();
 if(res==1)
	{
 out.println("<h2><font color='green'> story added successfully!!!</font></h2>");
 }
 else
	{
 out.println("<h2><font color='red'> story adding  failed.......</font></h2>");
 
 }
}catch(Exception e)
{
e.printStackTrace();
}
%>
