//公告分页功能
function firstpage()
{   
	selectedTr = null;
	getPart("listNotify.action?p=first");
	
}
function priorpage()
{ selectedTr = null;
	getPart("listNotify.action?p=prior");
}
function nextpage()
{selectedTr = null;
	getPart("listNotify.action?p=next");
}
function lastpage()
{selectedTr = null;
	getPart("listNotify.action?p=last");
}

//维修分页功能
function firstpage1()
{selectedTr = null;
	getPart("listMaintain.action?p=first");
}
function priorpage1()
{selectedTr = null;
	getPart("listMaintain.action?p=prior");
}
function nextpage1()
{selectedTr = null;
	getPart("listMaintain.action?p=next");
}
function lastpage1()
{selectedTr = null;
	getPart("listMaintain.action?p=last");
}


//人事分页功能
function firstpage2()
{selectedTr = null;
	getPart("listPersonnel.action?p=first");
}
function priorpage2()
{selectedTr = null;
	getPart("listPersonnel.action?p=prior");
}
function nextpage2()
{selectedTr = null;
	getPart("listPersonnel.action?p=next");
}
function lastpage2()
{selectedTr = null;
	getPart("listPersonnel.action?p=last");
}


//保安巡查分页功能
function firstpage3()
{selectedTr = null;
	getPart("listXuncha.action?p=first");
}
function priorpage3()
{selectedTr = null;
	getPart("listXuncha.action?p=prior");
}
function nextpage3()
{selectedTr = null;
	getPart("listXuncha.action?p=next");
}
function lastpage3()
{selectedTr = null;
	getPart("listXuncha.action?p=last");
}


//保洁绿化分页功能
function firstpage4()
{selectedTr = null;
	getPart("listLvhua.action?p=first");
}
function priorpage4()
{selectedTr = null;
	getPart("listLvhua.action?p=prior");
}
function nextpage4()
{selectedTr = null;
	getPart("listLvhua.action?p=next");
}
function lastpage4()
{selectedTr = null;
	getPart("listLvhua.action?p=last");
}

//物业费分页
function firstpage5()
{selectedTr = null;
	getPart("listWuyefei.action?p=first");
}
function priorpage5()
{selectedTr = null;
	getPart("listWuyefei.action?p=prior");
}
function nextpage5()
{selectedTr = null;
	getPart("listWuyefei.action?p=next");
}
function lastpage5()
{selectedTr = null;
	getPart("listWuyefei.action?p=last");
}

//房产分页
function firstpage6()
{selectedTr = null;
	getPart("listHomes.action?p=first");
}
function priorpage6()
{selectedTr = null;
	getPart("listHomes.action?p=prior");
}
function nextpage6()
{selectedTr = null;
	getPart("listHomes.action?p=next");
}
function lastpage6()
{selectedTr = null;
	getPart("listHomes.action?p=last");
}

//业主信息分页
function firstpage7()
{selectedTr = null;
	getPart("listYezhu.action?p=first");
}
function priorpage7()
{selectedTr = null;
	getPart("listYezhu.action?p=prior");
}
function nextpage7()
{selectedTr = null;
	getPart("listYezhu.action?p=next");
}
function lastpage7()
{selectedTr = null;
	getPart("listYezhu.action?p=last");
}

//车辆信息分页
function firstpage8()
{
selectedTr = null;
	getPart("listCars.action?p=first");
}
function priorpage8()
{selectedTr = null;
	getPart("listCars.action?p=prior");
}
function nextpage8()
{selectedTr = null;
	getPart("listCars.action?p=next");
}
function lastpage8()
{selectedTr = null;
	getPart("listCars.action?p=last");
}



function modifypassword()
{   
	if(Validator.Validate(document.getElementById('demo'),3))
    {
	var url="updatapsd.action";
	var params=Form.serialize('updatapsd');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:psdResponse,asynchronous:true});
    }
}


