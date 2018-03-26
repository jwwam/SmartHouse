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
<s:form name="goMaintain" action="goMaintain" theme="simple" method="post">
<h1 align="center">安排维修列表</h1>
<table id="gomaintainlist" align="center" border="1" cellspacing="0" width="90%" cellpadding="0" class="tablebgcolor" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 

<tr bgcolor=#99CC33 class="text" >
<td class="td_relative"  valign="top" align="center"> 
报修编号
</td> 
<td class="td_relative" valign="top" align="center"> 
业主门牌号
</td> 
<td class="td_relative"  valign="top" align="center"> 
报修物品
</td> 
<td class="td_relative"  valign="top" align="center"> 
维修状态
</td>  
<td class="td_relative" valign="top" align="center"> 
送修日期
</td>
<td class="td_relative" valign="top" align="center"> 
维修员
</td> 
</tr>

<s:iterator value="#attr.maintain" status="st">
<tr onclick="checked(this)">
<td width="5%"  valign="top" align="center" class="text">
<input type="hidden" value="<s:property value="maintainID"/>">
<s:property value="maintainID"/>
</td>
<td width="5%"  valign="top" align="center" class="text"> 
<s:property value="maintain_homesnumber" />
</td> 
<td width="10%"  valign="top" align="center" class="text">
<s:property value="maintain_thing" />
</td> 
<td width="5%"  valign="top" align="center" class="text">
<s:property value="maintain_status" />
</td> 
<td width="10%"  valign="top" align="center" class="text"> 
<s:date name="maintain_sdate" format="yyyy-MM-dd HH:mm:ss" />
</td>
<td width="5%"  valign="top" align="center" class="text">
<s:property value="maintainer" />
</td>
</tr>
</s:iterator>
</table>

<p align="center">
<input type="button" class="buttonstyle" value="维修结果" onclick="dengjimaintain()"/>
<input type="button" class="buttonstyle" value="删   除" onclick=""/>
</p>
</s:form>

<div id="jieguo" style="display: none" align="center">
<s:form name="resultMaintain" action="resultMaintain" theme="simple" method="post">
<table align="center" border="1" width="60%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="gold" bordercolordark="#FFFFCC">
<tr>
<td colspan="1">
维修结果
</td>
<td colspan="3">
<s:autocompleter list="#{'已修好':'已修好','未修好':'未修好'}" theme="simple" name="maintain_status" listKey="key" listValue="value" value="已修好" />
</td>
</tr>

<tr>
<td>
维修材料费
</td>
<td>
<s:textfield name="maintain_tcost"/>
</td>
<td>
维修服务费
</td>
<td>
<s:textfield name="maintain_scost"/>
</td>
</tr>

<tr>
<td colspan="1">
维修日记
</td>
<td colspan="3">
<s:textarea name="maintain_rmemo" rows="5" cols="50"/>
</td>
</tr>
</table>
</s:form>
<input type="button" value="登    记" class="buttonstyle" onclick="resultmaint()"/>
</div>

</body>
</html>