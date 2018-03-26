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
<s:form name="detailWuyefei" action="detailWuyefei" theme="simple" method="post">
<h1 align="center">物业费明细</h1>
<table align="center" border="1" width="80%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 
<s:iterator value="#attr.wuyefei" status="st">
<tr>
<td align="center">
<label>物业费编号</label>
</td>
<td>
<s:property value="wuyefeiID"/>
<input id="wuyefeiID" value="<s:property value="wuyefeiID"/>" type="hidden"/>
</td>
<td align="center"> 
<label>门牌号</label>
</td>
<td>
<s:property value="wuyefei_homes_number"/>
</td>
</tr>

<tr>
<td align="center">
<label>业主</label>
</td>
<td>
<s:property value="wuyefei_yezhu"/>
</td>
<td align="center">
<label>物业费单价</label>
</td>
<td>
<s:property value="wuyefei_danjia"/>
</td>
</tr>

<tr>
<td align="center">
<label>缴纳状态</label>
</td>
<td>
<s:property value="wuyefei_status"/>
</td>
<td align="center">
<label>物业费年/月</label>
</td>
<td>
<s:property value="wuyefei_year"/><s:property value="wuyefei_month"/>
</td>
</tr>

<tr>
<td align="center">
<label>应缴物业费</label>
</td>
<td>
<s:property value="wuyefei_money"/>
</td>
<td align="center">
<label>生成日期</label>
</td>
<td>
<s:date name="wuyefei_date" format="yyyy年MM月dd日"/>
</td>
</tr>

<tr>
<td align="center">
<label>物业费生成者</label>
</td>
<td>
<s:property value="wuyefei_uper"/>
</td>
<td align="center">
<label>物业费说明</label>
</td>
<td>
<s:property value="wuyefei_memo"/>
</td>
</tr>


</s:iterator>
</table>
</s:form>
<p align="center">
<input type="button" value="返   回" class="buttonstyle" onclick="getPart('listWuyefei.action')"/>
</p>
</body>
</html>