function modifyadmin()
{
	if(Validator.Validate(document.getElementById('demo'),3))
    {
	var url="updaAdmin.action";
	var params=Form.serialize('updaAdmin');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:adminResponse,asynchronous:true});
    }
}

function notifyResponse(request){
	var data=request.responseText;
	alert(data);
	getPart("listNotify.action");
}
function homesResponse(request){
	var data=request.responseText;
	if(data =="门牌号已存在")
	{alert(data);}
	else{
	alert(data);
	getPart('listHomes.action');
	}
}
function maintainResponse(request){
	var data=request.responseText;
	alert(data);
	getPart('listMaintain.action');
}

function unmaintainResponse(request){

	var data=request.responseText;
	alert(data);	
	getPart('unMaintain.action');
}

function resultmaintainResponse(request)
{
	var data=request.responseText;
	alert(data);	
	getPart('goMaintain.action');
}

function personnelResponse(request){
	var data=request.responseText;
	alert(data);	
	getPart('listPersonnel.action');
}
//添加公告
function  addnotify(){
	if(Validator.Validate(document.getElementById('demo'),3))
	{
	var url="addNotify.action";
	var params=Form.serialize('addNotify');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:notifyResponse,asynchronous:true});
	}
}

//设置房产
function  addHome(){
	if(Validator.Validate(document.getElementById('demo'),3))
	{
	var url="addHomes.action";
	var params=Form.serialize('addHomes');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:homesResponse,asynchronous:true});
	}
}

function searchhomesResponse(request)
{
	getPart("listHomes.action");
}
function searchhome()
{
	var url="savehomessearchinfo.action";
	var params=Form.serialize('searchhomes');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:searchhomesResponse,asynchronous:true});
}

function detailhomes(){
	if(selectedTr!=null)
	 {
		 id =selectedTr.cells[0].childNodes[0].value;
		 getPart("detailHomes.action?id="+id);
	     selectedTr=null;
	 }
	 else alert("请选择要查看的信息!");
	
}
function deletehomesResponse(request)
{
	var data=request.responseText;
	alert(data);	
	getPart('listHomes.action');
}

function deletehomes(){
	if(selectedTr!=null)
	{   
		if(selectedTr.cells[6].childNodes[0].value=="已入住")
		{
		
		if(confirm("【该房产有业主】\n确定删除?"))
		{
		 id =selectedTr.cells[0].childNodes[0].value;
		 number = selectedTr.cells[1].childNodes[0].value;
		 var url="deleteHomes.action?id="+id+"&number="+number;
		 var myAjax=new Ajax.Request(url,{method:'post',onComplete:deletehomesResponse,asynchronous:true});
		 selectedTr = null;
		}

		}
		else
		{
			if(confirm("确定删除?"))
			{
			 id =selectedTr.cells[0].childNodes[0].value;
			 var url="deleteHomes.action?id="+id;
			 var myAjax=new Ajax.Request(url,{method:'post',onComplete:deletehomesResponse,asynchronous:true});
			 selectedTr = null;
			}	
		}

	}
	 
	 else alert("请选择要删除的信息!");
	
}

//添加公告
function  addmaintain(){
	if(Validator.Validate(document.getElementById('demo'),3))
	{
	//请求的地址
	var url="addMaintain.action";
	//将表单中的数据系列化
	var params=Form.serialize('addMaintain');
	//向服务器发出请求
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:maintainResponse,asynchronous:true});
	}
}	
function addperson(){
	if(Validator.Validate(document.getElementById('demo'),3))
	{
	var url="addPersonnel.action";
	//将表单中的数据系列化
	var params=Form.serialize('addPersonnel');
	//向服务器发出请求
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:personnelResponse,asynchronous:true});
	}
}

