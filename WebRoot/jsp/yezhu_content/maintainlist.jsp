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
<h1 align="center">报修信息</h1>
<table id="maintainlist" align="center" border="1" cellspacing="0" width="90%" cellpadding="0" class="tablebgcolor" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 

<tr bgcolor=#99CC33 class="text" >
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
<tr>
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
<s:date name="maintain_sdate" format="yyyy年MM月dd日 HH时mm分" />
</td>
</tr>
</s:iterator>
</table>


<p align="center">
<input type="button" value="查看详情" class="buttonstyle" onclick=""/>
<input type="button" value="删    除"  class="buttonstyle" onclick=""/>
<input type="button" value="返   回"  class="buttonstyle" onclick="getPart_yezhu('<%=basePath%>jsp/yezhu_content/yezhu_content.jsp')"/>
</p>
</s:form>
</body>
</html>