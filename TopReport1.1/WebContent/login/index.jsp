<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/application-tags" prefix="app"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>外汇数据采集报送平台</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templets/ui/themes/blue/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templets/ui/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/templets/ui/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/templets/ui/js/uicore-min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/templets/ui/locale/lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/templets/ui/js/uiextend-min.js"></script>
<style type="text/css">
	#li5 a {
		background:url('<%=request.getContextPath() %>/templets/ui/themes/blue/images/login/c_13.png') no-repeat;
	}
</style>
</head>

<body scroll="no" style="overflow:hidden;padding:0px;marggin:0px;">
<div id="northDiv" region="north" class="index-north" border="false">
<table id="headtbl" cellpadding="0" cellspacing="0" width="100%" height="0px" border="0" >
	<tr valign="top"  id="topIndex">
		<td class="banner-left" rowspan=2 ></td>
		<td class="banner-right" nowrap="nowrap">
			<ul class="small-tool">
				<li id="li1"><a href="javascript:void(0)" title="返回主页" onclick="showHome()"></a></li>
				<!-- <li id="li2" addtr="navg"><a href="javascript:void(0)" title="功能切换" onclick="changNavg()"  addtr="navg"></a></li> -->
				<li id="li5"><a href="javascript:void(0)" title="个人密码修改" onclick="doWork('999999','密码修改','/fpages/management/ftl/ChangePwd.ftl');"></a></li>
				<li id="li3"><a href="javascript:void(0)" title="精简菜单" onclick="topHidden()"></a></li>
				<li id="li4"><a href="javascript:void(0)" title="退出"onclick="JavaScript:sExit()"></a></li>
			</ul>
		</td>
	</tr>
	<tr>
		<td>
			<%@ include file="menu/easymenu.jsp"%>
			<!-- <a>外汇数据采集报送平台&nbsp;&nbsp;</a> -->
		</td>
		<td id="topMenu" style="display:none;white-space:nowrap;" nowrap="nowrap">
			<ul class="small-tool">
				<li id="li2"><a href="javascript:void(0)" title="功能切换" onclick="changNavg()"  addtr="navg"></a></li>
				<li id="li3"><a href="javascript:void(0)" title="还原" onclick="topShow()"></a></li>
				<li id="li4"><a href="javascript:void(0)" title="退出" onclick="JavaScript:sExit()"></a></li>
			</ul>
		</td>
	</tr>
</table>
</div>
<div region="center" border="false" id="centerDiv">
<div id ="workframe"></div>
</div>
<div region="south" border="false" class="index-south">
<table id="footer" cellpadding="0" cellspacing="0"  border="0">
	<td class="footer-left">
		<div class="footer-text"><app:userinfotag /></div>
	</td>
	<td class="footer-right" nowrap="nowrap">
	        版本:v1.0
	</td>
</table>
</div>
<%@ include file="menu/navg_menu.jsp"%>
<script type="text/javascript">
	function showHome() {
		dts.refresh('home');
		dts.select('home');
	}
	function topHidden(){
		document.getElementById("topIndex").style.display ="none";
		//document.getElementById("loginMsgTr").style.display = "none";
		document.getElementById("topMenu").style.display = "";
    	//$('#northDiv').width($(this).width());
    	$('#northDiv').height($("#headtbl").height());
    	$('body').layout('panel','north').panel('resize',{height:$("#headtbl").height()});
		$('body').layout('resize');
	}

	function topShow(){
		document.getElementById("topMenu").style.display = "none";
		//document.getElementById("loginMsgTr").style.display = "";
		document.getElementById("topIndex").style.display ="";
    	$('#northDiv').height($("#headtbl").height());
    	$('body').layout('panel','north').panel('resize',{height:$("#headtbl").height()});
		$('body').layout('resize');
	}

	function sExit(){
        var bl = window.confirm("确定要退出系统吗?");
        if(bl){
                window.open("<%=request.getContextPath()%>/custlogout.do", "_top");
        }else{
                return false;
        }
	}

    function doWork(funId,title, url){
    	if(url=='null') {
    		dts.add({id:funId,title:title,content:'<h2>页面['+title+']未实现......</h2>',closable:true});
    	} else {
    		dts.add({id:funId,title:title,url:url,closable:true});
    	}
    }

    $('body').layout();
    var _application_root="<%=request.getContextPath()%>";
    var dts = new DynamicTabSet($("#workframe"),{isHaveNavigate:false});
    var _rootName=null;
    $(function(){
    	$("#_MenuBar a").hover(
    			function(e){
    				var src = e.target || window.event.srcElement;
    				var rName=src.outerText||src.textContent;
    				_rootName=rName;
    			},
    			function(){}
    	);
    	$('#northDiv').css('overflow','visible');
    	$('#northDiv').parent().css('overflow','visible');
        dts.add({id:'home',title:'主页',url:'/login/homepage/home.jsp',isHaveNavigate:false});
		dts.setClosable('home',false);
		_resize();
    });

 function _resize() {
       	$('#northDiv').width($(this)._outerWidth());
       	$('#northDiv').height($("#headtbl").height());
       	$('body').layout('panel','north').panel('resize',{height:$("#headtbl").height()});
		$('body').layout('resize');
    }
    //优化
    $(window).resize(_resize);

</script>
</body>
</html>