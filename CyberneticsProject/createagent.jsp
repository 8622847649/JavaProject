<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<body bgcolor="skyblue">
<%
String name=request.getParameter("agentname");
String password=request.getParameter("password");
String dop=request.getParameter("dob");
/*SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
java.util.Date ud=sdf.parse(dop);
long ms=ud.getTime();
java.sql.Date sqd=new java.sql.Date(ms);
sqd=java.sql.Date.valueOf(dop);*/
long phnumber=Long.parseLong(request.getParameter("phno"));
String qualification=request.getParameter("qual");
String address=request.getParameter("address");
PreparedStatement ps=null;
CallableStatement cs=null;

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");

String qry="{?=call get_agent_id()}";
cs=con.prepareCall(qry);
cs.registerOutParameter(1,Types.INTEGER);
cs.execute();
int agentid=cs.getInt(1);
ps=con.prepareStatement("insert into create_agent values(?,?,?,?,?,?)");
ps.setInt(1,agentid);
 ps.setString(2,name);

 //ps.setDate(3,sqd);
 ps.setString(3,dop);
 ps.setLong(4,phnumber);
 ps.setString(5,qualification);
 ps.setString(6,address);
 //ps.setString(7,password);
 int res=ps.executeUpdate();


 ps=con.prepareStatement("insert into AGENT_LOGIN values(?,?,?)");
 ps.setInt(1,agentid);
 ps.setString(2,name);
 ps.setString(3,password);
  int res1=ps.executeUpdate();
 if(res==1 && res1==1)
	{
 out.println("<h2><font color='green'> Agent created successfully!!!</font></h2>");
 }
 else
	{
 out.println(" <h2><font color='green'>Agent Creation failed.....</font></h2>");
 
 }
}catch(Exception e)
{
e.printStackTrace();
}
%>