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
<s:form name="listMaintain" action="listMaintain" theme="simple" method="post">
<h1 align="center">报修列表</h1>
<table id="maintainlist" align="center" border="1" cellspacing="0" width="90%" cellpadding="0" class="tablebgcolor" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 

<tr bgcolor=#99CC33 class="text" >
<td class="td_relative"  valign="top" align="center"> 
报修编号
</td> 
<td class="td_relative" valign="top" align="center"> 
业主门牌号
</td> 
<td class="td_relative"  valign="top" align="center"> 
报修物品
</td> 
<td class="td_relative"  valign="top" align="center"> 
维修状态
</td>  
<td class="td_relative" valign="top" align="center"> 
报修日期
</td>  

</tr>
<s:iterator value="#attr.maintain" status="st">
<tr onclick="checked(this)">
<td width="5%"  valign="top" align="center" class="text">
<input type="hidden" value="<s:property value="maintainID"/>">
<s:property value="maintainID"/>
</td>
<td width="5%"  valign="top" align="center" class="text"> 
<s:property value="maintain_homesnumber" />
</td> 
<td width="10%"  valign="top" align="center" class="text">
<s:property value="maintain_thing" />
</td> 
<td width="5%"  valign="top" align="center" class="text">
<s:property value="maintain_status" />
</td> 
<td width="10%"  valign="top" align="center" class="text"> 
<s:date name="maintain_sdate" format="yyyy年MM月dd HH时mm分" />
</td>
</tr>
</s:iterator>
</table>
<p align="center" style="color:red">
当前第<s:property value="current_page" />页
<a href="#" onclick="firstpage1()">[首页]</a>
<a href="#" onclick="priorpage1()">[上一页]</a>
<a href="#" onclick="nextpage1()">[下一页]</a>
<a href="#" onclick="lastpage1()">[尾页]</a>
共<s:property value="maintain_count" />条
</p>


<p align="center">
<input type="button" value="维修登记" class="buttonstyle" onclick="getPart('<%=basePath%>jsp/area_content/addMaintain.jsp')"/>
<input type="button" value="查看详情" class="buttonstyle" onclick="detailmaintain()"/>
<input type="button" value="删   除"  class="buttonstyle" onclick=""/>
</p>
</s:form>
</body>
</html>