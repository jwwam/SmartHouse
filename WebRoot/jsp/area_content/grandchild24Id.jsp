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
<h1 align="center">业主列表</h1>
<p align="center">
<s:form name="save_yezhu_searchinfo" theme="simple">
姓名:<s:textfield name="name" size="8"/>
门牌号:<s:textfield name="number" size="8"/>
<input type="button" value="查   询" class="buttonstyle" onclick="save_search_yezhu()"/>
</s:form>
</p>

<table id="yezhullist" align="center" border="1" cellspacing="0" width="90%" cellpadding="0" class="tablebgcolor" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr bgcolor=#99CC33 class="text">
<td class="td_relative"  valign="top" align="center"> 
业主编号
</td>
<td class="td_relative" valign="top" align="center"> 
业主姓名
</td>
<td class="td_relative" valign="top" align="center"> 
门牌号
</td> 
<td class="td_relative"  valign="top" align="center"> 
家庭成员
</td> 
<td class="td_relative"  valign="top" align="center"> 
入住日期
</td>
</tr>

<s:form name="listYezhu" action="listYezhu" theme="simple" method="post">
<s:iterator value="#attr.yezhu" status="st">
<tr onclick="checked(this)">
<td width="5%"  valign="top" align="center" class="text">
<input type="hidden" value="<s:property value="yezhuID"/>">
<s:property value="yezhuID"/>
</td>
<td width="5%"  valign="top" align="center" class="text"> 
<s:property value="yezhu_name" />
</td>
<td width="5%"  valign="top" align="center" class="text">
<input type="hidden" value="<s:property value="yezhu_homesnumber"/>">
<s:property value="yezhu_homesnumber" />
</td> 
<td width="10%"  valign="top" align="center" class="text">
<s:property value="yezhu_member" />
</td> 
<td width="8%"  valign="top" align="center" class="text">
<s:date name="yezhu_date" format="yyyy年MM月dd日"/>
</td>
</tr>
</s:iterator>
</s:form>
</table>
<p align="center" style="color:red">
当前第<s:property value="current_page" />页
<a href="#" onclick="firstpage7()">[首页]</a>
<a href="#" onclick="priorpage7()">[上一页]</a>
<a href="#" onclick="nextpage7()">[下一页]</a>
<a href="#" onclick="lastpage7()">[尾页]</a>
共<s:property value="yezhu_count" />条
</p>

<p align="center">
<input type="button" class="buttonstyle" value="业主详情" onclick="detailyezhu()"/>
<input type="button" class="buttonstyle" value="删除业主" onclick="deleteyezhu()"/>
</p>

</body>
</html>