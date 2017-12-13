<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<body bgcolor="skyblue">
<%
/* int jobid=request.getParameter("jid"); */
String jtitle=request.getParameter("jobtitle");
String qlfy=request.getParameter("qlfy");
int percn=Integer.parseInt(request.getParameter("percentage"));
int exp=Integer.parseInt(request.getParameter("expr"));
String dop=request.getParameter("lastdate");
/*SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
java.util.Date ud=sdf.parse(dop);
long ms=ud.getTime();
java.sql.Date sqd=new java.sql.Date(ms);
sqd=java.sql.Date.valueOf(dop);*/
int  vacn=Integer.parseInt(request.getParameter("vacnc"));
String location=request.getParameter("location");
Float sal=Float.parseFloat(request.getParameter("salary"));
PreparedStatement ps=null;
CallableStatement cs=null;

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");

String qry="{?=call get_job_id()}";
cs=con.prepareCall(qry);
cs.registerOutParameter(1,Types.INTEGER);
cs.execute();
int jobid=cs.getInt(1);
ps=con.prepareStatement("insert into jobs_post values(?,?,?,?,?,?,?,?,?)");
ps.setInt(1,jobid);
 ps.setString(2,jtitle);
 ps.setString(3,qlfy);
 ps.setInt(4,percn);
 ps.setInt(5,exp);
 //ps.setDate(6,sqd);
 ps.setString(6,dop);
 ps.setInt(7,vacn);
 ps.setString(8,location);
 ps.setFloat(9,sal);
 int res=ps.executeUpdate();
 if(res==1)
	{
 out.println("<h2><font color='green'> job successfully posted!!!</font></h2>");
 }
 else
	{
 out.println(" <h2><font color='red'>job posting failed......</font></h2>");
 
 }
}catch(Exception e)
{
e.printStackTrace();
}
%>