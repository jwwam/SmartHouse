<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<s:head theme="ajax"/>

<script src="<%=basePath%>/js/prototype-1.6.0.3.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/Validator.js" type="text/javascript"></script>
<script src="<%=basePath%>DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/myjs.js" type="text/javascript" ></script>
<script src="<%=basePath%>js/navbar.js" type="text/javascript"></script>

<link href="<%=basePath%>css/default.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/css.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/navbar-pix.css" rel="stylesheet" type="text/css" />




<script type="text/javascript">
function psdResponse(request)
{
	var data=request.responseText;
	alert(data);
	getPart('<%=basePath%>jsp/area_content/admin_index.jsp');
}
function adminResponse(request)
{
	var data=request.responseText;
	alert(data);
	getPart('<%=basePath%>jsp/area_content/grandchild13Id.jsp');
}

function fangchangshezhi()
{
	selectedTr = null;
	getPart('<%=basePath%>jsp/area_content/addHomes.jsp');
}
function renshidengji()
{   
	selectedTr = null;
    getPart('<%=basePath%>jsp/area_content/grandchild31Id.jsp');
}
function showaddwuyefei()
{
	var t = document.getElementById("shengchengwuyefei").style.display;
	if(t=="")document.getElementById("shengchengwuyefei").style.display="none";
	if(t=="none")document.getElementById("shengchengwuyefei").style.display="";
}

function addwuyefeiResponse(request)
{
	var data=request.responseText;
	alert(data);
	getPart("listWuyefei.action");
}

function submit_shengcheng_wuyefei()
{
	if(Validator.Validate(document.getElementById('demo'),3))
	{
	var url="shengcheng_wuyefei.action";
	var params=Form.serialize('addWuyefei');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:addwuyefeiResponse,asynchronous:true});
	}
}

function shouquwuyefeiResponse(request)
{
	var data=request.responseText;
	alert(data);
	getPart("listWuyefei.action");
}

function showshouquwuyefei()
{
	 if(selectedTr!=null)
		{
			id =selectedTr.cells[0].childNodes[0].value;
			var url="shouqu_wuyefei.action?id="+id;
			var myAjax=new Ajax.Request(url,{method:'post',onComplete:shouquwuyefeiResponse,asynchronous:true});
		}
	 else alert("请选择要收取的记录");
}
function showdetailwuyefei()
{
	if(selectedTr!=null)
	{
		id =selectedTr.cells[0].childNodes[0].value;
		getPart('detail_wuyefei.action?id='+id);
		selectedTr = null;
	}
	 else alert("请选择要查看的详情");
}

</script>


<script language="javascript">
function upDownChange(divID){
	var indexcurrStyle=document.getElementById(divID).style.display;
	if(indexcurrStyle=="none"){
		document.getElementById(divID).style.display="";
		document.getElementById(divID+"Top").src="<%=basePath%>images/indexup.png";
	}else{
		document.getElementById(divID).style.display="none";
		document.getElementById(divID+"Top").src="<%=basePath%>images/indexdown.png";
	}
}

</script>

<script language="javascript">
function upDownChange(divID){
	var indexcurrStyle=document.getElementById(divID).style.display;
	if(indexcurrStyle=="none"){
		document.getElementById(divID).style.display="";
		document.getElementById(divID+"Top").src="<%=basePath%>images/indexup.png";
	}else{
		document.getElementById(divID).style.display="none";
		document.getElementById(divID+"Top").src="<%=basePath%>images/indexdown.png";
	}
}
</script>
<script language="javascript" type="text/javascript">    
  function  changeLeft()    
  {    
  left=document.getElementById("leftMenu");    
  mid=document.getElementById("menuSwitch");    
  right=document.getElementById("rightMenu");
  if(left.style.display   ==   ''){    
  left.style.display   =  'none';   
  mid.style.width='2%';
  right.style.width='100%';
  mid.style.backgroundImage="url('<%=basePath%>images/botton_image_out.gif')";
  mid.style.backgroundRepeat = "no-repeat";
  mid.style.backgroundPosition = "center";
  }    
  else{    
  left.style.display   = '';       
  mid.style.width='2%';
  right.style.width='80%';
  mid.style.background="url('<%=basePath%>images/botton_image_in.gif')";
  mid.style.backgroundRepeat = "no-repeat";
  mid.style.backgroundPosition = "center";
  }    
  }    
