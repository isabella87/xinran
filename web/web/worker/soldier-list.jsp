<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<style>
.ban_product_ul:after { content: ""; display: block; clear: both}
.ban_product_ul dd { float: left; text-align: center}
.ban_product_ul dd em { display: block; font-style: normal}
.ban_product_ul dd a { display: block;  padding: 10px 30px; text-decoration: none}
</style>

<body>
<%@include file="../inc/head-page.jsp" %>

<div class="ban_project">
<div class="ban_path">
  <div class="ban_wrapper">
    <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">将士列表</a></div>
  </div>
</div>
  
  <div class="ban_wrapper">
	<dl class="ban_product_ul" id="proListUl">
        
	</dl>  
    <div class="pager" id="pager"></div>
  </div>
 
</div>


<%@include file="../inc/foot-page.jsp" %>

<script type="text/javascript">
'use stricts';
var PageTitle = "石玖信息科技，电子科技业信息服务专家";
var page = { curr: Sys.getPage() || 1, isMainPage : true };
var g_dataList = new Array();

Sys.service.on('Account',function(data){
		Sys.service.load('AllWorkerService');
});

Sys.service.on('AllWorkerService',function(data,ctx){
	if(data && data.items && data.items.length > 0){
		g_dataList = data.items;
		var html = new Array();
		$.each(data.items,function(i){ 
			
			var d = data.items[i];
			html.push('    <a href="soldier-detail.html?mmid='+d.mmId+'" title="点我点我">                                     ');
            html.push('<dd>                                                                  ');
            html.push('    <img src="'+Sys.config.xrSrvUrl+'/files/'+d.fileId+'/single"'+' " width="300" height="225" alt="worker" /> ');
            //html.push('    <img src="/image/worker/'+d.mmId+'.png " width="300" height="225" alt="worker" /> ');
            //html.push('    <em>商品</em>                                                     ');
            html.push('<p style="color:#87CEEB;">将士姓名：'+d.mmName+'</p>  ');
            html.push('<p style="color:#87CEEB;">将士工号：'+d.mmNo+'</p>  ');
            html.push('<p style="color:#87CEEB;">将士级别：'+d.mmLevel+'</p>  ');
            html.push('<p style="color:red;font-size:20px;">将士电话：<span class="ban_tel_num">'+d.mmMobile+'</span></p>  ');
            
            html.push('<hr style=" height:2px;border:none;border-top:2px dotted #87CEEB;"/>      ');
            html.push('</dd>                                                                 ');
            html.push('    </a>                                       ');
		});
		
		$("#proListUl").html(html.join('')); 
		
		Sys.createPage(document.getElementById('pager'), data.pc,3);
		
	}
},false);

$(function(){ 
	Sys.countDown();
	
});

</script>
</body>
</html>
    