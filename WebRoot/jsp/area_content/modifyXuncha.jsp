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
<s:form name="modifyXuncha" action="modifyXuncha" theme="simple" method="post">
<h1 align="center">修改巡查事件信息</h1>
<s:iterator value="#attr.xuncha" status="st">
<input id="xunchaID" value="<s:property value="xunchaID"/>" type="hidden"/>
<table  align="center" width="60%" border="1" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>
<td><s:text name="">巡查保安:</s:text></td>
<td><s:autocompleter list="l" name="xuncha_person"/><span>*</span></td>
<td><s:text name="">事件类型:</s:text></td>
<td><s:autocompleter list="#{'打架斗殴':'打架斗殴','物品遗失':'物品遗失','其他事件':'其他事件'}" theme="simple" name="xuncha_type" listKey="key" listValue="value"/></td>
</tr>

<tr>
<td><s:text name="">发生日期:</s:text></td>
<td>
<input name="xuncha_time" class="Wdate" type="text" onClick="WdatePicker()" value="<s:date name="xuncha_time" format="yyyy-MM-dd"/>">
</td>
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
<td colspan="3"><s:textarea name="xuncha_memo" rows="5" cols="50"></s:textarea></td>
</tr>
</table>
</s:iterator>
</s:form>
<p align="center">
<input type="button" value="修  改" class="buttonstyle" onclick="modifyxuncha()"/>
<input type="button" value="返  回" class="buttonstyle" onclick="getPart('listXuncha.action')"/>
</p>
</body>
</html>