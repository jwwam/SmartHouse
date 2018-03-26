<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<head>
</head>
<body>
<h1 align="center">修改公告</h1>

<s:form  name="updataNotify" action="updataNotify" theme="simple">
<s:iterator value="#attr.notify" status="st">
<table align="center" border="1" width="90%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<s:hidden id="n_id" name="notifyID"/>
<tr>
<td>公告标题:</td>
<td><input name="notify_title" value="<s:property value="notify_title"/>"/></td>
</tr>
<tr>
<td>公告内容:</td>
<td><s:textarea  name="notify_content" rows="18" cols="70"/></td>
</tr>
</table>
</s:iterator>
<p align="center">
<input type="button" class="buttonstyle" value="修   改" onclick="updatanotify()"/>
<input type="reset"  class="buttonstyle" value="重   置"/>
<input type="button" class="buttonstyle" value="返   回" onclick="getPart('listNotify.action')" />
</p>
</s:form>
</body>