<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
<s:head theme="ajax"/>
</head>
<body background="<%=basePath%>images/bg.jpg">

<div style="display:none;">
<s:form action="createDatabase" id="createDatabase">
<s:submit value="映射数据库,别乱点"/>
</s:form>
</div>

<table border="0" align="center" width="100%" style="padding:40px 0 0 0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center">
			<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=" http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
			 	WIDTH="950" HEIGHT="180" ALIGN="center">
				<PARAM NAME="movie" VALUE="<%=basePath%>flash/like.swf">
  				<PARAM NAME="quality" VALUE="high">
  				<param name="wmode" value="transparent">
  				<EMBED src="<%=basePath%>flash/like.swf" 
         		WIDTH="1000" HEIGHT="130" 
         		NAME="main" ALIGN=""
         		TYPE="application/x-shockwave-flash"
         		PLUGINSPAGE=" http://www.macromedia.com/go/getflashplayer">
         		</EMBED> 
         	</OBJECT>
			</td>
		</tr>
		<tr>
			<td height="320" valign="top"
				background=""
				style="padding-top:20px; background-repeat:repeat-x;">
			<table width="780" border="0" align="center" cellspacing="0"  cellpadding="0">
				<tr>
					<td height="280" align="center" valign="top"
						background="<%=basePath%>images/loginbgmid.jpg"
						style="padding-top:106px; background-repeat:no-repeat;">
					<s:form action="checkLogin" theme="simple">
					<table width="260" cellspacing="0" cellpadding="0">
						<tr>
							<s:radio name="check" list="#{'admin':'管理员','custom':'住户'}" value="'admin'"></s:radio>
						</tr>
						<tr>
							<td style="font-size: 15px" valign="middle">账   户:</td>
							<td height="30" align="left" valign="middle">
							<s:textfield name="loginname" size="20"/>
							</td>
						</tr>
						<tr>
							<td style="font-size: 15px" valign="middle">密   码:</td>
							<td height="30" align="left" valign="middle">
							<s:password name="pwd"  size="22"/>
							</td>
						</tr>
						<tr>
							<td style="font-size: 15px" valign="middle">
							</td>
							<td height="25" align="left" style="font-size:13px" valign="middle">
							<input	name="remUser" type="checkbox" checked="checked"/>
							记住用户</td>
						</tr> 
						
						
						<tr>
							<td height="30" colspan="2">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
									<s:submit value="登   陆"/>
									</td>
									<td align="right">
									<s:reset value="重   置"/>
									</td>
								</tr>
							</table>
							</td>
						</tr> 
					</table>
					</s:form>
					
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</body>