<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<body>
<%@include file="../inc/head-page.jsp" %>

<div class="ban_article" id="subject_1"  style="display: none;">
 

<div class="ban_path">
  <div class="ban_wrapper">
    <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a:a href="info-list.html" cssClass="ban_path_a">资讯</a:a>&gt;<a href="javascript:;" id="_cursor" class="ban_path_a"></a></div>
   
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
    
   <div class="ban_main">
      <ul class="ban_article_ul"  id="infoList">
      </ul>
      <div id="pager" class="pager"></div>
    </div>

</div>


<%@include file="../inc/foot-page.jsp" %>

<script type="text/javascript">
'use stricts';
var PageTitle = "石玖信息科技，电子科技业信息服务专家";
var type = Sys.getParam('type');
var page = { curr: Sys.getPage() || 1, type : type||1 , isMainPage : false};
var g_dataList = new Array();

$(document).ready(function(){
	type = Sys.getParam('type');
	if(type == null||type == 0){
		type = 1;
	}
	$("#a_"+type).attr("class", "ban_sidenav_a ban_current");
});

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

Sys.service.on('Account',function(data){
		Sys.service.load('InfoAllService');
});

Sys.service.on('InfoAllService',function(data,ctx){
	if(data && data.items && data.items.length > 0){
		g_dataList = data.items;
		var html = new Array(),MAX_SHOW_CON = 90;
		$.each(data.items,function(i){ 
			
			var d = data.items[i];
			var showCon = d.abstractContent,showCon = showCon.length>MAX_SHOW_CON?showCon.substring(0,MAX_SHOW_CON)+"......":showCon;
			html.push('<li class="ban_article_li">');
			html.push('  <a href="javascript:onInfoDetailView('+ d.type + ',' + d.cnId +',\'' + d.hash + '\');" class="ban_article_li_a">');
			html.push('    <h2 class="ban_article_li_t">'+ d.title +'</h2>');
			html.push('    <p class="ban_article_li_time">'+ Sys.formatDate(d.createTime, 'yyyy年MM月dd日  HH:mm:ss') +'</p>');
			html.push('    <p class="ban_article_li_sum">'+ showCon +'</p>');
			html.push('  </a>');
			html.push('</li>');
		});
		
		$("#infoList").html(html.join('')); 
		
		Sys.createPage(document.getElementById('pager'), data.pc);
		
	}
},false);

function onInfoDetailView(type,id,hash){
	    window.location.assign(Sys.evalUrl('/info/acc-info-detail.html?type=' + type +'&id=' + id + '&hash=' + hash));
}

$(function(){ 
	Sys.countDown();
	
});

</script>
</body>
</html>
    