<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<head>
<title></title>
<s:action name="searchAdmin" executeResult="false"></s:action>
</head>
<body>
<h1 align="center">个人信息</h1>
<s:iterator value="#attr.admin" status="st">
<table align="center" border="1" width="60%" cellpadding="0" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>
<td rowspan="7" width="100px">
<img alt="照片信息" src="<%=basePath%>/images/wuzun.jpg"/>
</td>
<td align="center">姓名:</td>
<td><s:property value="admin_name" /></td>
</tr>
<tr>
<td align="center">性别:</td>
<td><s:property value="admin_sex" /></td>
</tr>
<tr>
<td align="center">年龄:</td>
<td><s:property value="admin_age" /></td>
</tr>
<tr>
<td align="center">座机:</td>
<td><s:property value="admin_tel" /></td>
</tr>
<tr>
<td align="center">手机:</td>
<td><s:property value="admin_phone" /></td>
</tr>
<tr>
<td align="center">家庭住址:</td>
<td><s:property value="admin_addr" /></td>
</tr>
<tr>
<td align="center">备注:</td>
<td><s:property value="admin_memo" /></td>
</tr>
</table>
</s:iterator>

<p align="center">
<input type="button" value="修改信息" class="buttonstyle" onclick="getPart('<%=basePath%>jsp/area_content/updataAdmin.jsp')"/>
</p>

</body>
</html>