</script>
 

<script language="JavaScript" type="text/JavaScript">
var show = true;
var hide = false;
//修改菜单的上下箭头符号
function my_on(head,body)
{
	var tag_a;
	for(var i=0;i<head.childNodes.length;i++)
	{
		if (head.childNodes[i].nodeName=="A")
		{
			tag_a=head.childNodes[i];
			break;
		}
	}
	tag_a.className="on";
}
function my_off(head,body)
{
	var tag_a;
	for(var i=0;i<head.childNodes.length;i++)
	{
		if (head.childNodes[i].nodeName=="A")
		{
			tag_a=head.childNodes[i];
			break;
		}
	}
	tag_a.className="off";
}
//添加菜单	
window.onload=function()
{
	m1 =new Menu("menu1",'menu1_child','dtu','1',show,my_on,my_off);
	m1.init();
	m2 =new Menu("menu2",'menu2_child','dtu','1',hide,my_on,my_off);
	m2.init();
	m3 =new Menu("menu3",'menu3_child','dtu','1',hide,my_on,my_off);
	m3.init();
	m4 =new Menu("menu4",'menu4_child','dtu','1',hide,my_on,my_off);
	m4.init();
	m5 =new Menu("menu5",'menu5_child','dtu','1',hide,my_on,my_off);
	m5.init();
	m6 =new Menu("menu6",'menu6_child','dtu','1',hide,my_on,my_off);
	m6.init();
	m7 =new Menu("menu7",'menu7_child','dtu','1',show,my_on,my_off);
	m7.init();
}

getPart('<%=basePath%>jsp/yezhu_content/admin_content.jsp');
</script>

</head>
<body style="background-color: #cdffff">

<table border="0" align="center" width="100%" style="background-color:transparent;">
<tr>
<td align="center" width="100%" colspan="2">
<div>
<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=" http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
			 	WIDTH="950" HEIGHT="150" ALIGN="center">
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
</div>
<div id=menu_out>
<div id=menu_in>
<div id=menu>
<UL id=nav>
<LI class="menu_line"></LI><LI><a onmouseover="javascript:qiehuan(0)" id="mynav0" class="nav_on" onclick="getPart('<%=basePath%>jsp/yezhu_content/admin_content.jsp')" ><span>首页</span></a></LI>
<LI class="menu_line"></LI><LI><a onmouseover="javascript:qiehuan(1)" id="mynav1" class="nav_off"><span>用户功能</span></a></LI>
<LI class="menu_line"></LI><li><a onmouseover="javascript:qiehuan(2)" id="mynav2" class="nav_off"><span>物业管理</span></a></li>
<li class="menu_line"></li><li><a onmouseover="javascript:qiehuan(3)" id="mynav3" class="nav_off"><span>人事管理</span></a></li>
<li class="menu_line"></li><li><a onmouseover="javascript:qiehuan(4)" id="mynav4" class="nav_off"><span>报修管理</span></a></li>
<li class="menu_line"></li><li><a onmouseover="javascript:qiehuan(5)" id="mynav5" class="nav_off"><span>保卫绿化</span></a></li>
<li class="menu_line"></li><li><a onmouseover="javascript:qiehuan(6)" id="mynav6" class="nav_off"><span>费用管理</span></a></li>
<li class="menu_line"></li><li><a onmouseover="javascript:qiehuan(7)" id="mynav7" class="nav_off"><span>系统功能</span></a></li>
</UL>
 
<div id=menu_con>
<div id=qh_con0 style="DISPLAY: block">

</div> 
<div id=qh_con1 style="DISPLAY: none">
<UL>
  <LI><A href="#" onclick="getPart('<%=basePath%>jsp/area_content/grandchild13Id.jsp')"><span>个人信息</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="#" onclick="getPart('listNotify.action');selectedTr = null;"><span>公告管理</span></A></LI><LI class=menu_line2></LI>
