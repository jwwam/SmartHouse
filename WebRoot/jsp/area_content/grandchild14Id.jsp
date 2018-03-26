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
<s:form name="listNotify" action="listNotify" theme="simple" method="post">
<h1 align="center">公告列表</h1>
<table align="center" border="1" width="95%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 

<tr bgcolor=#99CC33 class="text" >
<td class="td_relative"  valign="top" align="center"> 
公告编号
</td> 
<td class="td_relative"  valign="top" align="center"> 
公告标题
</td>
<td class="td_relative" valign="top" align="center"> 
公告时间 
</td>
<td class="td_relative" valign="top" align="center"> 
公布者
</td>  

</tr>
<s:iterator value="#attr.notify" status="st">
<tr onclick="checked(this)">
<td width="8%"  valign="top" align="center" class="text">
<input type="hidden" value="<s:property value="notifyID"/>">
<s:property value="notifyID"/>
</td>
<td width="12%"  valign="top" align="center" class="text">
<input type="hidden" value="<s:property value="notify_title"/>">
<s:property value="notify_title" />
</td>
<td width="12%"  valign="top" align="center" class="text"> 
<s:date name="notify_date" format="yyyy-MM-dd HH:mm:ss" /> 
</td> 
<td width="5%"  valign="top" align="center" class="text"> 
<s:property value="notify_uper" />
</td>
</tr>
</s:iterator>
</table>
<p align="center" style="color:red">
当前第<s:property value="current_page" />页
<a href="#" onclick="firstpage()">[首页]</a>
<a href="#" onclick="priorpage()">[上一页]</a>
<a href="#" onclick="nextpage()">[下一页]</a>
<a href="#" onclick="lastpage()">[尾页]</a>
共<s:property value="notify_count" />条
</p>


<p align="center">
<input type="button" class="buttonstyle" value="新增通知" onclick="getPart('<%=basePath%>jsp/area_content/addNotify.jsp')"/>
<input type="button" class="buttonstyle" value="修改通知" onclick="modifynotify()"/>
<input type="button" class="buttonstyle" value="删除通知" onclick="delnotify()"/>
</p>
</s:form>
</body>
</html>