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
<form name="modify_custom_psd" id="demo" method="get" onSubmit="return Validator.Validate(this,2)">
<input name="custom_yezhuID" value="<%=session.getAttribute("yezhu_id")%>" type="hidden"/>
<table align="center" border="1" width="60%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>
<td>请输入旧密码:</td>
<td><input name="custom_oldpsd" id="custom_oldpsd" dataType="SafeString" msg="请输入至少6位密码,格式:字符+数字" type="password"/></td>
</tr>
<tr>
<td>请输入新密码:</td>
<td><input name="custom_psd" dataType="SafeString" msg="请输入至少6位密码,格式:字符+数字" type="password"/></td>
</tr>
<tr>
<td>请确认新密码:</td>
<td><input name="Repeat" dataType="Repeat" to="custom_psd" msg="新密码不一致" type="password"/></td>
</tr>
</table>

<p align="center">
<input value="提   交"  type="button" class="buttonstyle" onclick="modifypassword()"/>
<input value="重   置" type="reset" class="buttonstyle"/>
<input type="button" value="返   回"  class="buttonstyle" onclick="getPart_yezhu('<%=basePath%>jsp/yezhu_content/yezhu_content.jsp')"/>
</p>
</form>
</body>
</html>