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
         <li ><a href="./info/on-bbs-view.html?type=2&fp=1&id=3167&hash=hhxQEP" target="_blank" class="ban_banner3" style=" background: url(./web/themes/default/images/banner/ban_banner1.jpg) top center;"></a></li>
         <li ><a href="./info/on-bbs-view.html?type=4&fp=1&id=3053&hash=DfLpYH" target="_blank" class="ban_banner2" style=" background: url(./web/themes/default/images/banner/ban_banner2.jpg) top center;"></a></li>
         <li ><a href="./info/ums.html" target="_blank" class="ban_banner5" style=" background: url(./web/themes/default/images/banner/ban_banner6.jpg) top center;"></a></li>
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
    <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">产品列表</a></div>
  </div>
</div>
  
  <div class="ban_wrapper" >
	<dl class="ban_product_ul" id="proListUl" >
        
	</dl>  
  <div style="text-align:center;display: block;  padding: 20px 60px; text-decoration: none"> <a href="product/product-list.html" >查看更多</a></div>
  </div>
  
</div>


<%@include file="inc/foot-page.jsp" %>

<script type="text/javascript">
'use stricts';
var PageTitle = "借款项目_理财产品_工程项目融资_工程项目贷款_投融资平台_建筑项目融资_班汇通";
var page = { curr: Sys.getPage() || 1 };
var g_dataList = new Array();

Sys.service.on('Account',function(data){
	
	Sys.service.load('AllMajorProductService');
	
});

Sys.service.on('AllMajorProductService',function(data,ctx){
	if(data && data.items && data.items.length > 0){
		g_dataList = data.items;
		var html = new Array();
		$.each(data.items,function(i){ 
			
			var d = data.items[i];
			html.push('    <a href="product/pay-product.html?mpid='+d.mpId+'" title="立即订购">                                     ');
            html.push('<dd>                                                                  ');
            html.push('    <img src="'+Sys.config.xrSrvUrl+'/major-product/'+d.mpId+'/file"'+' " width="300" height="225" alt="product" /> ');
            html.push('    <em>商品</em>                                                     ');
           
            html.push('<p>商品名称：'+d.proName+'</p>  ');
			html.push('<p>商品编号：'+d.proNo+'</p>  ');
            
            html.push('<hr />                                                                ');
            html.push('</dd>                                                                 ');
            html.push('    </a>                                       ');
		});
		
		$("#proListUl").html(html.join('')); 
		
	}
},false);

$(function(){ 
	Sys.countDown();
	
});

</script>
</body>
</html>
    