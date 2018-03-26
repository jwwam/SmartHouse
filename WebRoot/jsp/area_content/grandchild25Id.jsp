<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	%>
	<head>
	</head>
	<body>
		<h1 align="center">
			车辆列表
		</h1>

		<table align="center" border="1" cellspacing="0" width="90%"
			cellpadding="0" class="tablebgcolor" bordercolor="#99CC33"
			bordercolorlight="white" bordercolordark="#4BD52B">

			<tr bgcolor=#99CC33 class="text">
				<td class="td_relative" valign="top" align="center">
					ID编号
				</td>
				<td class="td_relative" valign="top" align="center">
					姓名
				</td>
				<td class="td_relative" valign="top" align="center">
					手机号
				</td>
				<td class="td_relative" valign="top" align="center">
					门牌号
				</td>
				<td class="td_relative" valign="top" align="center">
					车牌号
				</td>
				<td class="td_relative" valign="top" align="center">
					车辆信息
				</td>
				<td class="td_relative" valign="top" align="center">
					存车位
				</td>
				<td class="td_relative" valign="top" align="center">
					到期时间
				</td>
			</tr>

			<s:form name="listCars" action="listCars" theme="simple"
				method="post">
				<s:iterator value="#attr.cars" status="st">
					<tr onclick="checked(this)">
						<td width="5%" valign="top" align="center" class="text">
							<input type="hidden" value="<s:property value="id"/>">
							<s:property value="id" />
						</td>
						<td width="8%" valign="top" align="center" class="text">
							<s:property value="carowner" />
						</td>
						<td width="8%" valign="top" align="center" class="text">
							<s:property value="contactway" />
						</td>

						<td width="8%" valign="top" align="center" class="text">
							<s:property value="housenumber" />
						</td>
						
						<td width="8%" valign="top" align="center" class="text">
							<s:property value="licensenumber" />
						</td>
						
						<td width="8%" valign="top" align="center" class="text">
							<s:property value="carmsg" />
						</td>
						
						<td width="5%" valign="top" align="center" class="text">
							<s:property value="carspace" />
						</td>

						<td width="12%" valign="top" align="center" class="text">
							<s:date name="enddate" format="yyyy年MM月dd日" />
						</td>

					</tr>
				</s:iterator>
			</s:form>
		</table>
		<p align="center" style="color: red">
			当前第
			<s:property value="currentPage" />
			页
			<a href="#" onclick="firstpage8()">[首页]</a>
			<a href="#" onclick="priorpage8()">[上一页]</a>
			<a href="#" onclick="nextpage8()">[下一页]</a>
			<a href="#" onclick="lastpage8()">[尾页]</a> 共
			<s:property value="carsCount" />
			条
		</p>

		<p align="center">
			<input type="button" value="车辆登记" class="buttonstyle"
				onclick="getPart('<%=basePath%>jsp/area_content/addCars.jsp')" />
			  <input type="button" value="信息更改" class="buttonstyle"
				onclick="modifyCar()" />
			<input type="button" value="删   除" class="buttonstyle"
				onclick="deleteCars()" />
		</p>
	</body>
</html>