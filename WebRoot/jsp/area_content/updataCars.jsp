<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<head>
<script language="javascript" type="text/javascript"
			src="${ctx }/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<h1 align="center">更改车辆信息</h1>
<p align="center">
<s:form name="updataCars" action="updataCars" method="post" theme="simple">
<s:iterator value="#attr.cars" status="st">
<table align="center" border="1" width="70%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<s:hidden id="id" name="id"/>
<tr>
<td align="center"><s:text name="">车主姓名</s:text></td>
<td><input  name="carowner" value="<s:property value="carowner"/>" /></td>
<td align="center"><s:text name="">手机号码</s:text></td>
<td><input  name="contactway" value="<s:property value="contactway"/>" /></td>
</tr>
<tr>
<td align="center"><s:text name="">门牌号</s:text></td>
<td><input name="housenumber" value="<s:property value="housenumber"/>"/></td>
<td align="center"><s:text name="">车牌号</s:text></td>
<td><input name="licensenumber" value="<s:property value="licensenumber"/>"/></td>
</tr>
<tr>
<td align="center"><s:text name="">车位</s:text></td>
<td><input name="carspace" value="<s:property value="carspace"/>"/></td>
<td align="center"><s:text name="">到期时间</s:text></td>
<td><input name="enddate" class="Wdate" value="<s:date name="enddate" format="yyyy-MM-dd"/>" onClick="WdatePicker()"/></td>
</tr>
<tr>
<td align="center" colspan="1"><s:text name="">车辆描述</s:text></td>
<td colspan="3"><input name="carmsg" value="<s:property value="carmsg"/>"/></td>

</tr>
</table>
</s:iterator>
<input type="button" value="更  改" class="buttonstyle" onclick="updataCar()"/>
<input type="reset" value="重   置" class="buttonstyle"/>
<input type="button" value="返  回" class="buttonstyle" onclick="getPart('listCars.action')"/>
</s:form>
</p>
</body>
