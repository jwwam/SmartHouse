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
<s:form name="detailMaintain" action="detailMaintain" theme="simple" method="post">
<h1 align="center">报修详情列表</h1>
<table align="center" border="1" width="75%" cellpadding="5" cellspacing="0" bordercolor="#FFFFCC" bordercolorlight="white" bordercolordark="#4BD52B"> 
<s:iterator value="#attr.maintain" status="st">
<tr>
<td align="center">
报修编号
</td>
<td>
<s:property value="maintainID"/>
</td>
<td align="center"> 
报修物品
</td>
<td>
<s:property value="maintain_thing"/>
</td>
</tr>

<tr>
<td align="center"> 
业主门牌号
</td>
<td>
<s:property value="maintain_homesnumber"/>
</td>
<td align="center"> 
维修状态
</td>
<td>
<s:property value="maintain_status"/>
</td>
</tr>
<tr>
<td align="center"> 
送修日期
</td>
<td>
<s:date name="maintain_sdate" format="yyyy-MM-dd HH:mm:ss" />
</td>
<td align="center"> 
修好日期
</td>
<td>
<s:date name="maintain_rdate" format="yyyy-MM-dd HH:mm:ss" />
</td>
</tr>
<tr>
<td align="center"> 
维修材料费
</td>
<td>
<s:property value="maintain_tcost"/>
</td>
<td align="center"> 
维修服务费
</td>
<td>
<s:property value="maintain_scost"/>
</td>
</tr>
<tr>
<td align="center"> 
维修工人
</td>
<td>
<s:property value="maintainer"/>
</td>
<td align="center"> 
报修原因
</td>
<td>
<s:property value="maintain_smemo"/>
</td>
</tr>
<tr>
<td align="center"> 
维修日记
</td>
<td>
<s:property value="maintain_rmemo"/>
</td>
</tr>
</s:iterator>
</table>
</s:form>
<p align="center">
<input type="button" value="返  回" class="buttonstyle" onclick="getPart('listMaintain.action')"/>
</p>
</body>
</html>