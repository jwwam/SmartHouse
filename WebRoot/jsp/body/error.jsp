<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
登陆失败,或session已超时!<a href="<%=basePath%>jsp/index.jsp" >点击重新登录</a>
</p>
</body>
</html>