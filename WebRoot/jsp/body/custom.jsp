<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
<link rel="stylesheet" href="<%=basePath%>css/default.css" type="text/css" />
<link href="<%=basePath%>css/navbar-pix.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath%>js/navbar.js"     type="text/javascript"></script>
<script src="<%=basePath%>/js/Validator.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/prototype-1.6.0.3.js" type="text/javascript"></script>

<script language="javascript">
var xmlhttp;
try{
    xmlhttp= new ActiveXObject("Msxml2.XMLHTTP");
}catch(e){
    try{
        xmlhttp= new ActiveXObject("Microsoft.XMLHTTP");
    }catch(e){
        try{
            xmlhttp= new XMLHttpRequest();
        }catch(e){}
    }
}
function getPart_yezhu(url){
    xmlhttp.open("get",url,true);
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4)
        {
            if(xmlhttp.status == 200)
            {   
                //alert(xmlhttp.responseText);
                if(xmlhttp.responseText!=""){
                    document.getElementById("yezhu_content").innerHTML = unescape(xmlhttp.responseText);        
                }
            }
            else{
                document.getElementById("yezhu_content").innerHTML = "数据载入出错";
            }
        }
    };
    xmlhttp.setRequestHeader("If-Modified-Since","0");
    xmlhttp.send(null);
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

function modify_custom_psdResponse(request)
{
	var data=request.responseText;
	if(data =="旧密码不正确")
	{
	alert(data);
	document.getElementById("custom_oldpsd").value="";
	}
	else
	{
	alert(data);
	getPart_yezhu('<%=basePath%>jsp/yezhu_content/yezhu_content.jsp');
	}
}

function modifypassword()
{   
	if(Validator.Validate(document.getElementById('demo'),3))
    {
		var url="modify_custom_psd.action";
		var params=Form.serialize('modify_custom_psd');
		var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:modify_custom_psdResponse,asynchronous:true});
    }
}

function modifyyezhuResponse(request)
{
	var data=request.responseText;
	alert(data);
	var id =document.getElementById("yezhuID").value;
	getPart_yezhu('yezhu_info.action?id='+id);
}
function submit_modify_yezhu()
{
	if(Validator.Validate(document.getElementById('demo'),3))
	{
	var url="submit_modify.action";
	var params=Form.serialize('modifyYezhu');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:modifyyezhuResponse,asynchronous:true});
	}
}

function maintainResponse(request){
	var data=request.responseText;
	alert(data);
	getPart_yezhu('yezhu_maitain.action');
}

//添加公告
function  addmaintain(){
	if(Validator.Validate(document.getElementById('demo'),3))
	{
	document.getElementById("maintain_homesnumber").disabled=false;
	
	var url="addMaintain.action";
	var params=Form.serialize('addMaintain');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:maintainResponse,asynchronous:true});
	}
}

getPart_yezhu('<%=basePath%>jsp/yezhu_content/yezhu_content.jsp');
</script>


</head>    
 <body style="background-color:#cdEEF4">    
