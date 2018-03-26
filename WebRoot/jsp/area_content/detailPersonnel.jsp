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
<s:form name="detailPersonnel" action="detailPersonnel" theme="simple" method="post">
<h1 align="center">人事详情</h1>
<table align="center" border="1" width="75%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 
<s:iterator value="#attr.personnel" status="st">
<tr>
<td align="center">
<label>人事编号</label>
</td>
<td>
<s:property value="personnelID"/>
<input id="personnelID" value="<s:property value="personnelID"/>" type="hidden"/>
</td>
<td align="center"> 
<label>姓名</label>
</td>
<td>
<s:property value="personnel_name"/>
</td>
</tr>

<tr>
<td align="center">
<label>年龄</label>
</td>
<td>
<s:property value="personnel_age"/>
</td>
<td align="center"> 
<label>性别</label>
</td>
<td>
<s:property value="personnel_sex"/>
</td>
</tr>

<tr>
<td align="center">
<label>身份证号</label>
</td>
<td>
<s:property value="personnel_idcard"/>
</td>
<td align="center"> 
<label>籍贯</label>
</td>
<td>
<s:property value="personnel_jiguan"/>
</td>
</tr>

<tr>
<td align="center">
<label>电话</label>
</td>
<td>
<s:property value="personnel_phone"/>
</td>
<td align="center"> 
<label>地址</label>
</td>
<td>
<s:property value="personnel_addr"/>
</td>
</tr>

<tr>
<td align="center">
<label>学历</label>
</td>
<td>
<s:property value="personnel_xueli"/>
</td>
<td align="center"> 
<label>工龄</label>
</td>
<td>
<s:property value="personnel_gongling"/>
</td>
</tr>

<tr>
<td align="center"> 
<label>工作类型</label>
</td>
<td>
<s:property value="personnel_worktype"/>
</td>
<td align="center">
<label>以前工作</label>
</td>
<td>
<s:property value="personnel_oldwork"/>
</td>
</tr>

<tr>
<td align="center" colspan="1">
<label>状态</label>
</td>
<td>
<s:property value="personnel_status"/>
</td>
<td align="center"> 
<label>入职时间</label>
</td>
<td>
<s:date name="personnel_daozhidate" format="yyyy-MM-dd" />
</td>
</tr>

<tr>
<td align="center" >
<label>离职时间</label>
</td>
<td>
<s:date name="personnel_lizhidate" format="yyyy-MM-dd" />
</td>

<td align="center" colspan="1"> 
<label>离职原因</label>
</td>
<td>
<s:property value="personnel_lizhimemo"/>
</td>
</tr>

<tr>
<td align="center" colspan="1">
<label>人事备注</label>
</td>
<td colspan="3">
<s:property value="personnel_daozhimemo"/>
</td>
</tr>



</s:iterator>
</table>
</s:form>
<p align="center">
<input type="button" value="修改信息" class="buttonstyle" onclick="searchformodifyperson()"/>
<input type="button" value="返  回" class="buttonstyle" onclick="getPart('listPersonnel.action')"/>
</p>
</body>
</html>