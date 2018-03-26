<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<head>
</head>
<body>
<h1 align="center">绿化保洁登记表</h1>
<p align="center">
<s:form name="addLvhua" action="addLvhua" theme="simple">
<table align="center" border="1" width="70%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>
<td align="center"><s:text name="">绿化/保洁地区:</s:text></td>
<td><s:autocompleter list="#{'无':'--请选择--','前花园':'前花园','后花园':'后花园','停车场':'停车场','游泳池':'游泳池','大门':'大门','楼道':'楼道','其他地区':'其他地区'}" theme="simple" name="lvhua_area" listKey="key" listValue="value" value="无" /><span>*</span></td>
<td align="center"><s:text name="">绿化/保洁类型:</s:text></td>
<td><s:autocompleter list="#{'无':'--请选择--','种花':'种花','种树':'种树','清洁':'清洁','其他':'其他'}" theme="simple" name="lvhua_style" listKey="key" listValue="value" value="无" /><span>*</span></td>
</tr>

<tr>
<td align="center"><s:text name="">日期:</s:text></td>
<td><input name="lvhua_date" class="Wdate" type="text" onClick="WdatePicker()"></td>
<td align="center"><s:text name="">负责人:</s:text></td>
<td><s:textfield name="lvhua_fuzheren" /><span>*</span></td>
</tr>

<tr>
<td colspan="1" align="center"><s:text name="">状态:</s:text></td>
<td colspan="3"><s:autocompleter list="#{'进行中':'进行中','已验收':'已验收'}" theme="simple" name="lvhua_status" listKey="key" listValue="value" value="进行中" /><span>*</span></td>


</tr>

<tr>
<td align="center" colspan="1"><s:text name="">绿化保洁描述</s:text></td>
<td colspan="3"><s:textarea name="lvhua_memo" rows="5" cols="57"></s:textarea></td>
</tr>
</table>
<input type="button" value="登  记" class="buttonstyle" onclick="addlvhua()"/>
<input type="reset" value="重   置" class="buttonstyle"/>
<input type="button" value="返  回" class="buttonstyle" onclick="getPart('listLvhua.action')"/>
</s:form>
</p>
</body>