<table border="0" align="center" width="100%" style="background-color:transparent;">
<tr>    
              <td colspan="3">
                <div align="center">
                
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=" http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" 
			 	width="950" height="150" align="center">
				<param name="movie" value="<%=basePath%>flash/custom.swf"/>
  				<param name="quality" value="high"/>
  				<param name="wmode" value="transparent"/>
  				<EMBED src="<%=basePath%>flash/custom.swf" 
         		WIDTH="1000" HEIGHT="130" 
         		NAME="main" ALIGN=""
         		TYPE="application/x-shockwave-flash"
         		PLUGINSPAGE=" http://www.macromedia.com/go/getflashplayer">
         		</EMBED> 
         		</object>                
         		</div>
				<div class="menu_navcc">
				<div class="menu_nav clearfix">
				<ul class="nav_content">
				<li class="current"><a href="#" onclick="getPart_yezhu('<%=basePath%>jsp/yezhu_content/yezhu_content.jsp')"><span>首页</span></a></li>
				<li><a href="#" onclick="getPart_yezhu('yezhu_info.action?id=<%=session.getAttribute("yezhu_id")%>')"><span>个人信息</span></a></li>
				<li><a href="#" onclick="getPart_yezhu('<%=basePath%>jsp/yezhu_content/addMaintain.jsp')"><span>报修登记</span></a></li>
				<li style="position:relative;"><a href="#" onclick=""><span style="">最新通知</span></a><em></em></li>
				<li style="position:relative;"><a href="#" onclick=""><span>财务信息</span></a><em></em></li>
				</ul>
				<div class="menu_nav_right">
				</div>
				</div>
			  </div>
              </td>    
			</tr> 

	   <tr>
           <td id="leftMenu" style="height:70%;width:18%;padding-left:7px;">  
		   <div id="menu"  style="height:120%;">
		   <div class="tit" id="menu1">
					<div class="titpic" id="pc1"></div>
					<a href="#nojs" class="on" id="menu1_a" tabindex="1" >欢迎使用</a> </div>
				<div class="list" id="menu1_child" style="height:70px;">
					<ul>
					   <li>登录成功,欢迎你!</li>
					   <li>门牌号:<%out.print((String)session.getAttribute("yezhu_number"));%></li>
					   <li>住户:  <%out.print((String)session.getAttribute("yezhu_name"));%>    </li>
					</ul>
				</div>
				<div class="tit" id="menu2" >
					<div class="titpic" id="pc2"></div>
					<a href="#nojs" class="on" id="menu2_a" tabindex="2">系统功能</a> </div>
				<div class="list" id="menu2_child" >
					<ul>
						<li id="m2_1" ><a href="#" onclick="getPart_yezhu('<%=basePath%>jsp/yezhu_content/modifyPassword.jsp')">修改密码</a></li>
						<li id="m2_2" ><a href="<%=basePath%>jsp/index.jsp">更改用户</a></li>
						<li id="m2_3" ><a href="#" onclick="window.close()">退出系统</a></li>
					</ul>
				</div>
				<div class="tit" id="menu3" >
					<div class="titpic" id="pc3"></div>
					<a href="" title="折叠菜单" target="" class="on" id="menu3_a" tabindex="3">小区服务</a> </div>
				<div class="list" id="menu3_child" title="菜单功能区">
					<ul>
						<li id="m3_1" ><a href="#" onclick="getPart_yezhu('<%=basePath%>jsp/yezhu_content/addMaintain.jsp')">报修登记</a></li>
						<li id="m3_2" ><a href="#" onclick="getPart_yezhu('yezhu_maitain.action')">报修查询</a></li>
					</ul>
				</div>
				<div class="tit" id="menu4">
					<div class="titpic" id="pc4"></div>
					<a href="" title="折叠菜单" target="" class="on" id="menu4_a" tabindex="4">小区公告</a> </div>
				<div class="list" id="menu4_child" title="菜单功能区">
					<ul>
						<li id="m4_2" ><a href="#">查看公告</a></li>
						<li id="m4_3" ><a href="#">公告详情</a></li>
					</ul>
				</div>
				<div class="tit" id="menu5">
					<div class="titpic" id="pc5"></div>
					<a href="" title="折叠菜单" target="" class="on" id="menu5_a" tabindex="5">财务信息</a> </div>
				<div class="list" id="menu5_child" title="菜单功能区">
					<ul>
						<li id="m5_1" ><a href="#">物业费</a></li>
						<li id="m5_2" ><a href="#">水电费</a></li>
						<li id="m5_3" ><a href="#">停车费</a></li>
						<li id="m5_4" ><a href="#">个人费用详情</a></li>
					</ul>
				</div>
				<div class="tit" id="menu6">
					<div class="titpic" id="pc6"></div>
					<a href="" title="折叠菜单" class="on" id="menu6_a" tabindex="6">信息查询</a> </div>
				<div class="list" id="menu6_child" title="菜单功能区">
					<ul>
						<li id="m6_2" ><a href="#" onclick="getPart_yezhu('yezhu_info.action?id=<%=session.getAttribute("yezhu_id")%>')">个人信息</a></li>
						<li id="m6_3" ><a href="#">房产信息</a></li>
					</ul>
				</div>
				
				<%--<div class="tit" id="menu7">
					<div class="titpic" id="pc7"></div>
					<a href="" class="on" id="menu7_a" tabindex="6">关于作者</a> </div>
				<div class="list" id="menu7_child" title="菜单功能区">
					<ul id="auth" >
						<li>作者:陈海伟</li>
						<li>QQ:644696931</li>
						<li>电话:15127039348</li>
					</ul>
				</div>--%>
			</div>	
              </td>
			  
              <td style="height:70%;width:3%;background-image:url('<%=basePath%>images/botton_image_in.gif');background-repeat:no-repeat;background-position:center;" id="menuSwitch" onClick="changeLeft()">
			  </td>    
                
  
            <td id="rightMenu" style="height:70%;">
               
	            <div id="yezhu_content" style="width:100%;height:300px;">
	            
	            
			    </div>
		
			</td>
			</tr>

		  
          
  </table>
  <table align="center" width="950px">
    <tr>    
              <td  height="50px" colspan="3" style="background-color:lightblue;">
				<div align="center" >
				<table style="background:transparent;">
				<tr>
				<td style="height:10px;">
				关于我 | About Me | 版权所有  ©<%--陈海伟 --%>
				</td>
				</tr>
				<tr>
				<td style="height:10px;">
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