<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	%>
<html>
<body>
<s:iterator value="#attr.yezhu" status="st">
<s:form name="detailYezhu" action="detailYezhu" theme="simple" method="post">
<h1 align="center">个人信息</h1>
<table align="center" border="1" width="85%" height="50%" cellpadding="0" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 
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
<td align="center" colspan="1">
<label>业主备注信息</label>
</td>
<td colspan="3">
<s:property value="yezhu_memo"/>
</td>
</tr>


</table>
</s:form>
</s:iterator>
<p align="center">
<input type="button" value="修改信息" class="buttonstyle" onclick="getPart_yezhu('search_yezhuinfo.action')"/>
<input type="button" value="返   回"  class="buttonstyle" onclick="getPart_yezhu('<%=basePath%>jsp/yezhu_content/yezhu_content.jsp')"/>
</p>
</body>
</html>