<%@page import="model.Forecast"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.City"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
 			City city = (City)request.getAttribute("city");
			ArrayList<Forecast> list = city.getList();
	%>
	<h1><%=city.getName()%></h1>
	<h1><%=list.get(1).getDate()%></h1>
	<h1><%=list.get(1).getTemperature()%></h1>
	
</body>
</html>