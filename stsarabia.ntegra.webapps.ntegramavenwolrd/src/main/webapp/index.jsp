<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
//Get version of application
java.util.Properties prop = new java.util.Properties();
prop.load(getServletContext().getResourceAsStream("/META-INF/MANIFEST.MF"));
String applVersion = prop.getProperty("Implementation-Version"); 
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
<h3> Build No. is <%= applVersion %></h3>
</div>



</body>
</html>