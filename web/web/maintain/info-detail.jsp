<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<body>
<%@include file="../inc/head-page.jsp" %>
<!--分类 : fl= 1 表示 借贷攻略 ；fl = 2 表示 了解我们 ；fl = 3 表示 帮助中心 ；  -->
<div class="ban_article">
 <div class="ban_wrapper">

<div class="ban_path">
  <div class="ban_wrapper" id="subDiv">
  <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="javascript:goToInfoList();" id="_cursor" class="ban_path_a"></a>&gt;<a href="javascript:;" id="sub_cursor" class="ban_path_a"></a></div>
  
  </div>
</div>

	<div class="ban_sidebar">
      <ul class="ban_sidenav">
        <li class="ban_sidenav_li"><a id="a_1"  href="info-list.html?type=1" class="ban_sidenav_a">维修资讯</a></li>
        <li class="ban_sidenav_li"><a id="a_2" href="info-list.html?type=2" class="ban_sidenav_a">常见故障</a></li>
        <li class="ban_sidenav_li"><a id="a_3" href="info-list.html?type=3" class="ban_sidenav_a">维护保养</a></li>
        <li class="ban_sidenav_li"><a id="a_4" href="info-list.html?type=4" class="ban_sidenav_a">电脑问题</a></li>
     	<li class="ban_sidenav_li"><a id="a_5" href="info-list.html?type=5" class="ban_sidenav_a">答用户问</a></li>
      </ul>
    </div>
    
  <div class="ban_wrapper">
    
    <div class="ban_main" id="info">
    </div>
    
  </div>
  </div>
</div>

<%@include file="../inc/foot-page.jsp" %>
<script type="text/javascript">
var fl = 1;
var type ;
	$(document).ready(function(){
		type = Sys.getParam('type');
		
		var cursorStr;
		if(type ==1){
			cursorStr = "维修咨询";
		}else if(type ==2){
			cursorStr = "常见故障";
		}else if(type ==3){
			cursorStr = "维护保养";
		}else if(type ==4){
			cursorStr = "电脑问题";
		}else if(type ==5){
			cursorStr = "答用户问";
		}
		$('#_cursor').html(Sys.encode(cursorStr));
		
		$("#a_"+type).attr("class", "ban_sidenav_a ban_current");
		//加载 平台 信息详细页面
		var id = Sys.getParam('id');
		var hash = Sys.getParam('hash');
		var url = '/info/'+ id +'/' +hash;
		
		$.extend(infoDetailServiceInfo,{url : url});
		Sys.service.load('InfoDetailService');
	});
	
	var needShowBack = true,currLoc = window.location.href;
	$('ul.ban_sidenav  li > a',$("#subject_"+fl)).each(function(){
		if(currLoc.indexOf($(this).attr('href'))>=0){
			needShowBack = false;
		}
	});
	
	var infoDetailServiceInfo = {};
	Sys.service.on('InfoDetailService',function(data){
		if(data){
			var html = new Array();
			html.push('<div class="ban_article">');
			html.push('  <div class="ban_article_head">');
			html.push('    <h1 class="ban_article_t">'+data.title+'</h1>');
			html.push('    <div class="ban_article_time">'+(!data.createTime||data.createTime==''?'':Sys.formatDate(data.createTime, 'yyyy年MM月dd日  HH:mm:ss'))+'</div><div class="ban_article_sign"></div>');
			html.push('  </div>');
			html.push('  <div class="ban_article_text">');
			html.push('  <!--后台编辑器生成 开始-->');
			html.push(data.content);
			html.push('  <!--后台编辑器生成 结束-->');
			html.push('  </div>');
			html.push('</div>');
			if(needShowBack){    
				html.push('<div class="ban_back"><a href="'+Sys.evalUrl('/maintain/info-list.html?type='+type )+'" class="ban_button_back"><span class="ban_button_back_t">返回</span></a></div>');
			}
			
			$("#info").first().html(html.join(''));
			$('#sub_cursor').html(Sys.encode(data.title));
		}
	},false);
	
	function goToInfoList(){
		window.self.location.assign(Sys.evalUrl('/maintain/info-list.html?type=')+type); 
	}
	
</script> 
</body>
</html>
