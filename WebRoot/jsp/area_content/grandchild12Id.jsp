<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
</head>
<body>
<h1 align="center">更改密码</h1>
<form action="updatapsd" name="updatapsd" id="demo" method="get" onSubmit="return Validator.Validate(this,2)">

<table align="center" border="1" width="60%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>
<td>请输入旧密码:</td>
<td><input name="oldpsd" dataType="SafeString" msg="请输入至少6位密码,格式:字符+数字" type="password"/></td>
</tr>
<tr>
<td>请输入新密码:</td>
<td><input name="newpsd" dataType="SafeString" msg="请输入至少6位密码,格式:字符+数字" type="password"/></td>
</tr>
<tr>
<td>请确认新密码:</td>
<td><input name="Repeat" dataType="Repeat" to="newpsd" msg="新密码不一致" type="password"/></td>
</tr>
</table>

<p align="center">
<input value="提   交"  type="button" class="buttonstyle" onclick="modifypassword()"/>
<input value="重   置" type="reset" class="buttonstyle"/>
<input value="返   回" type="button" class="buttonstyle" onclick="getPart('<%=basePath%>jsp/yezhu_content/admin_content.jsp')"/>
</p>
</form>
</body>
</html>