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
    <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">商品列表</a></div>
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
var PageTitle = "萌承科技，电子科技业信息服务专家";
var page = { curr: Sys.getPage() || 1, isMainPage : true };
var d_productList = new Array();

Sys.service.on('Account',function(data){
		Sys.service.load('AllMajorProductService');
});

Sys.service.on('AllMajorProductService',function(data,ctx){
	if(data && data.items && data.items.length > 0){
		d_productList = data.items;
		var html = new Array();
		$.each(data.items,function(i){ 
			
			var d = data.items[i];
			html.push('    <a href="pay-product.html?mpid='+d.mpId+'" title="立即订购">                                     ');
            html.push('<dd>                                                                  ');
            //html.push('    <img src="/image/product/'+d.mpId+'.png " width="300" height="225" alt="product" /> ');
            html.push('    <img src="'+Sys.config.xrSrvUrl+'/major-product/'+d.mpId+'/file"'+' " width="300" height="225" alt="product" /> ');
            //html.push('    <em>商品</em>                                                     ');
           
            html.push('<p>商品价格：'+d.price + '元</p>  ');
            html.push('<p>商品名称：'+d.proName+'</p>  ');
			html.push('<p>商品编号：'+d.proNo+'</p>  ');
            
			html.push('<hr style=" height:2px;border:none;border-top:2px dotted #87CEEB;"/>             ');
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
    