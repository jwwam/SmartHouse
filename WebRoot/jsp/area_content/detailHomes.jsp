<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<head>
</head>
<body>
<s:form name="detailHomes" action="detailHomes" theme="simple" method="post">
<h1 align="center">房产详情</h1>
<table align="center" border="1" width="70%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 
<s:iterator value="#attr.homes" status="st">
<tr>
<td colspan="4">
<img alt="照片信息" src="<%=basePath%>/images/homes.jpg"/>
</td>
</tr>
<tr>
<td align="center">
<label>房产编号</label>
</td>
<td>
<s:property value="homesID"/>
</td>
<td align="center">
<label>楼栋</label>
</td>
<td>
<s:property value="homes_lou"/>
</td>

</tr>

<tr>
<td align="center"> 
<label>门牌号</label>
</td>
<td>
<s:property value="homes_number"/>
</td>

<td align="center">
<label>房产类型</label>
</td>
<td>
<s:property value="homes_type"/>
</td>

</tr>

<tr>
<td align="center">
<label>房产面积</label>
</td>
<td>
<s:property value="homes_area"/>M²
</td>
<td align="center">
<label>楼层</label>
</td>
<td>
<s:property value="homes_louceng"/>
</td>

</tr>

<tr>
<td align="center">
<label>单元号</label>
</td>
<td>
<s:property value="homes_danyuan"/>
</td>
<td align="center" >
<label>朝向</label>
</td>
<td >
<s:property value="homes_chaoxiang"/>
</td>
</tr>

<tr>
<td align="center">
<label>状态</label>
</td>
<td>
<s:property value="homes_sell"/>
</td>
<td align="center">
<label>业主姓名</label>
</td>
<td>
<s:property value="homes_yezhu"/>
</td>
</tr>

<tr>
<td align="center" colspan="1" height="100px">
<label>备注</label>
</td>
<td colspan="3">
<s:property value="homes_memo"/>
</td>
</tr>

</s:iterator>
</table>
</s:form>
<p align="center">
<input type="button" value="返   回" class="buttonstyle" onclick="getPart('listHomes.action')"/>
</p>
</body>
</html>