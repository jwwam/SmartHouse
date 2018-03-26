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
<s:iterator value="#attr.yezhu" status="st">
<s:form name="detailYezhu" action="detailYezhu" theme="simple" method="post">
<h1 align="center">业主详情</h1>
<table align="center" border="1" width="75%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 
<tr>
<td align="center">
<label>业主编号</label>
</td>
<td>
<s:property value="yezhuID"/>
<input id="yezhuID" value="<s:property value="yezhuID"/>" type="hidden"/>
</td>
<td align="center"> 
<label>门牌号</label>
</td>
<td>
<s:property value="yezhu_homesnumber"/>
</td>
</tr>

<tr>
<td align="center">
<label>业主</label>
</td>
<td>
<s:property value="yezhu_name"/>
</td>
<td align="center">
<label>性别</label>
</td>
<td>
<s:property value="yezhu_sex"/>
</td>
</tr>

<tr>
<td align="center">
<label>年龄</label>
</td>
<td>
<s:property value="yezhu_age"/>
</td>
<td align="center">
<label>座机号码</label>
</td>
<td>
<s:property value="yezhu_tel"/>
</td>
</tr>

<tr>
<td align="center">
<label>手机号码</label>
</td>
<td>
<s:property value="yezhu_phone"/>
</td>
<td align="center">
<label>身份证</label>
</td>
<td>
<s:property value="yezhu_IDC"/>
</td>
</tr>

<tr>
<td align="center">
<label>家庭成员</label>
</td>
<td>
<s:property value="yezhu_member"/>
</td>
<td align="center">
<label>业主入住时间</label>
</td>
<td>
<s:date name="yezhu_date" format="yyyy年MM月dd日"/>
</td>
</tr>

<tr>
<table align="center" border="1" width="75%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>

<td align="center" width="18%">
<label>业主备注信息</label>
</td>
<td>
<s:property value="yezhu_memo"/>
</td>
</tr>
</table>
</tr>

</table>
</s:form>
<p align="center">
<input type="button" value="修改信息" class="buttonstyle" onclick="modifyyezhu()"/>
<%
if(request.getAttribute("len").equals(1))
{
out.print("<input type='button' value='重设账户' class='buttonstyle' onclick='chongshezhanghao()'/>");
}
else
{
out.print("<input type='button' value='分配账户' class='buttonstyle' onclick='fenpeizhanghao()'/>");	
}
%>
<input type="button" value="返   回" class="buttonstyle" onclick="getPart('listYezhu.action')"/>
</p>

<div id="fenpeizhanghu" style="display:none" align="center">
<form name="fenpeizhanghu" action="fenpeizhanghu" id="demo" method="post" onSubmit="return Validator.Validate(this,2)">
<table align="center" border="1" width="30%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="gold" bordercolordark="#FFFFCC">
<input name="custom_yezhuID" id="custom_yezhuID" value="<s:property value="yezhuID"/>" type="hidden"/>
<tr>
<td align="center">
账号
</td>
<td>
<input name="custom_username" dataType="Account" msg="账号必须是字母开头"/><span>*</span>
</td>
</tr>
<tr>
<td align="center">
密码
</td>
<td>
<input name="custom_password" id="first_password" dataType="SafeString" msg="密码必须是6位以上字母和数字集合" type="password"/><span>*</span>
</td>
</tr>

<tr>
<td align="center">
确认密码
</td>
<td>
<input name="Repeat_password" dataType="Repeat" to="first_password" msg="密码不一致" type="password"/><span>*</span>
</td>
</tr>
</table>
<input type="button" class="buttonstyle" value="确  认" onclick="querenfenpei()"/>
<input type="reset"  class="buttonstyle" value="重  置"/>
<input type="button" class="buttonstyle" value="取  消" onclick="cancelfenpei()"/>
</form>

</div>

</s:iterator>
</body>
</html>