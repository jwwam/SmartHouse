<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<head>
</head>
<body>
<h1 align="center">巡查事件登记表</h1>
<p align="center">
<s:form name="addXuncha" action="addXuncha" theme="simple">
<table align="center" border="1" width="90%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="gold" bordercolordark="#FFFFCC">
<tr>
<td><s:text name="">巡查保安:</s:text></td>
<td><s:autocompleter list="l" name="xuncha_person"/><span>*</span></td>
<td><s:text name="">事件类型:</s:text></td>
<td><s:autocompleter list="#{'无':'--请选择--','打架斗殴':'打架斗殴','物品遗失':'物品遗失','其他事件':'其他事件'}" theme="simple" name="xuncha_type" listKey="key" listValue="value" value="无" /></td>
</tr>

<tr>
<td><s:text name="">发生日期:</s:text></td>
<td><input name="xuncha_time" class="Wdate" type="text" onClick="WdatePicker()"></td>
<td><s:text name="">事件处理人:</s:text></td>
<td><s:textfield name="xuncha_chuliren" /><span>*</span></td>
</tr>

<tr>
<td><s:text name="">事件当事人:</s:text></td>
<td><s:textfield name="xuncha_dangshiren" /><span>*</span></td>
<td><s:text name="">事件结果:</s:text></td>
<td><s:textfield name="xuncha_result"/><span>*</span></td>
</tr>

<tr>
<td colspan="1"><s:text name="">事件描述</s:text></td>
<td colspan="3"><s:textarea name="xuncha_memo" rows="5" cols="65"></s:textarea></td>
</tr>


</table>
<input type="button" value="登  记" class="buttonstyle" onclick="addxuncha()"/>
<input type="reset" value="重  置" class="buttonstyle" />
<input type="button" value="返  回" class="buttonstyle" onclick="getPart('listXuncha.action')"/>
</s:form>
</p>
</body>
