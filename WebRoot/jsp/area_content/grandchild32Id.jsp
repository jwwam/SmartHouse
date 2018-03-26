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
<h1 align="center">人事列表</h1>
<p align="center">
<s:form name="savesearchinfo" theme="simple">
<s:textfield name="personnel_searchname" size="8"/>
<input type="button" value="姓名查询" class="buttonstyle" onclick="searchperson()"/>
</s:form>
</p>

<table id="personnellist" align="center" border="1" cellspacing="0" width="90%" cellpadding="0" class="tablebgcolor" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr bgcolor=#99CC33 class="text">
<td class="td_relative"  valign="top" align="center"> 
人事编号
</td>
<td class="td_relative" valign="top" align="center"> 
职业
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
<p align="center" style="color:red">
当前第<s:property value="current_page" />页
<a href="#" onclick="firstpage2()">[首页]</a>
<a href="#" onclick="priorpage2()">[上一页]</a>
<a href="#" onclick="nextpage2()">[下一页]</a>
<a href="#" onclick="lastpage2()">[尾页]</a>
共<s:property value="personnel_count" />条
</p>

<p align="center">
<input type="button" class="buttonstyle" value="人事登记" onclick="renshidengji()"/>
<input type="button" class="buttonstyle" value="查看详情" onclick="detailPersonnel()"/>
<input type="button" class="buttonstyle" value="正式入职" onclick="zhengshiruzhi()"/>
<input type="button" class="buttonstyle" value="离   职" onclick="lizhi()"/>
</p>


<div id="zhengshiruzhi" style="display: none" align="center">
<s:form name="ruzhiPersonnel" action="ruzhiPersonnel" theme="simple" method="post">
<table align="center" border="1" width="70%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="gold" bordercolordark="#FFFFCC">
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
<s:autocompleter list="#{'保安':'保安','环卫/绿化工':'环卫/绿化工','维修工人':'维修工人','物业管理员':'物业管理员'}" theme="simple" name="personnel_worktype" listKey="key" listValue="value" value="保安" /><span>*</span>
</td>
</tr>
<tr>
<td align="center">
入职描述
</td>
<td>
<s:textarea rows="3" cols="55" name="personnel_daozhimemo"/>
</td>
</tr>
</table>
</s:form>
<input type="button" class="buttonstyle" value="确  认" onclick="ruzhiperson()"/>
<input type="button" class="buttonstyle" value="取  消" onclick="cancel()"/>
</div>

<div id="lizhi" style="display: none" align="center">
<s:form name="lizhiPersonnel" action="lizhiPersonnel" theme="simple" method="post">
<table align="center" border="1" width="70%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="gold" bordercolordark="#FFFFCC">
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
<s:textarea name="personnel_lizhimemo" rows="3" cols="50"/>
</td>
</tr>
</table>
</s:form>
<input type="button" class="buttonstyle" value="确  认" onclick="lizhiperson()"/>
<input type="button" class="buttonstyle" value="取  消" onclick="cancel()"/>
</div>



</body>
</html>