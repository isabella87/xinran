<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp"%>

<body>
	<%@include file="../inc/head-page.jsp"%>

	<div class="ban_project">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a:a href="product-list.html" cssClass="ban_path_a">产品展示</a:a>&gt;<a href="javascript:;" id="_cursor" class="ban_path_a"></a></div>
    </div>
  </div>
  <div class="ban_wrapper">
  
    <div class="ban_account_content_w" id="docContent">

	</div>
	
  </div>
</div>

<form id="tenderForm" action="" method="POST"   target="_new">
	<input type="hidden" name="amt" />
	<input type="hidden" name="pId" />
</form>

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
	html.push('		<div class="ban_infobox_input_w">                                                                                          ');
	html.push('			<input type="text" name="pro-name"                                                                                     ');
	html.push('				class="ban_infobox_input _required _length" min="1" max="30"  placeholder="必填" value="'+d.proName+'"/>                                ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield2" class="ban_infobox_label">价格</label>                                                                 ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_input_w">                                                                                          ');
	html.push('			<input type="text" name="price"                                                                                        ');
	html.push('				class="ban_infobox_input _int  _length" min="0"  max="8" placeholder="必填" value="'+d.price+'" />                            ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield3" class="ban_infobox_label">商品类型</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<select class="ban_infobox_select" name="product-type">                                                                    ');
	html.push('			<option selected="selected" value="'+d.type+'">'+d.type+'</option>                                                                   ');
	html.push('            <option value="显示器">显示器</option>                                                                              ');
	html.push('            <option value="鼠标">鼠标</option>                                                                                  ');
	html.push('            <option value="键盘">键盘</option>                                                                                  ');
	html.push('		</select>                                                                                                                  ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield" class="ban_infobox_label">产品状态</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_input_w">                                                                                          ');
	html.push('			<input type="text" name="pro-status"                                                                                     ');
	html.push('				class="ban_infobox_input _required _length" min="0" max="8"  placeholder="必填" value="'+statusDesc+'"/>                                ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('</div> ');
	
	html.push('	<div class="ban_infobox_bottom">');
	html.push('		<input name="" type="button" class=" ban_button_check" value="确认购买"  ');
	html.push('			onclick="history.back()" /> ');
	html.push('	</div>');
	
	$("#docContent").html(html.join(''));
	$('#_cursor').html(Sys.encode(d.proName)+"&nbsp;"+d.proNo);
	
}

</script>
</body>
</html>