function ruzhiperson(){
 if(selectedTr!=null)
{
	id =selectedTr.cells[0].childNodes[0].value;
	var url="ruzhiPersonnel.action?p="+id;
			//将表单中的数据系列化
	var params=Form.serialize('ruzhiPersonnel');
			//向服务器发出请求
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:personnelResponse,asynchronous:true});
	 }
}

function lizhiperson(){
	 if(selectedTr!=null)
	{
		id =selectedTr.cells[0].childNodes[0].value;
		var url="lizhiPersonnel.action?p="+id;
				//将表单中的数据系列化
		var params=Form.serialize('lizhiPersonnel');
				//向服务器发出请求
		var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:personnelResponse,asynchronous:true});
		 }
	}

    
function  updatanotify(){
		//请求的地址
		var url="updataNotify.action";
		//将表单中的数据系列化
		var params=Form.serialize('updataNotify');
		//向服务器发出请求
		var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:notifyResponse,asynchronous:true});
				}

var selectedTr=null; 
function checked(obj){ 
obj.style.backgroundColor='#FFF322'; //把点到的那一行变希望的颜色; 
if(selectedTr!=null) selectedTr.style.removeAttribute("backgroundColor"); 
if(selectedTr==obj) selectedTr=null;//加上此句，以控制点击变白，再点击反灰 
else selectedTr=obj; 
}

function modifynotify(){

	if(selectedTr!=null)
	{
	 var id=selectedTr.cells[0].childNodes[0].value;
	 getPart('modify_notify.action?id='+id);
	 selectedTr = null;
	} 
	else{ 
	alert("请选择要修改的公告"); 
	}
}

function detailmaintain()
{
 if(selectedTr!=null)
 {
	 id =selectedTr.cells[0].childNodes[0].value;
	 getPart("detailMaintain.action?p="+id);
	 selectedTr = null;
 }
 else alert("请选择要查看的信息!");
}


function detailPersonnel()
{
	if(selectedTr!=null)
	{
		id =selectedTr.cells[0].childNodes[0].value;
		getPart("detailPersonnel.action?p="+id);
		selectedTr = null;
	}
	else alert("请选择要查看的信息!");
}

function searchpersonnelResponse(request)
{
	getPart("searchPersonnel.action");
}
function searchperson()
{
	var url="saveSearchinfo.action";
	//将表单中的数据系列化
	var params=Form.serialize('savesearchinfo');
	//向服务器发出请求
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:searchpersonnelResponse,asynchronous:true});
}


function detailXuncha()
{
	if(selectedTr!=null)
	{
		id =selectedTr.cells[0].childNodes[0].value;
		getPart("detailXuncha.action?p="+id);
		selectedTr = null;
	}
	else alert("请选择要查看的信息!");
}

function xunchaResponse(request)
{   
	var data=request.responseText;
	alert(data);
	getPart("listXuncha.action");
}

function addxuncha()
{
	var url="addXuncha.action";
	var params=Form.serialize('addXuncha');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:xunchaResponse,asynchronous:true});
}

function searchformodifyxuncha()
{	var id="";
	id=document.getElementById('xunchaID').value;
	getPart("searchformodifyXuncha.action?p="+id);
}

function modifyxuncha()
{
	var id="";
	id=document.getElementById('xunchaID').value;
	var url="modifyXuncha.action?p="+id;
	//将表单中的数据系列化
	var params=Form.serialize('modifyXuncha');
	//向服务器发出请求
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:xunchaResponse,asynchronous:true});
}

function deletexuncha()
{
	var id="";
	if(selectedTr!=null)
	{   if(confirm("确定删除?"))
		{
		id =selectedTr.cells[0].childNodes[0].value;
		var url="deleteXuncha.action?p="+id;
		var myAjax=new Ajax.Request(url,{method:'post',onComplete:xunchaResponse,asynchronous:true});
		selectedTr=null;
		}
	}
	else alert("请选择要删除的信息");
}

function lvhuaResponse(request)
{   
	var data=request.responseText;
	alert(data);
	getPart("listLvhua.action");
}

