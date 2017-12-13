<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<body bgcolor="skyblue">
<%
String name=request.getParameter("casename");
String details=request.getParameter("casedetails");
String dop=request.getParameter("date");
//out.println("correct");
SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
java.util.Date ud=sdf.parse(dop);
long ms=ud.getTime();
java.sql.Date sqd=new java.sql.Date(ms);
//sqd=java.sql.Date.valueOf(dop);

String res=request.getParameter("resources");

PreparedStatement ps=null;
CallableStatement cs=null;

try
{
	System.out.println("Step01");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cybernetics","cybernetics");

String qry="{?=call get_case_id()}";
cs=con.prepareCall(qry);
cs.registerOutParameter(1,Types.INTEGER);
cs.execute();
int caseid=cs.getInt(1);
System.out.println("Step1");
ps=con.prepareStatement("insert into defence_case_creation values(?,?,?,?,?)");
ps.setInt(1,caseid);
 ps.setString(2,name);
 ps.setString(3,details);

 ps.setDate(4,sqd);
 ps.setString(5,res);
 
 int result=ps.executeUpdate();
System.out.println("Step2");
qry="{?=call GET_CASE_ASSIGN_ID()}";
cs=con.prepareCall(qry);
cs.registerOutParameter(1,Types.INTEGER);
cs.execute();
int caseassid=cs.getInt(1);
System.out.println("Step3");
ps=con.prepareStatement("insert into CASE_ASSIGN_AGENT (CASE_ASSIGN_ID,CASE_ID)values(?,?)");
ps.setInt(1,caseassid);
ps.setInt(2,caseid);

 
 int result2=ps.executeUpdate();

 if(result==1 && result2==1)
	{
 out.println("<h2><font color='green'><i> case created successfully!!!</i></font></h2>");
 }
 else
	{
 out.println(" <h2><font color='red'><i>case Creation failed...</i></font></h2>");
 
 }
}catch(Exception e)
{
e.printStackTrace();
}
%>