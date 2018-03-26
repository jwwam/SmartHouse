<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<title></title>
</head>
<body>
<p align="center">
执行成功!
<a href="<%=basePath%>jsp/body/custom.jsp">返    回</a>
</p>
</body>
</html>