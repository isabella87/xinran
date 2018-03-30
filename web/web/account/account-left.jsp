<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<div class="ban_account_sidebar">
	<div class="ban_as_user">
	    <div class="ban_as_username" id="userInfoDiv"> </div>
	    <div class="ban_as_userstate">
	      <ul class="ban_as_userstate_ul" id="userInfoUl">
	        <li class="ban_as_userstate_li" title="身份证未认证">
	        	<a:img cssClass="ban_as_userstate_icon" src="ban_as_userstate1.png" />
	        </li>
			<li class="ban_as_userstate_li" title="手机已绑定">
				<a:img cssClass="ban_as_userstate_icon" src="ban_as_userstate2.png"/>
			</li>
			<li class="ban_as_userstate_li ban_as_userstate_none">
			   <a href="javascript:void(0);"><a:img cssClass="ban_as_userstate_icon" src="ban_as_userstate3.png" /></a>
			   <div class="ban_as_userstate_explain">该功能暂未开放!</div>
			</li>
		
	      </ul>
	    </div>
	  </div>
     <ul class="ban_account_sidebar_ul">
     <li class="bg_manage_li">
         <h2 class="ban_account_sidebar_t">后台管理</h2>
         <ul class="ban_account_sidebar_ul2">
           <!-- <li class="ban_account_sidebar_li2"><a id="a_bg_upload_product" href="javascript:void(0);" class="ban_account_sidebar_a">上传产品</a></li>    -->
           <li class="ban_account_sidebar_li2"><a id="a_bg_product_list" href="javascript:void(0);" class="ban_account_sidebar_a">产品列表</a></li>
           <li class="ban_account_sidebar_li2"><a id="a_bg_history_service" href="javascript:void(0);" class="ban_account_sidebar_a">服务列表</a></li>
           <li class="ban_account_sidebar_li2"><a id="a_bg_history_order"  class="ban_account_sidebar_a">订单列表</a></li>
           <li class="ban_account_sidebar_li2"><a id="a_bg_create_notice"  class="ban_account_sidebar_a">创建信息</a></li>
           <li class="ban_account_sidebar_li2"><a id="a_bg_notice_list"  class="ban_account_sidebar_a">信息列表</a></li>
           <li class="ban_account_sidebar_li2"><a id="a_bg_worker_list"  class="ban_account_sidebar_a">将士列表</a></li>
         </ul>
      </li>
     <li class="ban_account_sidebar_li">
         <h2 class="ban_account_sidebar_t">我的账户</h2>
         <ul class="ban_account_sidebar_ul2">
         <!-- <li class="ban_account_sidebar_li2"><a id="a_accountment"  class="ban_account_sidebar_a">资产概况</a></li>   -->
           <li class="ban_account_sidebar_li2"><a id="a_account_info" href="javascript:void(0);" class="ban_account_sidebar_a">萌承账户信息</a></li>
           <!--<li class="ban_account_sidebar_li2"><a id="a_jxpay_account_info" href="javascript:void(0);" class="ban_account_sidebar_a">银行存管账户管理</a></li>   -->
           <li class="ban_account_sidebar_li2 makeupRecMobile"><a id="a_makeup_rec_mobile" href="javascript:void(0);" class="ban_account_sidebar_a">补录推荐码</a></li>
         </ul>
       </li>
       <li class="my_service_li">
         <h2 class="ban_account_sidebar_t">我的服务</h2>
         <ul class="ban_account_sidebar_ul2">
           <li class="ban_account_sidebar_li2"><a id="a_apply_service" href="javascript:void(0);" class="ban_account_sidebar_a">申请服务</a></li>
           <li class="ban_account_sidebar_li2"><a id="a_history_service" href="javascript:void(0);" class="ban_account_sidebar_a">历史服务</a></li>
           <li class="ban_account_sidebar_li2"><a id="a_pay_service" href="javascript:void(0);" class="ban_account_sidebar_a">支付服务</a></li>
         </ul>
       </li>
       <li class="my_order_li">
         <h2 class="ban_account_sidebar_t">订单管理</h2>
         <ul class="ban_account_sidebar_ul2">
           <li class="ban_account_sidebar_li2"><a id="a_history_order"  class="ban_account_sidebar_a">历史订单</a></li>
           <li class="ban_account_sidebar_li2"><a id="a_pay_order" class="ban_account_sidebar_a">支付订单</a></li>
         </ul>
       </li>
     </ul>
