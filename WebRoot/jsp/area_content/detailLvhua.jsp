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
<s:form name="detailLvhua" action="detailLvhua" theme="simple" method="post">
<h1 align="center">绿化/保洁详情</h1>
<table align="center" border="1" width="75%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 
<s:iterator value="#attr.lvhua" status="st">
<tr>
<td align="center" colspan="1">
<label>绿化/保洁编号</label>
</td>
<td colspan="3">
<s:property value="lvhuaID"/>
<input id="lvhuaID" value="<s:property value="lvhuaID"/>" type="hidden"/>
</td>
</tr>

<tr>
<td align="center"> 
<label>绿化/保洁地区</label>
</td>
<td>
<s:property value="lvhua_area"/>
</td>
<td align="center">
<label>绿化/保洁类型</label>
</td>
<td>
<s:property value="lvhua_style"/>
</td>
</tr>

<tr>
<td align="center"> 
<label>日期</label>
</td>
<td>
<s:date name="lvhua_date" format="yyyy年MM月dd" />
</td>
<td align="center">
<label>负责人</label>
</td>
<td>
<s:property value="lvhua_fuzheren"/>
</td>
</tr>

<tr>
<td align="center"> 
<label>绿化/保洁状态</label>
</td>
<td>
<s:property value="lvhua_status"/>
</td>
<td align="center">
<label>验收人</label>
</td>
<td>
<s:property value="lvhua_yanshouren"/>
</td>
</tr>

<tr>
<td align="center" height="100px" colspan="1"> 
<label>绿化/保洁描述</label>
</td>
<td colspan="3">
<s:property value="lvhua_memo"/>
</td>
</tr>

</s:iterator>
</table>
</s:form>
<p align="center">
<input type="button" value="返  回" class="buttonstyle" onclick="getPart('listLvhua.action')"/>
</p>
</body>
</html>