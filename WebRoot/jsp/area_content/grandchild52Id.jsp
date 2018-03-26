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
<h1 align="center">绿化保洁列表</h1>

<table align="center" border="1" cellspacing="0" width="90%" cellpadding="0" class="tablebgcolor" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 

<tr bgcolor=#99CC33  class="text">
<td class="td_relative"  valign="top" align="center"> 
绿化保洁编号
</td>
<td class="td_relative" valign="top" align="center"> 
绿化/保洁地点
</td>
<td class="td_relative" valign="top" align="center"> 
绿化/保洁类型
</td> 
<td class="td_relative"  valign="top" align="center"> 
绿化/保洁负责人
</td> 
<td class="td_relative"  valign="top" align="center"> 
绿化/保洁时间
</td>
<td class="td_relative"  valign="top" align="center"> 
状态
</td>
</tr>

<s:form name="listLvhua" action="listLvhua" theme="simple" method="post">
<s:iterator value="#attr.lvhua" status="st">
<tr onclick="checked(this)">
<td width="5%"  valign="top" align="center" class="text">
<input type="hidden" value="<s:property value="lvhuaID"/>">
<s:property value="lvhuaID"/>
</td>
<td width="8%"  valign="top" align="center" class="text"> 
<s:property value="lvhua_area" />
</td>
<td width="8%"  valign="top" align="center" class="text"> 
<s:property value="lvhua_style" />
</td>

<td width="8%"  valign="top" align="center" class="text"> 
<s:property value="lvhua_fuzheren"/>
</td>

<td width="8%"  valign="top" align="center" class="text"> 
<s:date name="lvhua_date" format="yyyy-MM-dd"/>
</td>

<td width="5%"  valign="top" align="center" class="text"> 
<s:property value="lvhua_status"/>
</td>
</tr>
</s:iterator>
</s:form>
</table>
<p align="center" style="color:red">
当前第<s:property value="current_page" />页
<a href="#" onclick="firstpage4()">[首页]</a>
<a href="#" onclick="priorpage4()">[上一页]</a>
<a href="#" onclick="nextpage4()">[下一页]</a>
<a href="#" onclick="lastpage4()">[尾页]</a>
共<s:property value="lvhua_count" />条
</p>

<p align="center">
<input type="button" value="绿化登记" class="buttonstyle" onclick="getPart('<%=basePath%>jsp/area_content/addLvhua.jsp')"/>
<input type="button" value="查看详情" class="buttonstyle" onclick="detailLvhua()"/>
<input type="button" value="验   收" class="buttonstyle" onclick="sendyanshou()"/> 
<input type="button" value="删   除" class="buttonstyle" onclick="deletelvhua()"/>
</p>


<div id="yanshoulvhua" align="center" style="display:none">
<s:form name="yanshouLvhua" action="yanshouLvhua" theme="simple" method="post">
<table align="center" border="1" width="60%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>
<td align="center">
验收人
</td>
<td>
<s:autocompleter list="#{'无':'--请选择--','小李':'小李','老王':'老王','李明':'李明'}" theme="simple" name="lvhua_yanshouren" listKey="key" listValue="value" value="无" />
</td>
</tr>

<tr>
<td align="center">
验收描述
</td>
<td>
<s:textarea name="lvhua_memo" rows="4" cols="50"/>
</td>
</tr>

</table>
</s:form>
<input type="button" value="验   收" class="buttonstyle" onclick="yanshoulvhua()"/>
</div>


</body>
</html>