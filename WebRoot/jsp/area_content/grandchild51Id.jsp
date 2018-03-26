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
<h1 align="center">保安巡查列表</h1>

<table align="center" border="1" cellspacing="0" width="90%" cellpadding="0" class="tablebgcolor" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 

<tr bgcolor=#99CC33 class="text">
<td class="td_relative"  valign="top" align="center"> 
巡查事件编号
</td>
<td class="td_relative" valign="top" align="center"> 
巡查保安
</td>
<td class="td_relative" valign="top" align="center"> 
事件类型
</td> 
<td class="td_relative"  valign="top" align="center"> 
事件发生时间
</td> 
<td class="td_relative"  valign="top" align="center"> 
处理人
</td>
</tr>

<s:form name="listXuncha" action="listXuncha" theme="simple" method="post">
<s:iterator value="#attr.xuncha" status="st">
<tr onclick="checked(this)">
<td width="5%"  valign="top" align="center" class="text">
<input type="hidden" value="<s:property value="xunchaID"/>">
<s:property value="xunchaID"/>
</td>
<td width="8%"  valign="top" align="center" class="text"> 
<s:property value="xuncha_person" />
</td>
<td width="8%"  valign="top" align="center" class="text"> 
<s:property value="xuncha_type" />
</td>

<td width="8%"  valign="top" align="center" class="text"> 
<s:date name="xuncha_time" format="yyyy年MM月dd日 " />
</td>

<td width="8%"  valign="top" align="center" class="text"> 
<s:property value="xuncha_chuliren" />
</td>
</tr>
</s:iterator>
</s:form>
</table>
<p align="center" style="color:red">
当前第<s:property value="current_page" />页
<a href="#" onclick="firstpage3()">[首页]</a>
<a href="#" onclick="priorpage3()">[上一页]</a>
<a href="#" onclick="nextpage3()">[下一页]</a>
<a href="#" onclick="lastpage3()">[尾页]</a>
共<s:property value="xuncha_count" />条
</p>

<p align="center">
<input type="button" value="事件登记" class="buttonstyle" onclick="getPart('initXunchaData.action')"/>
<input type="button" value="查看详情" class="buttonstyle" onclick="detailXuncha()"/>
<input type="button" value="删   除" class="buttonstyle" onclick="deletexuncha()"/>
</p>

</body>
</html>