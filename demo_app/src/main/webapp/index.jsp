<%@ page session = "true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<html>
<body>
<h2>Test Page</h2>
<%
out.print("Hostname: " + InetAddress.getLocalHost().getHostName()+ "</br>");

out.print("Server name (System properties 'server.name'):  " + System.getProperty("server.name")+ "</br>");

out.print("Session Id: " + session.getId() + "</br>");

Date createTime = new Date(session.getCreationTime());
out.print("Create Time " + createTime + "</br>");

Integer i  = (Integer)session.getAttribute("Number");
if(i!=null){
    i = i +1;
}else{
    i=1;
}
session.setAttribute("Number", i);

out.print("Number : " + i);

%>
</body>
</html>