</UL>
</div> 
<div id=qh_con2 style="DISPLAY: none"><UL>
  <LI><a href="#" onclick="getPart('<%=basePath%>jsp/area_content/addHomes.jsp')"><span>房产设置</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="#" onclick="getPart('listHomes.action');selectedTr = null;"><SPAN>房产管理</SPAN></A></LI><LI class=menu_line2></LI>
  <LI><A href="#" onclick="getPart('listYezhu.action');selectedTr = null;"><SPAN>业主查询</SPAN></A></LI><LI class=menu_line2></LI>
  <LI><a href="#" onclick="getPart('listCars.action');selectedTr = null;"><span>车辆管理</span></A></LI><LI class=menu_line2></LI>
</UL></div> 
<div id=qh_con3 style="DISPLAY: none"><UL>
  <LI><a href="#" onclick="getPart('<%=basePath%>jsp/area_content/grandchild31Id.jsp')"><span>人事登记</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="#" onclick="getPart('listPersonnel.action');selectedTr = null;"><SPAN>人事管理</SPAN></A></LI><LI class=menu_line2></LI>
</UL></div> 
<div id=qh_con4 style="DISPLAY: none"><UL>
  <LI><a href="#" onclick="getPart('<%=basePath%>jsp/area_content/addMaintain.jsp')"><span>报修登记</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="#" onclick="getPart('listMaintain.action');selectedTr = null;"><SPAN>报修查询</SPAN></A></LI><LI class=menu_line2></LI>
  <LI><A href="#" onclick="getPart('unMaintain.action');selectedTr = null;"><SPAN>安排维修</SPAN></A></LI><LI class=menu_line2></LI>
  <LI><A href="#" onclick="getPart('goMaintain.action');selectedTr = null;"><SPAN>维修结果</SPAN></A></LI><LI class=menu_line2></LI>
</UL></div> 
<div id=qh_con5 style="DISPLAY: none"><UL>
  <LI><a href="#" onclick="getPart('listXuncha.action')"><span>保安巡查</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="#" onclick="getPart('listLvhua.action')"><SPAN>保洁绿化</SPAN></A></LI><LI class=menu_line2></LI>
</UL></div>
<div id=qh_con6 style="DISPLAY: none"><UL>
  <LI><a href="#" onclick="getPart('listWuyefei.action');selectedTr = null;"><span>物业费管理</span></A></LI><LI class=menu_line2></LI>   
  <LI><A href="#" onclick="getPart('<%=basePath%>jsp/area_content/grandchild62Id.jsp')"><SPAN>水电费管理</SPAN></A></LI><LI class=menu_line2></LI>
  <LI><A href="#" onclick="getPart('<%=basePath%>jsp/area_content/grandchild63Id.jsp')"><SPAN>罚款费管理</SPAN></A></LI><LI class=menu_line2></LI>
  <LI><A href="#" onclick="getPart('<%=basePath%>jsp/area_content/grandchild64Id.jsp')"><SPAN>工资管理</SPAN></A></LI><LI class=menu_line2></LI>
  <!-- 
  <LI><A href="#" onclick="getPart('<%=basePath%>jsp/area_content/grandchild65Id.jsp')"><SPAN>财务报表</SPAN></A></LI><LI class=menu_line2></LI>
  -->
</UL></div>
<div id=qh_con7 style="DISPLAY: none">
<UL>
  <LI><A href="#" onclick="getPart('<%=basePath%>jsp/area_content/grandchild12Id.jsp')"><span>修改密码</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="<%=basePath%>jsp/index.jsp"><span>重新登陆</span></A></LI><LI class=menu_line2></LI>
  <LI><A href="#" onclick="window.close();"><span>退出系统</span></A></LI><LI class=menu_line2></LI>
</UL>
</div>
</div></div></div></div>
</td>
</tr>

