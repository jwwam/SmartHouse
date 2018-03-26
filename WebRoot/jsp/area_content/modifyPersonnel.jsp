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
<s:form name="modifyPersonnel" action="modifyPersonnel" theme="simple" method="post">
<h1 align="center">修改人事信息</h1>
<table align="center" border="1" width="60%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 
<s:iterator value="#attr.personnel" status="st">
<input id="personnelID" value="<s:property value="personnelID"/>" type="hidden"/>
<tr>
<td align="center">
<label>姓名</label>
</td>
<td>
<s:textfield name="personnel_name" size="2"/>
</td>
<td>
<s:text name="">工作类型:</s:text>
</td>
<td>
<s:autocompleter list="#{'保安':'保安','环卫工人':'环卫工人','绿化工人':'绿化工人','财务员':'财务员','维修工人':'维修工人','物业管理员':'物业管理员'}" theme="simple" name="personnel_worktype" listKey="key" listValue="value"/>
</td>
</tr>

<tr>
<td align="center">
<label>年龄</label>
</td>
<td>
<s:textfield name="personnel_age" size="2"/>
</td>
<td align="center"> 
<label>性别</label>
</td>
<td>
<s:radio name="personnel_sex" list="#{'男':'男','女':'女'}"></s:radio>
</td>
</tr>

<tr>
<td align="center">
<label>身份证号</label>
</td>
<td>
<s:textfield name="personnel_idcard"/>
</td>
<td align="center"> 
<label>籍贯</label>
</td>
<td>
<s:textfield name="personnel_jiguan" size="2"/>
</td>
</tr>

<tr>
<td align="center">
<label>电话</label>
</td>
<td>
<s:textfield name="personnel_phone"/>
</td>
<td align="center"> 
<label>地址</label>
</td>
<td>
<s:textfield name="personnel_addr"/>
</td>
</tr>

<tr>
<td align="center">
<label>学历</label>
</td>
<td>
<s:autocompleter list="#{'初中':'初中','高中':'高中','专科':'专科','本科':'本科'}" theme="simple" name="personnel_xueli" listKey="key" listValue="value"/>
</td>
<td align="center"> 
<label>工龄</label>
</td>
<td>
<s:textfield name="personnel_gongling" size="1"/>
</td>
</tr>

<tr>
<td align="center">
<label>以前工作</label>
</td>
<td>
<s:textfield name="personnel_oldwork" size="3"/>
</td>
<td align="center">
<label>人事备注</label>
</td>
<td>
<s:textarea name="personnel_daozhimemo" rows="3"/>
</td>
</tr>

</s:iterator>
</table>
</s:form>
<p align="center">
<input type="button" value="确  认" class="buttonstyle" onclick="modifyperson()"/>
<input type="button" value="返  回" class="buttonstyle" onclick="getPart('listPersonnel.action')"/>
</p>
</body>
</html>