function addlvhua()
{
	var url="addLvhua.action";
	var params=Form.serialize('addLvhua');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:lvhuaResponse,asynchronous:true});
}

function deletelvhua()
{
	var id="";
	if(selectedTr!=null)
	{   if(confirm("确定删除?"))
		{
		id =selectedTr.cells[0].childNodes[0].value;
		var url="deleteLvhua.action?p="+id;
		var myAjax=new Ajax.Request(url,{method:'post',onComplete:lvhuaResponse,asynchronous:true});
		selectedTr=null;
		}
	}
	else alert("请选择要删除的信息");
}

function detailLvhua()
{
	if(selectedTr!=null)
	{
		id =selectedTr.cells[0].childNodes[0].value;
		getPart("detailLvhua.action?p="+id);
		selectedTr = null;
	}
	else alert("请选择要查看的信息!");
}

function sendyanshou()//送验收
{//选择要安排维修的信息
 if(selectedTr!=null)
{	 
	 document.getElementById('yanshoulvhua').style.display='';
 }
 else alert("请选择要验收的信息");
}

function yanshoulvhua()
{
	var id="";
    id =selectedTr.cells[0].childNodes[0].value;
	var url="yanshouLvhua.action?p="+id;
	var params=Form.serialize('yanshouLvhua');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:lvhuaResponse,asynchronous:true});
	selectedTr=null;
}



function sendmaintain()
{//选择要安排维修的信息
 if(selectedTr!=null)
{	 
	 document.getElementById('dengji').style.display='';
 }
 else alert("请选择要安排维修的信息");
}

function domaint()
{
	 if(selectedTr!=null)
	 {
		id =selectedTr.cells[0].childNodes[0].value;
		var url="doMaintain.action?p="+id;
			//将表单中的数据系列化
		var params=Form.serialize('doMaintain');
			//向服务器发出请求
		var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:unmaintainResponse,asynchronous:true});

		selectedTr = null;
	 }
	 else alert("请选择要安排维修的信息");
}

function dengjimaintain()
{//选择要登记维修结果的信息
 if(selectedTr!=null)
{	 
	 document.getElementById('jieguo').style.display='';
 }
 else alert("请选择要登记维修结果的信息");
}

function resultmaint()
{
	 if(selectedTr!=null)
	 {
		id =selectedTr.cells[0].childNodes[0].value;
		var url="resultMaintain.action?p="+id;
			//将表单中的数据系列化
		var params=Form.serialize('resultMaintain');
			//向服务器发出请求
		var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:resultmaintainResponse,asynchronous:true});

		selectedTr = null;
	 }
	 else alert("请选择要安排维修的信息");
}

function  delnotify()
{  
	var s="";
	if(selectedTr!=null)
	{
		if(confirm("确认删除?"))
			{
			s=selectedTr.cells[0].childNodes[0].value;
			//设置执行的action并传值
			var url="delNotify.action?id="+s;
			//向服务器发出请求
			var myAjax=new Ajax.Request(url,{method:'post',onComplete:notifyResponse,asynchronous:true});
			selectedTr = null;
			}
	}
	else alert("请选择要删除的公告"); 

}

function searchformodifyperson()
{	var id="";
	id=document.getElementById('personnelID').value;
	getPart("searchformodifyPersonnel.action?p="+id);
}
function modifyperson()
{
	var id="";
	id=document.getElementById('personnelID').value;
	var url="modifyPersonnel.action?p="+id;
	//将表单中的数据系列化
	var params=Form.serialize('modifyPersonnel');
	//向服务器发出请求
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:personnelResponse,asynchronous:true});
}

function zhengshiruzhi()
{
	var s="";
	 if(selectedTr!=null)
	 {	 
		 s=selectedTr.cells[7].childNodes[0].value;
		 if(s=='在职')alert("所选人已在职");
		 else if(s=='已离职')alert("所选人已离职");
		 else{
		 document.getElementById('lizhi').style.display='none';
	 	 document.getElementById('zhengshiruzhi').style.display='';
		 }
	  }
	  else alert("请选择一个记录");
}


