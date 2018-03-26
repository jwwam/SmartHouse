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
<s:form name="detailXuncha" action="detailXuncha" theme="simple" method="post">
<h1 align="center">巡查事件详情</h1>
<table align="center" border="1" width="60%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 
<s:iterator value="#attr.xuncha" status="st">
<tr>
<td align="center" colspan="1">
<label>巡查事件编号</label>
</td>
<td colspan="3">
<s:property value="xunchaID"/>
<input id="xunchaID" value="<s:property value="xunchaID"/>" type="hidden"/>
</td>
</tr>

<tr>
<td align="center"> 
<label>巡查保安</label>
</td>
<td>
<s:property value="xuncha_person"/>
</td>
<td align="center">
<label>事件类型</label>
</td>
<td>
<s:property value="xuncha_type"/>
</td>
</tr>

<tr>
<td align="center"> 
<label>发生日期</label>
</td>
<td>
<s:date name="xuncha_time" format="yyyy年MM月dd" />
</td>
<td align="center">
<label>事件处理人</label>
</td>
<td>
<s:property value="xuncha_chuliren"/>
</td>
</tr>

<tr>
<td align="center"> 
<label>事件当事人</label>
</td>
<td>
<s:property value="xuncha_dangshiren"/>
</td>
<td align="center">
<label>事件结果</label>
</td>
<td>
<s:property value="xuncha_result"/>
</td>
</tr>

<tr>
<td align="center" height="100px" colspan="1"> 
<label>事件描述</label>
</td>
<td colspan="3">
<s:property value="xuncha_memo"/>
</td>
</tr>
</s:iterator>
</table>
</s:form>
<p align="center">
<input type="button" value="修改信息"  class="buttonstyle" onclick="searchformodifyxuncha()"/>
<input type="button" value="返   回"  class="buttonstyle" onclick="getPart('listXuncha.action')"/>
</p>
</body>
</html>