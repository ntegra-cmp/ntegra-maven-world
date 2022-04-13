<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
//Get version of application
java.util.Properties prop = new java.util.Properties();
prop.load(getServletContext().getResourceAsStream("/META-INF/MANIFEST.MF"));
String applVersion = prop.getProperty("Implementation-Version");
String specVersion = prop.getProperty("Specification-Version");
String buildTime = prop.getProperty("Build-Time");
java.net.InetAddress ia = java.net.InetAddress.getLocalHost();
String hostname = ia.getHostName();
String ipAddress = request.getLocalAddr();;

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ntegra World Web App</title>
<link rel="stylesheet" href="theme/ntegra.css" />
</head>
<body>

<div class="headertop"></div>
<div class="headerlogo"></div>
<div>
<h1> Welcome to Ntegra World</h1>
</div>

<div>
<h3> Version v<%= specVersion %>_b<%= applVersion %></h3>

<h3> Built Time  <%= buildTime %></h3>
<h3> Served by  <%= hostname %> / <%= ipAddress %></h3>
</div>



</body>
</html>