function lizhi()
{    
	var s="";
	 if(selectedTr!=null)
	 {	 
		 s=selectedTr.cells[7].childNodes[0].value;
		 if(s=='待入职')alert("所选人还未入职");
		 else if(s=='已离职')alert("所选人已经离职");
		 else{
		 document.getElementById('zhengshiruzhi').style.display='none';
	 	 document.getElementById('lizhi').style.display='';
		 }
	  }
	  else alert("请选择一个记录");
}

function cancel()
{
	document.getElementById('zhengshiruzhi').style.display='none';
	document.getElementById('lizhi').style.display='none';
}



  			 //AJAX局部更新
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

            function getPart(url){
                xmlhttp.open("get",url,true);
                xmlhttp.onreadystatechange = function(){
                    if(xmlhttp.readyState == 4)
                    {
                        if(xmlhttp.status == 200)
                        {   
                            //alert(xmlhttp.responseText);
                            if(xmlhttp.responseText!=""){
                                document.getElementById("area_content").innerHTML = unescape(xmlhttp.responseText);        
                            }
                        }
                        else{
                            document.getElementById("area_content").innerHTML = "数据载入出错";
                        }
                    }
                };
                xmlhttp.setRequestHeader("If-Modified-Since","0");
                xmlhttp.send(null);
            }

function qiehuan(num){
for(var id = 0;id<=7;id++)
    {
  if(id==num)
    {
     document.getElementById("qh_con"+id).style.display="block";
     document.getElementById("mynav"+id).className="nav_on";
    }
      else
     {
       document.getElementById("qh_con"+id).style.display="none";
       document.getElementById("mynav"+id).className="";
     }
    }
  }



function printsetup()  { 
web.execwb(8,1); // 打印页面设置 
 } 
function printpreview()  { 
web.execwb(7,1); //打印页面预览
                }


function yinchanghomes()
{
	if(selectedTr!=null)
	{
	if(selectedTr.cells[6].childNodes[0].value=="已入住")
	{
		alert("该房产已有住户!");
	}
	else
		{
		document.getElementById("homes").style.display="none";
		document.getElementById("addyezhu").style.display="";
		document.getElementById("yezhu_homesid").value=selectedTr.cells[0].childNodes[0].value;
		document.getElementById("yezhu_homesnumber").value=selectedTr.cells[1].childNodes[0].value;
		}
	}
	else alert("请选择一个房产");
}
function yinchangyezhu()
{
	document.getElementById("addyezhu").style.display="none";
	document.getElementById("homes").style.display="";
}
function addyezhuResponse(request){
	var data=request.responseText;
	alert(data);	
	getPart('listHomes.action');
}

function addyezhu()
{
	if(Validator.Validate(document.getElementById('demo'),3))
	{
		var url="addYezhu.action";
		var params=Form.serialize('addYezhu');
		var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:addyezhuResponse,asynchronous:true});
	}
}

function searchyezhuResponse(request)
{
	getPart("listYezhu.action");
}


function save_search_yezhu()
{
	var url="save_yezhu_searchinfo.action";
	var params=Form.serialize('save_yezhu_searchinfo');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:searchyezhuResponse,asynchronous:true});
}

function deleteyezhuResponse(request)
{
	var data=request.responseText;
	alert(data);	
	getPart('listYezhu.action');
}

