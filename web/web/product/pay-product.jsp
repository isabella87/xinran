<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp"%>

<body>
	<%@include file="../inc/head-page.jsp"%>

<div class="ban_project">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a:a href="product-list.html" cssClass="ban_path_a">商品列表</a:a>&gt;<a href="javascript:;" id="_cursor" class="ban_path_a"></a></div>
    </div>
  </div>
  
  <div class="ban_wrapper">
  <form name="orderForm" method="PUT" action="">
    <div class="ban_account_content_w" id="docContent">

	</div>
	</form>
  </div>
</div>
 
<%@include file="../inc/foot-page.jsp"%>

<script type="text/javascript">

var d_product ;
var mpId = Sys.getParam('mpid');

if(!mpId){
	Sys.errorDlg('参数错误！',null,function(){
		window.open("about:blank","_top").close();
	});
}

var productDetailInfo = {mpId : mpId };
Sys.service.on('ProductDetail',function(data){
	if (data) {
		d_product = data;
		showProductDetails();
	}
});

/**
 * 调用服务取到数据后渲染html，将数据展示出来
 */
function showProductDetails(){
	
	var d = d_product;

	var statusDesc = '未知状态';
	
	if(d.status==0){
		statusDesc = '未上架';
	}else if(d.status==1){
		statusDesc = '已上架';
	}
	
	var html = new Array();
	html.push('<div class="ban_infobox_w">                                                                                                     ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield" class="ban_infobox_label">产品图片</label>                                                              ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_input_w">                                                                                          ');
	//html.push('			<img style="display: block; margin: 0 auto;" src="/image/product/'+d.mpId+'.png"></img>');
	html.push('			<img style="display: block; margin: 0 auto;" src="'+Sys.config.xrSrvUrl+'/major-product/'+d.mpId+'/file"></img>');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield1" class="ban_infobox_label">产品名称</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+Sys.encode(d.proName)+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield2" class="ban_infobox_label">价格</label>                                                                 ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+Sys.encode(d.price)+'   元                                                                                                  ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield3" class="ban_infobox_label">商品类型</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+Sys.encode(d.type)+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('</div> ');
	
	/* html.push('	<div class="ban_infobox_bottom">');
	html.push('		<input name="" type="button" class=" ban_button_hilite ban_confirm_order_b submitBtn" value="立即预定"  ');
	html.push('			onclick="submitService()" /> ');
	html.push('	</div>'); */
	
	$("#docContent").html(html.join(''));
	$('#_cursor').html(Sys.encode(d.proName)+"&nbsp;"+d.proNo);
}
	
var ProductDetailInfoForOrder ={};
Sys.service.on('CreateOrderService',function(data){
	if(data==true){
		Sys.infoDlg('<span style="font-weight: bold;color: red;">请至账户中心支付订单！</span>',null,function(){
			var url = Sys.evalUrl('/order/acc-paying-order-list.html');
			//window.open(url);
			Sys.toUrl(url);
    	});
		
	}
},false);

function submitService(){
	
	var form = $(this).parents('form');
	var formName = form.attr('name');
	
		var url = form.attr('action');
		var params = form.serializeObject();
		params.mpId = mpId;
		
		$.extend(ProductDetailInfoForOrder, {m:form.attr('method'), u:url, p : params});
		Sys.service.load('CreateOrderService',{},true);
}
</script>
</body>
</html>