</div>

<script type="text/javascript">
	'use stricts';
	var jxUserCnId = null;
	
	$(function(){
		//左侧菜单动态选中样式
		var mType = Sys.getMtByPname(window.self.location.href);
		$("#" + mType).attr("class", "ban_account_sidebar_a_current");
		//左侧菜单切换的链接js动态生成
		
		$('#a_bg_upload_product').attr('href',Sys.evalUrl('/product/acc-upload-product.html'));
		$('#a_bg_product_list').attr('href',Sys.evalUrl('/product/acc-product-list.html'));
		$('#a_bg_history_service').attr('href',Sys.evalUrl('/service/acc-service-list.html'));
		$("#a_bg_history_order").attr('href',Sys.evalUrl("/order/acc-order-list.html"));
		$("#a_bg_create_notice").attr('href',Sys.evalUrl("/info/acc-create-info.html"));
		$("#a_bg_notice_list").attr('href',Sys.evalUrl("/info/acc-info-list.html"));
		$("#a_bg_worker_list").attr('href',Sys.evalUrl("/worker/acc-soldier-list.html"));
		
		$('#a_accountment').attr('href',Sys.evalUrl('/account/accountment.html'));
		$('#a_account_info').attr('href',Sys.evalUrl('/account/edit-account-info.html'));
		$('#a_jxpay_account_info').attr('href',Sys.evalUrl('/account/jxpay-info.html'));
		$('#a_makeup_rec_mobile').attr('href',Sys.evalUrl('/account/makeup-recomm-mobile.html'));
		
		
		$('#a_apply_service').attr('href',Sys.evalUrl('/service/acc-apply-service.html'));
		$('#a_history_service').attr('href',Sys.evalUrl('/service/history-acc-service-list.html'));
		$('#a_pay_service').attr('href',Sys.evalUrl('/service/acc-paying-service-list.html'));
		
		$("#a_history_order").attr('href',Sys.evalUrl("/order/history-acc-order-list.html"));
		$("#a_pay_order").attr('href',Sys.evalUrl("/order/acc-paying-order-list.html"));
	});
	
	//加载头菜单按钮
	Sys.service.on('Account',function(data){
		if(data){
    		if(!data.valid){
		     	toLogin();
		    }else{
		    	if(data.bgPrivilege === 1){  // 允许上传产品  
		    		$('.bg_manage_li').show();
		    		$('.my_service_li').show();
		    		$('.my_order_li').show();
		    	}else{
		    		$('.bg_manage_li').hide();
		    		$('.my_service_li').show();
		    		$('.my_order_li').show();
		    	}
		    	
		    	if(data.recInfoModCount === 1){
		    		$('.makeupRecMobile').hide();
		    	}else{
		    		$('.makeupRecMobile').show();
		    	}
		    	
		    	loadLeftUserInfo(data);
        	}
 	 	}
	});
	
	////////////////////////////////////////
	// All private functions
	////////////////////////////////////////

	function loadLeftUserInfo(data) {

		var now = window.serverTime();
		var hour = now.getHours();
		var hourTitle = '';
		if (hour < 9) {
			hourTitle = "早上好！";
		} else if (hour < 12) {
			hourTitle = "上午好！";
		} else if (hour < 14) {
			hourTitle = "中午好！";
		} else if (hour < 18) {
			hourTitle = "下午好！";
		} else if (hour < 24) {
			hourTitle = "晚上好！";
		}

		$('#userInfoDiv').html('<span class="ban_as_usergreet">' + hourTitle + '</span> <span class="ban_as_username_text">'+ data.realName + '</span> ');
	}
</script>

