<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<head>
</head>
<body>
<h1 align="center">添加公告</h1>

<form  name="addNotify" action="addNotify" method="post" id="demo"  onSubmit="return Validator.Validate(this,2)">
<table align="center" border="1" width="85%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>
<td width="15%" align="center">通知标题:</td>
<td><input dataType="Require" msg="标题不能为空" name="notify_title"/><span>*</span></td>
</tr>
<tr>
<td width="15%" align="center">通知内容:</td>
<td><textarea rows="12" cols="68" dataType="Require" msg="请输入通知内容" name="notify_content"></textarea></td>
</tr>
</table>
</form>

<p align="center">
<input type="button" class="buttonstyle" value="新   增" onclick="addnotify()"/>
<input type="reset" class="buttonstyle" value="重   置"/>
<input type="button" class="buttonstyle" value="返   回" onclick="getPart('listNotify.action')" />
</p>
</body>