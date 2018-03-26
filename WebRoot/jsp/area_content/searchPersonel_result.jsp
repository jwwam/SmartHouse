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
<h1 align="center">查询结果</h1>

<p align="center">
<s:form name="savesearchinfo" theme="simple">
<s:textfield name="personnel_searchname" size="8"/>
<input type="button" class="buttonstyle" value="姓名查询" onclick="searchperson()"/>
</s:form>
</p>

<table id="personnellist" align="center" border="1" cellspacing="0" width="90%" cellpadding="0" class="tablebgcolor" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 
<tr bgcolor=#99CC33 class="text">
<td class="td_relative"  valign="top" align="center"> 
人事编号
</td>
<td class="td_relative" valign="top" align="center"> 
现职
</td>
<td class="td_relative" valign="top" align="center"> 
姓名
</td> 
<td class="td_relative"  valign="top" align="center"> 
年龄
</td> 
<td class="td_relative"  valign="top" align="center"> 
性别
</td>  
<td class="td_relative" valign="top" align="center"> 
电话
</td>
<td class="td_relative" valign="top" align="center"> 
住址
</td>
<td class="td_relative" valign="top" align="center"> 
状态
</td>
</tr>

<s:form name="listPersonnel" action="listPersonnel" theme="simple" method="post">
<s:iterator value="#attr.personnel" status="st">
<tr onclick="checked(this)">
<td width="5%"  valign="top" align="center" class="text">
<input type="hidden" value="<s:property value="personnelID"/>">
<s:property value="personnelID"/>
</td>
<td width="5%"  valign="top" align="center" class="text"> 
<s:property value="personnel_worktype" />
</td>
<td width="5%"  valign="top" align="center" class="text"> 
<s:property value="personnel_name" />
</td> 
<td width="3%"  valign="top" align="center" class="text">
<s:property value="personnel_age" />
</td> 
<td width="3%"  valign="top" align="center" class="text">
<s:property value="personnel_sex" />
</td> 
<td width="8%"  valign="top" align="center" class="text">
<s:property value="personnel_phone" />
</td>
<td width="12%"  valign="top" align="center" class="text">
<s:property value="personnel_addr" />
</td>
<td width="4%"  valign="top" align="center" class="text">
<input type="hidden" value="<s:property value="personnel_status"/>">
<s:property value="personnel_status" />
</td>
</tr>
</s:iterator>
</s:form>
</table>

<p align="center">
<input type="button" value="人事登记" class="buttonstyle" onclick="getPart('<%=basePath%>jsp/area_content/grandchild31Id.jsp')"/>
<input type="button" value="查看详情" class="buttonstyle" onclick="detailPersonnel()"/>
<input type="button" value="正式入职" class="buttonstyle" onclick="zhengshiruzhi()"/>
<input type="button" value="离职" class="buttonstyle" onclick="lizhi()"/>
</p>


<div id="zhengshiruzhi" style="display: none" align="center">
<s:form name="ruzhiPersonnel" action="ruzhiPersonnel" theme="simple" method="post">
<table align="center" border="1" width="30%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="gold" bordercolordark="#FFFFCC">
<tr>
<td align="center">
状态
</td>
<td>
正式入职
</td>
</tr>
<tr>
<td align="center">
工作类型
</td>
<td>
<s:autocompleter list="#{'保安':'保安','环卫工人':'环卫工人','绿化工人':'绿化工人','财务员':'财务员','维修工人':'维修工人','物业管理员':'物业管理员'}" theme="simple" name="personnel_worktype" listKey="key" listValue="value" value="保安" /><span>*</span>
</td>
</tr>
<tr>
<td align="center">
入职备注
</td>
<td align="center">
<s:textarea rows="2" name="personnel_daozhimemo"/>
</td>
</tr>
</table>
</s:form>
<input type="button" value="确  认" class="buttonstyle" onclick="ruzhiperson()"/>
<input type="button" value="取  消" class="buttonstyle" onclick="cancel()"/>
</div>

<div id="lizhi" style="display: none" align="center">
<s:form name="lizhiPersonnel" action="lizhiPersonnel" theme="simple" method="post">
<table align="center" border="1" width="30%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="gold" bordercolordark="#FFFFCC">
<tr>
<td align="center">
状态
</td>
<td>
离职
</td>
</tr>

<tr>
<td align="center">
离职原因
</td>
<td>
<s:textarea name="personnel_lizhimemo" rows="2"/>
</td>
</tr>
</table>
</s:form>
<input type="button" value="确  认" class="buttonstyle" onclick="lizhiperson()"/>
<input type="button" value="取  消" class="buttonstyle" onclick="cancel()"/>
</div>



</body>
</html>