<tr>
<td id="tdcolor">
<div>
	  <div class="tit" id="menu1">
					<div class="titpic" id="pc1"></div>
					<a href="#nojs" class="on" id="menu1_a" tabindex="1" >欢迎使用</a></div>
				    <div class="list" id="menu1_child" style="height:100px;width:185px;">
					<ul>
					   <li>
									今天是:
								</li>
								<li id="DateTime">
									<script> 
         setInterval("DateTime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
      </script>
								</li>
								<li>
									欢迎你管理员:<%
									out.print((String) session.getAttribute("user"));
								%>
								</li>
					</ul>
		</div>
				<div class="tit" id="menu2" >
					<div class="titpic" id="pc2"></div>
					<a href="#nojs" class="on" id="menu2_a" tabindex="2">系统功能</a> </div>
				<div class="list" id="menu2_child" style="height:100px;width:185px;">
					<ul>
						<li id="m2_1" ><a href="#" onclick="getPart_yezhu('<%=basePath%>jsp/yezhu_content/modifyPassword.jsp')">修改密码</a></li>
						<li id="m2_2" ><a href="<%=basePath%>jsp/index.jsp">更改用户</a></li>
						<li id="m2_3" ><a href="#" onclick="window.close()">退出系统</a></li>
					</ul>
				</div>
				<div class="tit" id="menu3" >
					<div class="titpic" id="pc3"></div>
					<a href="" title="折叠菜单" target="" class="on" id="menu3_a" tabindex="3">小区服务</a> </div>
				<div class="list" id="menu3_child" style="height:100px;width:185px;">
					<ul>
						<li id="m3_1" ><a href="#" onclick="getPart_yezhu('<%=basePath%>jsp/yezhu_content/addMaintain.jsp')">报修登记</a></li>
						<li id="m3_2" ><a href="#" onclick="getPart_yezhu('yezhu_maitain.action')">报修查询</a></li>
					</ul>
				</div>
				<div class="tit" id="menu4">
					<div class="titpic" id="pc4"></div>
					<a href="" title="折叠菜单" target="" class="on" id="menu4_a" tabindex="4">小区公告</a> </div>
				<div class="list" id="menu4_child" style="height:100px;width:185px;">
					<ul>
						<li id="m4_2" ><a href="#">查看公告</a></li>
						<li id="m4_3" ><a href="#">公告详情</a></li>
					</ul>
				</div>
				<div class="tit" id="menu5">
					<div class="titpic" id="pc5"></div>
					<a href="" title="折叠菜单" target="" class="on" id="menu5_a" tabindex="5">财务信息</a> </div>
				<div class="list" id="menu5_child" style="height:100px;width:185px;">
					<ul>
						<li id="m5_1" ><a href="#">物业费</a></li>
						<li id="m5_2" ><a href="#">水电费</a></li>
						<li id="m5_3" ><a href="#">停车费</a></li>
						<li id="m5_4" ><a href="#">个人费用详情</a></li>
					</ul>
				</div>
				<div class="tit" id="menu6">
					<div class="titpic" id="pc6"></div>
					<a href="" class="on" id="menu6_a" tabindex="6">信息查询</a> </div>
				<div class="list" id="menu6_child" style="height:100px;width:185px;">
					<ul>
						<li id="m6_2" ><a href="#" onclick="getPart_yezhu('yezhu_info.action?id=<%=session.getAttribute("yezhu_id")%>')">个人信息</a></li>
						<li id="m6_3" ><a href="#">房产信息</a></li>
					</ul>
				</div>
				<%--<div class="tit" id="menu7">
					<div class="titpic" id="pc7"></div>
					<a href="" class="on" id="menu7_a" tabindex="6">关于作者</a> </div>
				<div class="list" id="menu7_child" style="height:100px;width:185px;">
					<ul id="auth" >
						<li>作者:陈海伟</li>
						<li>QQ:644696931</li>
						<li>电话:15127039348</li>
					</ul>
				</div>--%>
			</div>	
</td>
<td height="400px" width="80%" id="tdcolor">
<div id="area_content">

</div>
</td>
</tr>

<tr>    
                <td  height="50px"   style="background-color:#7CCB72;" colspan="2">
				<div align="center">
				<table style="background:transparent;font-size:11px;">
				<tr>
				<td>
				关于我 | About Me | 版权所有  ©<%--陈海伟 --%>
				</td>
				</tr>
				<tr>
				<td>
				Copyright © 2018 - 2021 |chenhaiwei. All Rights Reserved
				</td>
				</tr>
				</table>
				</div>
			 </td>    
</tr>
</table>

</body>
</html>