function deleteyezhu()
{
	if(selectedTr!=null)
	{   
		if(confirm("确定删除住户\n把房产置空?"))
		{
		var id =selectedTr.cells[0].childNodes[0].value;
	    var number = selectedTr.cells[2].childNodes[0].value;
		var url="delete_yezhu.action?id="+id+"&number="+number;
		var myAjax=new Ajax.Request(url,{method:'post',onComplete:deleteyezhuResponse,asynchronous:true});
		selectedTr =null;
		}
	}
	else alert("请选择要删除的业主");
}
function detailyezhu()
{
	if(selectedTr!=null)
	{   
		var id =selectedTr.cells[0].childNodes[0].value;
	    getPart('detail_yezhu.action?id='+id);
	    selectedTr = null;
	}
	else alert("请选择要查看的业主");
}

function return_detailyezhu()
{
	var id = document.getElementById("yezhuID").value;
	getPart('detail_yezhu.action?id='+id);
}

function modifyyezhu()
{   
	var id = document.getElementById("yezhuID").value;
	getPart('modify_yezhu.action?id='+id);
}
function modifyyezhuResponse(request)
{
	var data=request.responseText;
	alert(data);
	var id = document.getElementById("yezhuID").value;
	getPart('detail_yezhu.action?id='+id);
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

function fenpeizhanghao()
{	
	var t=document.getElementById("fenpeizhanghu").style.display;
	if(t=="none")document.getElementById("fenpeizhanghu").style.display="";
	if(t=="")document.getElementById("fenpeizhanghu").style.display="none";
}
function chongshezhanghao()
{	
	var t=document.getElementById("fenpeizhanghu").style.display;
	if(t=="none")document.getElementById("fenpeizhanghu").style.display="";
	if(t=="")document.getElementById("fenpeizhanghu").style.display="none";
}
function cancelfenpei()
{
	document.getElementById("fenpeizhanghu").style.display="none";
}

function fenpeiResponse(request)
{
	var data=request.responseText;
	alert(data);
	var id = document.getElementById("custom_yezhuID").value;	
	getPart('detail_yezhu.action?id='+id);
}

function querenfenpei()
{
	if(Validator.Validate(document.getElementById('demo'),3))
	{
		var url="add_custom_account.action";
		var params=Form.serialize('fenpeizhanghu');
		var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:fenpeiResponse,asynchronous:true});
        document.getElementById("fenpeizhanghu").style.display="none";
	}
}

function carsResponse(request){
	var data=request.responseText;
	alert(data);	
	getPart('listCars.action');
}

function addCar()
{
 
	var url="addCars.action";
	var params=Form.serialize('addCars');
	var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:carsResponse,asynchronous:true});
}

function  updataCar(){
		//请求的地址
		var url="updataCars.action";
		//将表单中的数据系列化
		var params=Form.serialize('updataCars');
		//向服务器发出请求
		var myAjax=new Ajax.Request(url,{method:'post',parameters:params,onComplete:carsResponse,asynchronous:true});
				}

var selectedTr=null; 
function checked(obj){ 
obj.style.backgroundColor='#FFF322'; //把点到的那一行变希望的颜色; 
if(selectedTr!=null) selectedTr.style.removeAttribute("backgroundColor"); 
if(selectedTr==obj) selectedTr=null;//加上此句，以控制点击变白，再点击反灰 
else selectedTr=obj; 
}

function modifyCar(){

	if(selectedTr!=null)
	{
	 var id=selectedTr.cells[0].childNodes[0].value;
	 getPart('modifyCars.action?id='+id);
	 selectedTr = null;
	} 
	else{ 
	alert("请选择要修改的车辆信息"); 
	}
}

function deletecarsResponse(request)
{
	var data=request.responseText;
	alert(data);	
	getPart('listCars.action');
}

function deleteCars()
{
	var id="";
	if(selectedTr!=null)
	{   if(confirm("确定删除?"))
		{
		id =selectedTr.cells[0].childNodes[0].value;
		var url="deleteCars.action?p="+id;
		var myAjax=new Ajax.Request(url,{method:'post',onComplete:deletecarsResponse,asynchronous:true});
		selectedTr=null;
		}
	}
	else alert("请选择要删除的信息");
}
