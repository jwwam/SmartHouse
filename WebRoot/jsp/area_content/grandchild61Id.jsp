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
<h1 align="center">物业费信息列表</h1>
<div align="center">
<s:form name="searchwuyefei" theme="simple">
查询条件:
业主姓名:<input name="wuyefei_yezhu" type="text" size="3"/>
<s:autocompleter list="#{'':'-请选择-','2010年':'2010年','2011年':'2011年','2012年':'2012年','2013年':'2013年','2014年':'2014年','2015年':'2015年'}" theme="simple" name="wuyefei_year" listKey="key" listValue="value" value=""/>
<s:autocompleter list="#{'':'-请选择-','一月':'一月','二月':'二月','三月':'三月','四月':'四月','五月':'五月','六月':'六月','七月':'七月','八月':'八月','九月':'九月','十月':'十月','十一月':'十一月','十二月':'十二月'}" theme="simple" name="wuyefei_month" listKey="key" listValue="value" value=""/>
<input type="button" value="查   询" class="buttonstyle" onclick="searchwuyefei()"/>
</s:form>
</div>

<table align="center" border="1" cellspacing="0" width="90%" cellpadding="0" class="tablebgcolor" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B"> 

<tr bgcolor=#99CC33 class="text">
<td class="td_relative"  valign="top" align="center"> 
门牌号
</td>
<td class="td_relative" valign="top" align="center"> 
业主
</td>
<td class="td_relative" valign="top" align="center"> 
物业费单价
</td>
<td class="td_relative" valign="top" align="center"> 
缴纳状态
</td> 
<td class="td_relative"  valign="top" align="center"> 
物业费
</td>
<td class="td_relative"  valign="top" align="center"> 
物业费年/月
</td>
<td class="td_relative"  valign="top" align="center"> 
生成日期
</td>
</tr>

<s:form name="listWuyefei" action="listWuyefei" theme="simple" method="post">
<s:iterator value="#attr.wuyefei" status="st">
<tr onclick="checked(this)">
<td width="5%"  valign="top" align="center" class="text">
<input name="wuyefeiID" value="<s:property value="wuyefeiID"/>" type="hidden"/>
<s:property value="wuyefei_homes_number"/>
</td>
<td width="5%"  valign="top" align="center" class="text">
<s:property value="wuyefei_yezhu"/>
</td>
<td width="8%"  valign="top" align="center" class="text"> 
<s:property value="wuyefei_danjia" />
</td>
<td width="8%"  valign="top" align="center" class="text"> 
<s:property value="wuyefei_status" />
</td>
<td width="8%"  valign="top" align="center" class="text"> 
<s:property value="wuyefei_money" />
</td>
<td width="8%"  valign="top" align="center" class="text"> 
<s:property value="wuyefei_year"/><s:property value="wuyefei_month"/>
</td>
<td width="8%"  valign="top" align="center" class="text"> 
<s:date name="wuyefei_date" format="yyyy年MM月dd日"/>
</td>
</tr>
</s:iterator>
</s:form>
</table>
<p align="center" style="color:red">
当前第<s:property value="current_page" />页
<a class="fenye" href="#" onclick="firstpage5()">[首页]</a>
<a class="fenye" href="#" onclick="priorpage5()">[上一页]</a>
<a class="fenye" href="#" onclick="nextpage5()">[下一页]</a>
<a class="fenye" href="#" onclick="lastpage5()">[尾页]</a>
共<s:property value="wuyefei_count"/>条
</p>

<p align="center">
<input type="button" class="buttonstyle" value="生成物业费" onclick="showaddwuyefei()"/>
<input type="button" class="buttonstyle" value="收取物业费" onclick="showshouquwuyefei()"/>
<input type="button" class="buttonstyle" value="查看详情" onclick="showdetailwuyefei()"/>
</p>

<div id="shengchengwuyefei" style="display:none" align="center">
<form name="addWuyefei" action="addWuyefei" id="demo" method="post" onSubmit="return Validator.Validate(this,2)">
<table align="center" border="1" width="55%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="gold" bordercolordark="#FFFFCC">

<tr>
<td align="center">
年份
</td>
<td>
<s:autocompleter list="#{'2010年':'2010年','2011年':'2011年','2012年':'2012年','2013年':'2013年','2014年':'2014年','2015年':'2015年'}" theme="simple" name="wuyefei_year" listKey="key" listValue="value" value="2010年" /><span>*</span>
</td>
<td align="center">
月份
</td>
<td>
<s:autocompleter list="#{'一月':'一月','二月':'二月','三月':'三月','四月':'四月','五月':'五月','六月':'六月','七月':'七月','八月':'八月','九月':'九月','十月':'十月','十一月':'十一月','十二月':'十二月'}" theme="simple" name="wuyefei_month" listKey="key" listValue="value" value="一月" /><span>*</span>
</td>
</tr>


<tr>
<td align="center">
设置单价
</td>
<td>
<input name="wuyefei_danjia" type="text" size="2" dataType="Double" msg="错误的单价输入" /><span>元/M²</span>
</td>

<td align="center">
说明
</td>
<td>
<textarea name="wuyefei_memo" rows="3" cols="30" dataType="Require" msg="请输入物业费说明"/></textarea><span>*</span>
</td>
</tr>

</table>
<input type="button" class="buttonstyle" value="确  认" onclick="submit_shengcheng_wuyefei()"/>
<input type="reset" class="buttonstyle" value="重   置"/>
</form>
</div>

</body>
</html>