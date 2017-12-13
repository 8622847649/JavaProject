<%@ page  import="java.sql.*"%>
<body bgcolor="skyblue">
<%! Connection con=null;PreparedStatement ps=null;CallableStatement cs;
public void jspInit()
{
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("driver loaded ");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","cybernetics","cybernetics");
System.out.println("connection establised");

}catch(Exception e)
	{
e.printStackTrace();
}
}
%>
<%
String qry="{?=call GET_tip_ID()}";

cs=con.prepareCall(qry);
cs.registerOutParameter(1,Types.INTEGER);
cs.execute();

int tipid=cs.getInt(1);
String sub=request.getParameter("subject");
String desc=request.getParameter("desc");
String sugname=request.getParameter("suggname");
String address=request.getParameter("addr");
System.out.println("insertion is going on");
int res=0;
try{
ps=con.prepareStatement("insert into tips_suggestions values(?,?,?,?)");
ps.setInt(1,tipid);
 ps.setString(2,sugname);
 ps.setString(3,sub);
 ps.setString(4,desc);
 res=ps.executeUpdate();
System.out.println("insertiond done");
}catch(Exception ee)
{
ee.printStackTrace();
}
if(res==0)
{
out.println("<h2><i><font color='red'>record insertion failed...</font></i></h2>");
}
else
{
out.println("<h2><i><font color='green'>Your Suggestion has been sent Successfully!!</font></i></h2>");
}
%>