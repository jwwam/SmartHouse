<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
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
<h1 align="center">更新个人信息</h1>


<form  action="updaAdmin" name="updaAdmin" id="demo" method="post" onSubmit="return Validator.Validate(this,2)">
<s:iterator value="#attr.admin" status="st">
<table align="center" border="1" width="70%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">

<input name="adminID" value="<s:property value="adminID"/>" type="hidden" />

<tr>
<td rowspan="7" width="100px">
<img alt="照片信息" src="<%=basePath%>/images/wuzun.jpg"/>
</td>

<td>姓名:</td>
<td><input dataType="Chinese" msg="姓名不能为空且只允许中文" name="admin_name" value="<s:property value="admin_name"/>" /></td>
</tr>

<tr>
<td>性别</td>
<td><s:radio name="admin_sex" list="#{'男':'男','女':'女'}" theme="simple"/></td>
</tr>

<tr>
<td>年龄:</td>
<td><input dataType="Integer" msg="年龄只能是数字" name="admin_age" value="<s:property value="admin_age"/>" /></td>
</tr>
<tr>
<td>座机:</td>
<td><input dataType="Phone" msg="请输入8位号码或（区号）8位号码)" name="admin_tel" value="<s:property value="admin_tel"/>" /></td>
</tr>
<tr>
<td>手机:</td>
<td><input dataType="Mobile" msg="请输入正确的手机号码" name="admin_phone" value="<s:property value="admin_phone"/>" /></td>
</tr>
<tr>
<td>家庭住址:</td>
<td><input dataType="Require" msg="家庭住址不能为空" name="admin_addr" value="<s:property value="admin_addr"/>" /></td>
</tr>

<tr>
<td>备注:</td>
<td>
<textarea cols="35" rows="5" dataType="Require" msg="备注不能为空" name="admin_memo">
<s:property value="admin_memo"/>
</textarea>
</td>
</tr>
</table>

</s:iterator>
<p align="center">
<input value="提   交"  type="button" class="buttonstyle" onclick="modifyadmin()"/>
<input value="重   置"  type="reset"  class="buttonstyle"/>
<input value="返   回"  type="button" class="buttonstyle" onclick="getPart('<%=basePath%>jsp/area_content/grandchild13Id.jsp')"/>
</p>

</form>
</body>
</html>