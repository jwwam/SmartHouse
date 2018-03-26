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
<form name="modifyYezhu" action="modifyYezhu" theme="simple" id="demo" method="post" onSubmit="return Validator.Validate(this,2)">
<h1 align="center">修改业主信息</h1>
<table align="center" border="1" width="60%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 
<s:iterator value="#attr.yezhu" status="st">
<input name="yezhuID" id="yezhuID" value="<s:property value="yezhuID"/>" type="hidden"/>
<input name="yezhu_homesnumber" value="<s:property value="yezhu_homesnumber"/>" type="hidden"/>
<tr>
<td align="center">
<label>姓名</label>
</td>
<td>
<input name="yezhu_name" dataType="Chinese" msg="请输入中文名字" value="<s:property value="yezhu_name"/>"/>
</td>
<td align="center">
性别
</td>
<td>
<s:autocompleter list="#{'男':'男','女':'女'}" theme="simple" name="yezhu_sex" listKey="key" listValue="value"/>
</td>
</tr>

<tr>
<td align="center">
年龄
</td>
<td>
<input name="yezhu_age" dataType="Age" msg="请输入正确的年龄" value="<s:property value="yezhu_age"/>"/>
</td>
<td align="center"> 
固定电话
</td>
<td>
<input name="yezhu_tel" dataType="Phone" msg="请输入正确的固定电话" value="<s:property value="yezhu_tel"/>"/>
</td>
</tr>

<tr>
<td align="center">
手机号码
</td>
<td>
<input name="yezhu_phone" dataType="Mobile" msg="请输入正确的手机号码" value="<s:property value="yezhu_phone"/>"/>
</td>
<td align="center"> 
身份证
</td>
<td>
<input name="yezhu_IDC" dataType="IdCard" msg="请输入正确的身份证" value="<s:property value="yezhu_IDC"/>"/>
</td>
</tr>

<tr>
<td align="center">
家庭成员
</td>
<td>
<input name="yezhu_member" dataType="Require" msg="请输入家庭成员" value="<s:property value="yezhu_member"/>"/>
</td>
<td align="center"> 
入住时间
</td>
<td>
<input name="yezhu_date" class="Wdate" type="text" onClick="WdatePicker()" value="<s:date name="yezhu_date" format="yyyy-MM-dd"/>">
</td>
</tr>

<tr>
<table align="center" border="1" width="60%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>
<td align="center"> 
业主信息描述
</td>
<td>
<textarea cols="50" rows="7" dataType="Require" msg="请添加描述信息" name="yezhu_memo"><s:property value="yezhu_memo"/></textarea>
</td>
</tr>
</table>
</tr>


</s:iterator>
</table>
<p align="center">
<input type="button" value="确   认" class="buttonstyle" onclick="submit_modify_yezhu()"/>
<input type="reset" value="重   置" class="buttonstyle"/>
<input type="button" value="返   回" class="buttonstyle" onclick="return_detailyezhu()"/>
</p>
</form>

</body>
</html>