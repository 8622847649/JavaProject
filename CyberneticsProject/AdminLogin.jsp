

<%
try
{
	
	String s1,s2;
	s1=request.getParameter("adminname");
	s2=request.getParameter("adminpassword");
	System.out.println(s1);
	System.out.println(s2);


	if(s1.equals("admin")&&s2.equals("admin"))
	{
		System.out.println("akl;fand;f");
		session.setAttribute("admnuname",s1);
		session.setAttribute("admnpwd",s2);
		
		System.out.println("eeeeeeeeeee");

%>
<frameset cols="20%,80%">
<frame src="adminlink1.html"name="abc" scrolling="no">

</frame>
<frame src="adminlink2.html"name="xyz"/>
</frameset>



	<%
	}
	else
	{
		out.println("login faileddddddddddddddd");
	}


}catch(Exception e){
	e.printStackTrace();
}%>



