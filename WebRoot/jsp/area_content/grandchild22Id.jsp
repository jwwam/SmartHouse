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
<div id="homes">
<div style="height: 50px">
<h1 align="center">房产列表</h1>
</div>
<div align="center">
<s:form name="searchhomes" theme="simple">
查询条件:
<s:autocompleter list="#{'-栋楼-':'-栋楼-','A栋楼':'A栋楼','B栋楼':'B栋楼','C栋楼':'C栋楼','D栋楼':'D栋楼','E栋楼':'E栋楼','F栋楼':'F栋楼'}" theme="simple" name="Homes_lou" listKey="key" listValue="value" value="无" />
门牌号<input name="number" type="text" size="3"/>
<s:autocompleter list="#{'%':'-所有-','已入住':'已入住','未入住':'未入住'}" theme="simple" name="homes_searchcondition" listKey="key" listValue="value"/>
<s:autocompleter list="#{'%':'-户型-','一套一':'一套一','一套二':'一套二','一套三':'一套三','一套四':'一套四','标准套房':'标准套房','豪华套房':'豪华套房'}" theme="simple" name="huxing" listKey="key" listValue="value"/>
面积大于<input name="mianji" type="text" size="2"/><span>M²</span>
楼层<input name="louceng" type="text" size="3"/>
<input type="button" value="查   询" class="buttonstyle" onclick="searchhome()"/>
</s:form>
</div>


<table id="homeslist" align="center" border="1" cellspacing="0" width="80%" cellpadding="0" class="tablebgcolor" > 

<tr bgcolor=#99CC33 class="text" >
<td class="td_relative"  valign="top" align="center">
楼栋
</td> 
<td class="td_relative"  valign="top" align="center">
门牌号
</td> 
<td class="td_relative"  valign="top" align="center"> 
户型
</td> 
<td class="td_relative"  valign="top" align="center"> 
房产面积
</td>
<td class="td_relative" valign="top" align="center"> 
单元号
</td>
<td class="td_relative" valign="top" align="center"> 
楼层
</td>
<td class="td_relative" valign="top" align="center"> 
状态
</td> 
<td class="td_relative" valign="top" align="center"> 
业主
</td>

</tr>

<s:iterator value="#attr.homes" status="st">
<tr onclick="checked(this)">
<td width="5%" valign="top" align="center" class="text">
<input name="HomesID" value="<s:property value="HomesID" />" type="hidden"/>
<s:property value="Homes_lou" />
</td>

<td width="8%"  valign="top" align="center" class="text">
<input name="Homes_number" value="<s:property value="Homes_number" />" type="hidden"/>
<s:property value="Homes_number" />
</td> 
<td width="10%"  valign="top" align="center" class="text"> 
<s:property value="Homes_type" />
</td>
<td width="10%"  valign="top" align="center" class="text"> 
<s:property value="Homes_area" />m²
</td>
<td width="10%"  valign="top" align="center" class="text"> 
<s:property value="Homes_danyuan" />
</td>
<td width="10%"  valign="top" align="center" class="text"> 
<s:property value="Homes_louceng" />
</td>
<td width="9%"  valign="top" align="center" class="text">
<input name="Homes_sell" value="<s:property value="Homes_sell"/>" type="hidden"/>
<s:property value="Homes_sell" />
</td> 
<td width="10%"  valign="top" align="center" class="text"> 
<s:property value="Homes_yezhu" />
</td>
</tr>
</s:iterator>
</table>
<p align="center" style="color:red">
当前第<s:property value="current_page"/>页
<a class="fenye" href="#" onclick="firstpage6()">[首页]</a>
<a class="fenye" href="#" onclick="priorpage6()">[上一页]</a>
<a class="fenye" href="#" onclick="nextpage6()">[下一页]</a>
<a class="fenye" href="#" onclick="lastpage6()">[尾页]</a>
共<s:property value="homes_count" />条
</p>

<p align="center">
<input type="button" class="buttonstyle" value="房产设置" onclick="fangchangshezhi()"/>
<input type="button" class="buttonstyle" value="详细信息" onclick="detailhomes()"/>
<input type="button" class="buttonstyle" value="登记入住" onclick="yinchanghomes()"/>
<input type="button" class="buttonstyle" value="删除房产" onclick="deletehomes()"/>
</p>
</div>

<div id="addyezhu" style="display: none;">
<h1 align="center">登记业主信息</h1>
<p align="center">
<form name="addYezhu" action="addYezhu" id="demo" method="post" onSubmit="return Validator.Validate(this,2)">
<table align="center" border="1" width="90%" cellpadding="5" cellspacing="0" bordercolor="#99CC33" bordercolorlight="white" bordercolordark="#4BD52B">
<tr>
<td>房产编号:</td>
<td><input name="yezhu_homesid" id="yezhu_homesid" type="text" size="1" readonly="readonly"/></td>
<td>门牌号:</td>
<td><input name="yezhu_homesnumber" id="yezhu_homesnumber" readonly="readonly" type="text" size="1"/></td>
</tr>

<tr>
<td>业主姓名:</td>
<td><input name="yezhu_name" dataType="Chinese" msg="姓名只能是中文"/></td>
<td>业主性别:</td>
<td><s:autocompleter list="#{'男':'男','女':'女'}" theme="simple" name="yezhu_sex" listKey="key" listValue="value" value="男" /></td>
</tr>

<tr>
<td>业主年龄:</td>
<td><input name="yezhu_age" dataType="Age" msg="年龄0-100" maxlength="3"/></td>
<td>身份证:</td>
<td><input name="yezhu_IDC" dataType="IdCard" msg="请输入正确的身份证" maxlength="18"/></td>
</tr>

<tr>
<td>座机号码:</td>
<td><input name="yezhu_tel" dataType="Phone" msg="请输入正确的座机号码" maxlength="13"/></td>
<td>手机号码:</td>
<td><input name="yezhu_phone" dataType="Mobile" msg="请输入正确的手机号码" maxlength="11"/></td>
</tr>

<tr>
<td>家庭成员:</td>
<td><input name="yezhu_member" dataType="Require" msg="请输入家庭成员"/></td>
<td>入住时间</td>
<td><input name="yezhu_date" class="Wdate" dataType="Require" msg="请输入时间" onClick="WdatePicker()"></td>
</tr>

<tr>

<td colspan="1">信息描述:</td>
<td colspan="3"><textarea cols="55" rows="7" dataType="Require" msg="请添加描述信息" name="yezhu_memo"></textarea></td>
</tr>

</table>
<input type="button" value="添   加" class="buttonstyle" onclick="addyezhu()"/>
<input type="reset"  value="重   置" class="buttonstyle"/>
<input type="button" value="返   回"  class="buttonstyle" onclick="yinchangyezhu()" />
</form>


</div>
</body>
</html>