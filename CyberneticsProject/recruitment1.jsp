<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<body bgcolor="skyblue">
<%
String jtitle=request.getParameter("jtitle");
String firstname=request.getParameter("fname");

String lastname=request.getParameter("lname");

String dop=request.getParameter("dob");
SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
java.util.Date ud=sdf.parse(dop);
long ms=ud.getTime();
java.sql.Date sqd=new java.sql.Date(ms);
//sqd=java.sql.Date.valueOf(dop);
String qlfy=request.getParameter("qlf");

int percn=Integer.parseInt(request.getParameter("perc"));

String inst=request.getParameter("inst"); 
int experience=Integer.parseInt(request.getParameter("exp"));
String mobile=request.getParameter("mobile");
PreparedStatement ps=null;
CallableStatement cs=null;

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");

String qry="{?=call get_app_id()}";
cs=con.prepareCall(qry);
cs.registerOutParameter(1,Types.INTEGER);
cs.execute();
int appid=cs.getInt(1);
ps=con.prepareStatement("insert into job_application_form values(?,?,?,?,?,?,?,?,?,?)");
ps.setInt(1,appid);
 ps.setString(2,firstname);
 ps.setString(3,lastname);
 ps.setDate(4,sqd);
 ps.setString(5,qlfy);
 ps.setInt(6,percn);
 ps.setString(7,inst);
 ps.setInt(8,experience);
 ps.setString(9,jtitle);
  ps.setString(10,mobile);
 int res=ps.executeUpdate();
 if(res==1)
	{
 out.println("<b><i<<h2><font color='green' >Your Application has been successfully send!!</font></h2></i> ");
 }
 else
	{
 out.println(" <b><i<<h2><font color='red' >job application failed...</font></h2></i> ");
 
 }
}catch(Exception e)
{
e.printStackTrace();
out.println(firstname);
out.println(lastname);
out.println(ud);
out.println(sqd);
}
%>