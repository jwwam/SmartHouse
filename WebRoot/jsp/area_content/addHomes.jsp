<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<head>
</head>
<body>

<h1 align="center">新增房产信息</h1>
<p align="center">
<form name="addHomes" action="addHomes" id="demo" method="post" onSubmit="return Validator.Validate(this,2)">
<table align="center" border="1" width="70%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">

<tr>
<td colspan="1">楼栋:</td>
<td align="left" colspan="3">
<s:autocompleter list="#{'A栋楼':'A栋楼','B栋楼':'B栋楼','C栋楼':'C栋楼','D栋楼':'D栋楼','E栋楼':'E栋楼','F栋楼':'F栋楼'}" theme="simple" name="Homes_lou" listKey="key" listValue="value" value="A栋楼" />
</td>
</tr>

<tr>
<td>门牌号:</td>
<td><input name="Homes_number" dataType="Account" msg="请输入门牌号" size="3" maxlength="4"/><span>*</span></td>
<td>房间面积:</td>
<td><input name="Homes_area" dataType="Integer" msg="只能是数字(单位m²)" /><span>M²</span></td>
</tr>

<tr>
<td>房产类型:</td>
<td><s:autocompleter list="#{'一套一':'一套一','一套二':'一套二','一套三':'一套三','一套四':'一套四','标准套房':'标准套房','豪华套房':'豪华套房'}" theme="simple" name="Homes_type" listKey="key" listValue="value" value="一套二" /></td>
<td>单元号:</td>
<td><s:autocompleter list="#{'一单元':'一单元','二单元':'二单元','三单元':'三单元','四单元':'四单元'}" theme="simple" name="Homes_danyuan" listKey="key" listValue="value" value="一单元"/></td>
</tr>

<tr>
<td>楼层:</td>
<td><s:autocompleter list="#{'一楼':'一楼','二楼':'二楼','三楼':'三楼','四楼':'四楼','五楼':'五楼','六楼':'六楼','七楼':'七楼','八楼':'八楼','九楼':'九楼','十楼':'十楼'}" theme="simple" name="Homes_louceng" listKey="key" listValue="value" value="一楼"/></td>
<td>朝向:</td>
<td><s:autocompleter list="#{'朝北':'朝北','朝南':'朝南','朝西':'朝西','朝东':'朝东'}" theme="simple" name="Homes_chaoxiang" listKey="key" listValue="value" value="朝东" /></td>
</tr>

<tr>
<td colspan="1">照片:</td>
<td colspan="3">
<s:file name="Homes_photo" theme="simple"/>
</td>
</tr>

<tr>
<td colspan="1">房屋描述:</td>
<td colspan="3"><textarea cols="45" rows="7" dataType="Require" msg="请添加描述信息" name="Homes_memo"></textarea></td>
</tr>
</table>
<input type="button" value="添   加" class="buttonstyle" onclick="addHome()"/>
<input type="reset"  value="重   置" class="buttonstyle"/>
<input type="button" value="返   回"  class="buttonstyle" onclick="getPart('listHomes.action')" />
</form>


</body>