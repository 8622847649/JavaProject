<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<body bgcolor="skyblue">
<%
String name=request.getParameter("agentname");

String dop=request.getParameter("dob");
SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
java.util.Date ud=sdf.parse(dop);
long ms=ud.getTime();
java.sql.Date sqd=new java.sql.Date(ms);
sqd=java.sql.Date.valueOf(dop);
long  phnumber=Long.parseLong(request.getParameter("phno"));
String qualification=request.getParameter("qual");
String address1=request.getParameter("address");

PreparedStatement ps=null;


try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","cybernetics","cybernetics");
	String sql="update create_agent set phone_number="+phnumber+",qualification=' "+qualification+" ',ADDRESS=' "+address1 +" ' where agent_name=' "+name+" ' ";
ps=con.prepareStatement("update create_agent set DATE_OF_BIRTH='"+dop+"' ,phone_number="+phnumber+", qualification='"+qualification+" ',ADDRESS='"+address1 +"' where agent_name='"+name+"'");

	
 int res=ps.executeUpdate();
	System.out.println(sql);
 
 if(res==1)
	{
 out.println(" <h2><font color='green'>Agent updated successfully!!!</font></h2>");
 }

}catch(Exception e)
{
out.println(e);
}
%>