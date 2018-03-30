<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="inc/common.jsp" %>

<style>
.ban_product_ul:after { content: ""; display: block; clear: both}
.ban_product_ul dd { float: left; text-align: center}
.ban_product_ul dd em { display: block; font-style: normal}
.ban_product_ul dd a { display: block;  padding: 10px 30px; text-decoration: none}
</style>

<body>
<%@include file="inc/head-page.jsp" %>

<div class="ban_banner">
  <div class="main_visual">
    <div class="flicking_con"> <a href="#"></a><a href="#"></a><a href="#"></a><!-- <a href="#"></a> --></div>
    <div class="main_image">
      <ul style="height:422px; width: 100%; overflow: visible;" id="bannerImgUl">
         <li ><a href="./info/about15.html" target="_blank" class="ban_banner3" style=" background: url(./web/themes/default/images/banner/ban_banner1.jpg) top center;"></a></li>
         <li ><a href="./info/about15.html" target="_blank" class="ban_banner2" style=" background: url(./web/themes/default/images/banner/ban_banner2.jpg) top center;"></a></li>
         <li ><a href="./info/about15.html" target="_blank" class="ban_banner5" style=" background: url(./web/themes/default/images/banner/ban_banner6.jpg) top center;"></a></li>
      </ul>
      <a href="javascript:;" id="btn_prev"></a> <a href="javascript:;" id="btn_next"></a> </div>
  </div>
</div>
<!-- <div class="ban_banner" style="width:100%;height:422px">
  <div onclick="javascript:window.open('./info/on-bbs-view.html?type=2&fp=1&id=3601&hash=4cp5zG','_blank');" style="cursor:pointer; height:422px; width: 100%; background: url(./web/themes/default/images/banner/ban_banner2.jpg) top center;"> </div>
</div> -->

<div class="ban_project">

<div class="ban_path">
  <div class="ban_wrapper">
    <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">首页</a></div>
  </div>
</div>

  <div class="ban_wrapper">
<div class="ban_second_img">
    	<a href="./service/apply-service.html" class="ban_second_zhuce">
        	<em>立即申请服务</em>
            <dfn>业内专业的家电修配专家<br />立即申请服务，快来试试吧</dfn>
        </a>
    	<a href="./worker/apply-soldier.html"  class="ban_second_jiekuan">
        	<em>加入天将家族</em>
            <dfn>如果你拥有过硬的维修技术<br />别犹豫，立即加入我们家族吧</dfn>
        </a>
        <a href="./product/product-list.html" class="ban_second_erji">
        	<em>商品选购</em>
            <dfn>我们有家电相关产品，包括电脑及相关产品<br />快来选购吧</dfn>
        </a>
    </div>
    </div>
    
  <div class="ban_preinfo">
  <div class="ban_wrapper" >
	<marquee behavior = "scroll" direction = "up" id="mcUserUl" >
        
	</marquee>  
  <%-- <div style="text-align:center;display: block;  padding: 20px 60px; text-decoration: none"> <a href="product/product-list.html" >查看更多</a></div>
   --%>
   </div> 
   </div>


 <div class="ban_wrapper" >
 	<marquee behavior = "scroll" direction = "left">
       <dl class="ban_product_ul" id="proListUl" >
        
	</dl>   
	</marquee>  
	
</div>
<div class="ban_blink ban_blink_index ban_index_areabg _hide_while_login_"><div class="ban_blink_p">还等什么？</div><a:a href="./worker/soldier-list.html" cssClass="ban_blink_b ban_blink_b_index">立即挑选你的将士吧</a:a></div>
<%@include file="inc/foot-page.jsp" %>

<script type="text/javascript">
'use stricts';
var PageTitle = "萌承科技，电子科技业信息服务专家";
var page = { curr: Sys.getPage() || 1 , isMainPage : true };
var g_dataList = new Array();  

Sys.service.on('Account',function(data){
	
	Sys.service.load('MajorTopTenService');
	Sys.service.load('TopWorkerService');
	
});

Sys.service.on('MajorTopTenService',function(data,ctx){
	if(data && data.length > 0){
		var html = new Array();
		$.each(data,function(i){ 
			var d = data[i];
			html.push('<p style="background-color:#87CEEB;text-align:center;color:yellow;font-size:20px;">'+d.name +'于'+Sys.formatDate(d.createTime,'yyyy-MM-dd hh-mm-ss')+'申请了 '+d.type+'服务......</p> ');
		});
		$("#mcUserUl").html(html.join('')); 
		
	}
},false);

Sys.service.on('TopWorkerService',function(data,ctx){
	
	if(data && data.length > 0){
		var html = new Array();
		$.each(data,function(i){ 
			
			var d = data[i];
			html.push('    <a href="worker/soldier-list.html" title="查看更多">                                     ');
            html.push('<dd>                                                                  ');
           // html.push('    <img src="/image/worker/'+d.mmId+'.png "'+' " width="300" height="225" alt="worker" /> ');
            html.push('    <img src="'+Sys.config.xrSrvUrl+'/files/'+d.fileId+'/single"'+' " width="300" height="225" alt="worker" /> ');
            
            html.push('<p style="color:#87CEEB;">将士姓名：'+d.mmName+'</p>  ');
            html.push('<p style="color:#87CEEB;">将士工号：'+d.mmNo+'</p>  ');
            html.push('<p style="color:#87CEEB;">将士级别：'+d.mmLevel+'</p>  ');
            html.push('<p style="color:red;font-size:20px;">将士电话：<span class="ban_tel_num">'+d.mmMobile+'</span></p>  ');
            
            html.push('<hr style=" height:2px;border:none;border-top:2px dotted #87CEEB;"/>                                                                ');
            html.push('</dd>                                                                 ');
            html.push('    </a>                                       ');
		});
		
		$("#proListUl").html(html.join('')); 
		
	}
},false);
</script>
</body>
</html>
    