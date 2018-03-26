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
<s:form name="unMaintain" action="unMaintain" theme="simple" method="post">
<h1 align="center">待修列表</h1>
<table id="unmaintainlist" align="center" border="1" cellspacing="0" width="90%" cellpadding="0" class="tablebgcolor" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 

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
</tr>
</s:iterator>
</table>

<p align="center">
<input type="button" class="buttonstyle" value="安排维修" onclick="sendmaintain()"/>
<input type="button" class="buttonstyle" value="删   除" onclick=""/>
</p>
</s:form>

<div id="dengji" style="display: none" align="center">
<s:form name="doMaintain" action="doMaintain" theme="simple" method="post">
<table align="center" border="1" width="20%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="gold" bordercolordark="#FFFFCC">
<tr>
<td>
选择维修员
</td>
<td>
<s:autocompleter list="#{'小李':'小李','老王':'老王','李明':'李明'}" theme="simple" name="maintainer" listKey="key" listValue="value" value="老王" />
</td>
</tr>
</table>
</s:form>
<input type="button" class="buttonstyle" value="执    行" onclick="domaint()"/>
</div>

</body>
</html>