<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<s:action name="new_notify" executeResult="false"></s:action>
<s:action name="new_wuyefei" executeResult="false"></s:action>
</head>
<body>
<div class="work">
				<div class="work_top">
				<div>
				<img src="<%=basePath%>images/indexdown.png" id="daibangongzuoTop" onClick="upDownChange('daibangongzuo')"/> 
				<strong onClick="upDownChange('daibangongzuo')">最新公告</strong>
				<img src="<%=basePath%>images/icon_work.gif" align="absmiddle"/>
				</div>
				<div class="more">
					<a onclick=""><img src="<%=basePath%>images/icon_shux.gif" align="absmiddle">刷新</a>
					<a onclick=""><img src="<%=basePath%>images/icon_more.gif" align="absmiddle">更多</a>
				</div>
				</div>
				<div id="daibangongzuo" class="work_content">
				<table style="background:transparent;width:100%;">
				<tr align="center">
				<th>公告标题</th>
				<th>发布日期</th>
				</tr>
				
				<s:iterator value="#attr.notify" status="st">
				<tr align="center">
				<td><s:property value="notify_title" /></td>
				<td><s:date name="notify_date" format="yyyy年MM月dd日"/></td>
				<td><a href="#">查看详情</a></td>
				</tr>
				</s:iterator>
				</table>
				
				
				</div>
				</div>
	            
	            
				 <div class="star">
				 <div class="star_top">
				 <div>
			     <img src="<%=basePath%>images/indexup.png" id="AchievementTop" onClick="upDownChange('Achievement');"/> 
			     <strong onClick="upDownChange('Achievement');">财务提醒</strong>
			     <img src="<%=basePath%>images/icon_star.gif" align="absmiddle"/>
				 </div>
	
				 <div class="more">
				 <a onclick=""><img src="<%=basePath%>images/icon_more.gif" align="absmiddle">更多</a>
				 </div>
				 </div>
				 <div id="Achievement" class="star_content">
				 <table style="background:transparent;width:100%;">
					<tr><th colspan="8">物业费缴纳通知</th></tr>
					<tr align="center" style="background-color:#D3F7DE;">
					<td>门牌号</td>
					<td>业主</td>
					<td>物业费单价</td>
					<td>物业费状态</td>
					<td>年份</td>
					<td>月份</td>
					<td>总价</td>
					<td>备注</td>
					</tr>
					
					<s:iterator value="#attr.wuyefei" status="st">
					<tr align="center" style="background-color:white;">
					<td><s:property value="wuyefei_homes_number"/></td>
					<td><s:property value="wuyefei_yezhu"/></td>
					<td><s:property value="wuyefei_danjia"/>元</td>
					<td><s:property value="wuyefei_status"/></td>
					<td><s:property value="wuyefei_year"/></td>
					<td><s:property value="wuyefei_month"/></td>
					<td><s:property value="wuyefei_money"/>元</td>
					<td><s:property value="wuyefei_memo"/></td>
					</tr>
					</s:iterator>
					</table>
					
					
					<table style="background:transparent;width:100%;" align="center">
					<tr align="center"><th colspan="11">水电费缴纳通知</th></tr>
					<tr align="center" style="background-color:#D3F7DE;">
					<td>门牌号</td>
					<td>业主</td>
					<td>水费单价</td>
					<td>电费单价</td>
					<td>水费读数</td>
					<td>电费读数</td>
					<td>水电费状态</td>
					<td>年份</td>
					<td>月份</td>
					<td>水电费总价</td>
					<td>备注</td>
					</tr>
					
					
					<tr align="center" style="background-color:white;">
					<td>B001</td>
					<td>张达明</td>
					<td>1.2元</td>
					<td>0.6元</td>
					<td>20吨</td>
					<td>100度</td>
					<td>未缴纳</td>
					<td>2010年</td>
					<td>二月</td>
					<td>84.0元</td>
					<td>二月水电费</td>
					</tr>
					</table>
					
				
				 </div>
			    </div>
</body>
</html>