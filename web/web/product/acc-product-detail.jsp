<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp"%>

<body>
	<%@include file="../inc/head-page.jsp"%>

	<div class="ban_content">
		<div class="ban_path">
			<div class="ban_wrapper">
				<div class="ban_path_in">
					<a href="/xinran/index.html" class="ban_path_home"></a>&gt;
					<a:a href="javascript:;" cssClass="ban_path_a">账户中心</a:a>
					&gt;<a href="#" class="ban_path_a">产品列表</a>&gt;<a href="#" class="ban_path_a">产品详情</a>
				</div>
			</div>
		</div>
		<div class="ban_wrapper">
			<div class="ban_account">
				<%@include file="../account/account-left.jsp"%>
				<div class="ban_account_content">
					<div class="ban_account_content_w" id="docContent">


					</div>

				</div>
			</div>
		</div>
	</div>

	<%@include file="../inc/foot-page.jsp"%>

<script type="text/javascript">
"use strict";
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
	}else if(d.status==-1){
		statusDesc = '已下架';
	}
	
	var html = new Array();
	html.push('<div class="ban_infobox_w">                                                                                                     ');

	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield" class="ban_infobox_label">产品图片</label>                                                              ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_input_w">                                                                                          ');
	html.push('			<img style="display: block; margin: 0 auto;" src="'+Sys.config.xrSrvUrl+'/files/'+d.fileId+'/single"></img>');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield1" class="ban_infobox_label">产品名称</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+d.proName+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield2" class="ban_infobox_label">价格</label>                                                                 ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+d.price+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield3" class="ban_infobox_label">商品类型</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+d.type+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield" class="ban_infobox_label">产品状态</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+statusDesc+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('</div> ');
	
	html.push('	<div class="ban_infobox_bottom">');
	html.push('		<input name="" type="button" class=" ban_button_check" value="返回"  ');
	html.push('			onclick="history.back()" /> ');
	html.push('	</div>');
	
	$("#docContent").html(html.join(''));
	
}

</script>
</body>
</html>