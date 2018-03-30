<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>
<body>

<%@include file="../inc/head-page.jsp" %>

<div class="ban_content">
		<div class="ban_path">
			<div class="ban_wrapper">
				<div class="ban_path_in">
					<a href="/xinran/index.html" class="ban_path_home"></a>&gt;
					<a:a href="javascript:;" cssClass="ban_path_a">账户中心</a:a>
					&gt;<a href="#" class="ban_path_a">订单列表</a>&gt;<a href="#" class="ban_path_a">订单详情</a>
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


<%@include file="../inc/foot-page.jsp" %>


<script type="text/javascript">
"use strict";
var g_order = {};
var poId = Sys.getParam('poid');

if(!poId){
	Sys.errorDlg('参数错误！',null,function(){
		window.open("about:blank","_top").close();
	});
}

var orderDetailInfo = {poId : poId};
Sys.service.on('OrderDetail',function(data){
	if (data) {
		g_order = data;
		showOrderDetails();
	}
});


function showOrderDetails(){
	var d = g_order;
	var html = new Array();                                                                                                                                               
	var statusDesc = '未知状态';
	var payStatusDesc='未知方式';
	
	if(d.status==0){
		statusDesc = '待确认';
	}else if(d.status==1){
		statusDesc = '待支付';
	}else if(d.status==2){
		statusDesc = '已支付';
	}  
	
	if(d.payType==0){
		payStatusDesc = '线下支付';
	}else if(d.payType==1){
		payStatusDesc = '待支付宝支付';
	}else if(d.payType==2){
		payStatusDesc = '微信支付';
	} 
	                                                                                                                                                                      
html.push('	<div class="ban_infobox_w">                                                                                                                                   ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield" class="ban_infobox_label">姓名</label>                                                                                       ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('			<div class="ban_infobox_input_w">                                                                                                                     ');
html.push('				<input type="text" name="name"                                                                                                                    ');
html.push('					class="ban_infobox_input _required _length" min="1" max="30"  placeholder="" value="'+d.realName+'"/>                                                     ');
html.push('			</div>                                                                                                                                                ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');

html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield" class="ban_infobox_label">手机号</label>                                                                                       ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('			<div class="ban_infobox_input_w">                                                                                                                     ');
html.push('				<input type="text" name="name"                                                                                                                    ');
html.push('					class="ban_infobox_input _required _length" min="1" max="30"  placeholder="" value="'+d.mobile+'"/>                                                     ');
html.push('			</div>                                                                                                                                                ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');

html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield1" class="ban_infobox_label">商品名称</label>                                                                                          ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('			<div class="ban_infobox_input_w">                                                                                                                     ');
html.push('				<input type="text" name="mobile"                                                                                                                  ');
html.push('					class="ban_infobox_input _required" placeholder="" value="'+d.proName+'"/>                                                                  ');
html.push('			</div>                                                                                                                                                ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield2" class="ban_infobox_label">商品编号</label>                                                                                        ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('			<div class="ban_infobox_input_w">                                                                                                                     ');
html.push('				<input type="text" name="id-card"                                                                                                                 ');
html.push('					class="ban_infobox_input _required " placeholder="" value="'+d.proNo+'"/>                                                                   ');
html.push('			</div>                                                                                                                                                ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield3" class="ban_infobox_label">订单价格</label>                                                                                        ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('			<div class="ban_infobox_input_w">                                                                                                                     ');
html.push('				<input type="text" name="address"                                                                                                                 ');
html.push('					class="ban_infobox_input _length" min="1" max="50" placeholder="" value="'+d.price+'" />                                                                 ');
html.push('			</div>                                                                                                                                                ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield3" class="ban_infobox_label">生成时间</label>                                                                                        ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('			<div class="ban_infobox_input_w">                                                                                                                     ');
html.push('	<input type="text" class="ban_infobox_input" name="due-time" placeholder=""  value="'+Sys.formatDate(d.createTime,'yyyy-MM-dd')+'"/>          ');
html.push('			</div>                                                                                                                                                ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield" class="ban_infobox_label">订单编号</label>                                                                                         ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('			<div class="ban_infobox_input_w">                                                                                                                     ');
html.push('				<input type="text" name="service-name"                                                                                                            ');
html.push('					class="ban_infobox_input _length" min="1" max="30"  placeholder="" value="'+d.orderNo+'"/>                                                                         ');
html.push('			</div>                                                                                                                                                ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');

html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield" class="ban_infobox_label">支付描述</label>                                                                                         ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('			<div class="ban_infobox_input_w">                                                                                                                     ');
html.push('				<input type="text" name="service-status"                                                                                                            ');
html.push('					class="ban_infobox_input _length" min="1" max="30"  placeholder="" value="'+payStatusDesc+'"/>                                                                         ');
html.push('			</div>                                                                                                                                                ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>   ');

html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield" class="ban_infobox_label">订单状态</label>                                                                                         ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('			<div class="ban_infobox_input_w">                                                                                                                     ');
html.push('				<input type="text" name="service-status"                                                                                                            ');
html.push('					class="ban_infobox_input _length" min="1" max="30"  placeholder="" value="'+statusDesc+'"/>                                                                         ');
html.push('			</div>                                                                                                                                                ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
                                                                                                                                                             
html.push('	<div class="ban_infobox_bottom">');
html.push('		<input name="" type="button" class=" ban_button_check" value="返回"  ');
html.push('			onclick="history.back()" /> ');
html.push('	</div>');                                                                                                                                                       
html.push('</div>                                                                                                                                                         ');
                                                                                                                                                                        
	$("#docContent").html(html.join(''));
}

</script>
</body>
</html>
