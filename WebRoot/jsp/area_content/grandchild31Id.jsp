<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<head>
</head>
<body>
<h1 align="center">人事登记表</h1>
<p align="center">
<form name="addPersonnel" action="addPersonnel" id="demo" method="post" onSubmit="return Validator.Validate(this,2)">
<table border="1" width="90%" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>
<td>姓名:</td>
<td><input name="personnel_name" dataType="Chinese" msg="姓名只能是中文" size="5"/><span>*</span></td>
<td>性别:</td>
<td><s:radio name="personnel_sex" value="'男'" list="#{'男':'男','女':'女'}" theme="simple"></s:radio></td>
</tr>

<tr>
<td>年龄:</td>
<td><input name="personnel_age" dataType="Age" msg="请输入正确的年龄" size="1" maxlength="3"/><span>*</span></td>
<td>身份证号码:</td>
<td><input name="personnel_idcard" dataType="IdCard" msg="请输入正确的身份证" maxlength="18"/><span>*</span></td>
</tr>

<tr>
<td>工作意项:</td>
<td><s:autocompleter list="#{'保安':'保安','环卫/绿化工':'环卫/绿化工','维修工人':'维修工人','物业管理员':'物业管理员'}" theme="simple" name="personnel_worktype" listKey="key" listValue="value" value="保安"/><span>*</span></td>
<td>手机号码:</td>
<td><input name="personnel_phone" dataType="Mobile" msg="请输入正确的手机号码" maxlength="11"/><span>*</span></td>
</tr>

<tr>
<td colspan="1">住址:</td>
<td colspan="3"><input name="personnel_addr" dataType="Require" msg="请输入住址" size="60"/><span>*</span></td>
</tr>

<tr>
<td>学历:</td>
<td><s:autocompleter list="#{'初中':'初中','高中':'高中','专科':'专科','本科':'本科'}" theme="simple" name="personnel_xueli" listKey="key" listValue="value" value="高中"/></td>
<td>工龄:</td>
<td><input name="personnel_gongling" size="2"/></td>
</tr>

<tr>
<td>籍贯:</td>
<td><input name="personnel_jiguan" dataType="Require" msg="籍贯必填"/></td>
<td>以往工作:</td>
<td><input name="personnel_oldwork"/></td>
</tr>

<tr>
<td colspan="1">描述信息:</td>
<td colspan="3"><textarea name="personnel_daozhimemo" cols="65" rows="5"></textarea></td>
</tr>
</table>
<input type="button" class="buttonstyle" value="登   记" onclick="addperson()"/>
<input type="reset"  class="buttonstyle" value="重   置"/>
<input type="button" class="buttonstyle" value="返   回" onclick="getPart('listPersonnel.action')"/>
</form>

</body>