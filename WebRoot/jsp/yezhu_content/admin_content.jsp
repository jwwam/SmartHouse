<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<s:action name="unMaintain" executeResult="false"></s:action>
</head>
<body>
<div class="work">
				<div class="work_top">
				<div>
				<img src="<%=basePath%>images/indexdown.png" id="daibangongzuoTop" onClick="upDownChange('daibangongzuo')"/> 
				<strong onClick="upDownChange('daibangongzuo')">待办工作</strong>
				<img src="<%=basePath%>images/icon_work.gif" align="absmiddle"/>
				</div>
				<div class="more">
					
				</div>
				</div>
				<div id="daibangongzuo" class="work_content">
				 <table style="background:transparent;width:95%;" align="center">
					<tr><th colspan="4">待安排维修信息</th></tr>
					<tr align="center" style="background-color:#D3F7DE;">
					<td>门牌号</td>
					<td>报修物品</td>
					<td>报修时间</td>
					<td><a href="#" onclick="getPart('listMaintain.action');selectedTr = null;" style="color: red;">查看更多</a></td>
					</tr>
					
					<s:iterator value="#attr.maintain" status="st">
					<tr align="center" style="background-color:white;">
					<td>
					<s:property value="maintain_homesnumber"/>
					</td>
					<td><s:property value="maintain_thing" /></td>
					<td><s:date name="maintain_sdate" format="yyyy年MM月dd日"/></td>
					<td>
					<a href="#" onclick="getPart('unMaintain.action');selectedTr = null;" style="color:red;">立即处理</a>
					</td>
					</tr>
					</s:iterator>
					</table>
					
					<table style="background:transparent;width:95%;" align="center">
					<tr align="center"><th colspan="7">收取物业费</th></tr>
					<tr align="center" style="background-color:#D3F7DE;">
					<td>门牌号</td>
					<td>业主</td>
					<td>缴纳状态</td>
					<td>年份</td>
					<td>月份</td>
					<td>物业费总价</td>
					<td><a href="#" onclick="getPart('listWuyefei.action');selectedTr = null;" style="color: red;">查看更多</a></td>
					</tr>
					
					
					<tr align="center" style="background-color:white;">
					<td>B001</td>
					<td>张达明</td>
					<td>未缴纳</td>
					<td>2010年</td>
					<td>二月</td>
					<td>84.0元</td>
					<td><a href="#" style="color: red;">查看详细</a></td>
					</tr>
					<tr align="center" style="background-color:white;">
					<td>B002</td>
					<td>章大妈</td>
					<td>未缴纳</td>
					<td>2010年</td>
					<td>二月</td>
					<td>117.0元</td>
					<td><a href="#" style="color: red;">查看详细</a></td>
					</tr>
					</table>
					
					<table style="background:transparent;width:95%;" align="center">
					<tr align="center"><th colspan="7">收取水电费</th></tr>
					<tr align="center" style="background-color:#D3F7DE;">
					<td>门牌号</td>
					<td>业主</td>
					<td>缴纳状态</td>
					<td>年份</td>
					<td>月份</td>
					<td>水电费总价</td>
					<td><a href="#" style="color: red;">查看更多</a></td>
					</tr>
					
					
					<tr align="center" style="background-color:white;">
					<td>B001</td>
					<td>张达明</td>
					<td>未缴纳</td>
					<td>2010年</td>
					<td>二月</td>
					<td>5.0元</td>
					<td><a href="#" style="color: red;">查看详细</a></td>
					</tr>
					
					<tr align="center" style="background-color:white;">
					<td>B002</td>
					<td>章大妈</td>
					<td>未缴纳</td>
					<td>2010年</td>
					<td>二月</td>
					<td>7.0元</td>
					<td><a href="#" style="color: red;">查看详细</a></td>
					</tr>
					</table>
					
				</div>
</div>
   
<div class="star">
				 <div class="star_top">
				 <div>
			     <img src="<%=basePath%>images/indexup.png" id="AchievementTop" onClick="upDownChange('Achievement');"/> 
			     <strong onClick="upDownChange('Achievement');">小区动态</strong>
			     <img src="<%=basePath%>images/icon_star.gif" align="absmiddle"/>
				 </div>
	
				 <div class="more">
				 <a onclick=""><img src="<%=basePath%>images/icon_more.gif" align="absmiddle">更多</a>
				 </div>
				 </div>
				 <div id="Achievement" class="star_content">
				 <table style="background:transparent;width:95%;" align="center">
					<tr><th colspan="5">新入住业主</th></tr>
					<tr align="center" style="background-color:#D3F7DE;">
					<td>楼栋</td>
					<td>门牌号</td>
					<td>业主姓名</td>
					<td>入住时间</td>
					<td><a href="#" style="color: red;">查看更多</a></td>
					</tr>
					
					<tr align="center" style="background-color:white;">
					<td>A栋楼</td>
					<td>A023</td>
					<td>朱得勇</td>
					<td>2010年5月23日</td>
					<td><a href="#" style="color: red;">详细信息</a></td>
					</tr>
					<tr align="center" style="background-color:white;">
					<td>B栋楼</td>
					<td>B026</td>
					<td>曹梦</td>
					<td>2010年5月22日</td>
					<td><a href="#" style="color: red;">详细信息</a></td>
					</tr>
					<tr align="center" style="background-color:white;">
					<td>B栋楼</td>
					<td>B027</td>
					<td>刘备得</td>
					<td>2010年5月22日</td>
					<td><a href="#" style="color: red;">详细信息</a></td>
					</tr>
					<tr align="center" style="background-color:white;">
					<td>A栋楼</td>
					<td>A008</td>
					<td>张敏</td>
					<td>2010年5月21日</td>
					<td><a href="#" style="color: red;">详细信息</a></td>
					</tr>
					<tr align="center" style="background-color:white;">
					<td>A栋楼</td>
					<td>A027</td>
					<td>杨成玉</td>
					<td>2010年5月20日</td>
					<td><a href="#" style="color: red;">详细信息</a></td>
					</tr>
					</table>
					
				 </div>
			    </div>
</body>
</html>