<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="projet2.Database"%>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>

<% 
	Database db = (Database)application.getAttribute("database"); 

	// D�pr�ci� mais �a ira pour cette fois
	String where = URLDecoder.decode(request.getParameter("query")); 
	String table = request.getParameter("table"); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<% 
	try {
		db.deleteRow(table, where);
		pageContext.forward("tableContents.jsp?deletion=done");
	} catch(Exception e) { pageContext.forward("tableContents.jsp?deletion=" + URLEncoder.encode(e.getMessage())); }
%>
</body>
</html>