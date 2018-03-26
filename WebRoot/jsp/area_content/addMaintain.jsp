<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<head>
<s:head theme="ajax"/>
</head>
<body>
<h1 align="center">报修登记</h1>
<p align="center">
<form name="addMaintain" action="addMaintain" id="demo" method="post" onSubmit="return Validator.Validate(this,2)">
<table align="center" border="1" width="50%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>
<td align="center">报修物品:</td>
<td><input name="maintain_thing" dataType="Require" msg="请输入报修物品" /><span>*</span></td>
</tr>

<tr>
<td align="center">门牌号:</td>
<td><input name="maintain_homesnumber" dataType="Require" msg="请输入门牌号" /><span>*</span></td>
</tr>

<tr>
<td align="center">报修原因:</td>
<td><textarea name="maintain_smemo" dataType="Require" msg="报修原因必填" cols="32" rows="6"></textarea></td>
</tr>
</table>

<input type="button" value="登   记" class="buttonstyle" onclick="addmaintain()"/>
<input type="reset" value="重   置" class="buttonstyle"/>
<input type="button" value="返   回" class="buttonstyle" onclick="getPart('listMaintain.action')" />
</form>

</body>