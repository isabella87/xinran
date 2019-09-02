<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<!--[if lt IE 10]>
<div class="ban_info_cue ban_page_info"><div class="ban_wrapper">推荐使用IE10及以上版本或Chrome、Firefox等高级浏览器。360等多核心浏览器请切换到极速模式。IE7及以下版本无法正常浏览本站，请立即升级。</div></div>
<![endif]-->
<div class="scrollify" data-div-name="menu"></div>
<div class="ban_top">
	<div class="ban_wrapper">

		<div class="ban_tel">客服热线：<span class="ban_tel_num">021 5107 3698</span></div>
	    <%-- <div class="ban_follow">
	    	<a href="http://blog.sina.com.cn/banbankblog" target="_blank" title="关注石玖博客" class="ban_follow_a">
	    		<a:img cssClass="ban_follow_img" src="ban_sblog.png" title="关注石玖博客" /></a>

	    	<a href="http://weibo.com/banhuit" target="_blank" title="关注石玖微博" class="ban_follow_a">
	    		<a:img cssClass="ban_follow_img" src="ban_sina.png" title="关注石玖微博" /></a>

	    	<div class="ban_follow_a" style=" width:auto">
		    	<a:img cssClass="ban_follow_img" src="ban_wx.png" title="关注石玖微信" />
		    	<span style="padding-right: 8px; position: relative; top: -10px;">扫码关注官方微信</span>
		        <ul class="ban_follow_info">
		          <li class="ban_follow_info_li">
		            <h3 class="ban_follow_info_t">服务号</h3>
		            <a:img cssClass="ban_follow_info_img" src="weixin1.png" /></li>
		          <li class="ban_follow_info_li">
		            <h3 class="ban_follow_info_t">订阅号</h3>
		            <a:img cssClass="ban_follow_info_img" src="weixin2.png" /></li>
		        </ul>
	      </div>
	      <div class="ban_follow_a"  style=" width:auto">
	      <a href="/portal2/download.html" target="_blank" title="下载石玖手机客户端"  style=" text-decoration: none"><a:img src="ban_app.png"  cssClass="ban_follow_img" /><span style="padding-right: 8px; position: relative; top: -10px; color: #fbd609;">下载手机APP</span></a>
            <ul class="ban_follow_info">
             <!--<li class="ban_follow_info_li">
                <h3 class="ban_follow_info_t" style="font-size: 16px">IOS版</h3>
                <img id="iosAppImgh" src="" class="ban_follow_info_img"/> 
              </li>
               --> 
              <li class="ban_follow_info_li">
                <h3 class="ban_follow_info_t" style="font-size: 16px">安卓版</h3>
                <a:img src="ban_app_img.png" cssClass="ban_follow_info_img"/>
              </li>
            </ul>
          </div>
	    </div> --%>

		<!-- <div class="ban_top_login"><a href="#" class="ban_top_login_a">登录</a></div>
	    <div class="ban_top_reg"><a href="#" class="ban_top_reg_a">注册</a></div>
	    <div class="ban_top_help"><a href="#" class="ban_top_help_a">帮助</a></div>-->

		<div class="ban_top_login" id="div_logout">  </div>
		<div class="ban_top_help"><a id="a_help" href="#" class="ban_top_help_a">帮助</a>  </div>
		<div class="ban_top_reg" id="div_reg">   </div>
		<a id="topMsgA" style="display:none" href="<%=rootPath %>/message/message-list.html" class="ban_top_newsicon"></a>
		<div class="ban_top_id"   id="div_login">   </div>

	</div>
</div>
<div class="ban_head">
	<div class="ban_wrapper ban_headbg">
		<div class="ban_title" title="石玖">
			<a href="/xinran/index.html" class="ban_logo" title="上海石玖"><a:img cssClass="ban_logo_img" src="ban_logo3.png" title="上海石玖Logo" /></a>
		</div>
		<div class="ban_slogan">
			<span class="ban_slogan_stress">上海石玖信息科技有限公司</span>
		</div>
		<div class="ban_nav">
			<div class="ban_nav_switch"></div>
			<ul class="ban_nav_ul">
				<li class="ban_nav_li"><a id="a_portal" href="javascript:void(0);" class="ban_nav_a">首页</a></li>
				<li class="ban_nav_li"><a id="a_maintanin_workers" href="javascript:void(0);" class="ban_nav_a">点兵点将</a></li>
				<li class="ban_nav_li"><a id="a_maintain" href="javascript:void(0);" class="ban_nav_a">维修资讯</a></li>
				<li class="ban_nav_li"><a id="a_product" href="javascript:void(0);" class="ban_nav_a">商品展示</a></li>
				<li class="ban_nav_li"><a id="a_service" href="javascript:void(0);" class="ban_nav_a">订购服务</a></li>
				<%--
				<li class="ban_nav_li"><a id="a_common_fault" href="javascript:void(0);" class="ban_nav_a">常见故障</a></li>
				 <li class="ban_nav_li"><a id="a_maintenance" href="javascript:void(0);" class="ban_nav_a">维护保养</a></li>
				<li class="ban_nav_li"><a id="a_reference" href="javascript:void(0);" class="ban_nav_a">资料</a></li>
				 --%>
				<li class="ban_nav_li"><a id="a_realize_us" href="javascript:void(0);" class="ban_nav_a">了解我们</a></li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
    var g_currU = {}; // 加前缀 g_ 代表全局变量global
	Sys.service.on('Account', function(data, ctx) {
		if (data && data.valid) {
				g_currU = data;
				var lname = data.loginName;
				if (lname.length > 6) {
					//lname = lname.slice(0, 3) + '...' + lname.slice(-3);//获取登录名的前三个和后三个字符
					lname = lname.substring(0,3) + '...' + lname.substring(lname.length-3);
				}
				if (data.status < 0) {
					$('#div_login').html("<a href='javascript:;' class='ban_top_id_a'>" + data.loginName + "</a>");
					
					$('#div_reg').hide();
					
					$('#a_help').attr('href', Sys.evalUrl('/info/about21.html'));
					
					$('#div_logout').empty().html("<a href='javascript:logout();' class='ban_top_login_a'>安全退出</a>");
					
				} else if (data.status >= 0 && data.status !== 99) {  //0：机构注册成功   1：  待审核  2：已注册（审核通过） 3:已银行开户
					$('#div_login').html("<a href='" + Sys.evalUrl('/account/edit-account-info.html') + "' title='" + data.loginName + "' class='ban_top_id_a'>" + lname + "</a>");
				
					$('#div_reg').empty().html("<a href='"+Sys.evalUrl('/account/edit-account-info.html')+"' class='ban_top_reg_a'>账户中心</a>");
					
					$('#a_help').attr('href', Sys.evalUrl('/info/about21.html'));
					
					$('#div_logout').empty().html("<a href='javascript:logout();' class='ban_top_login_a'>安全退出</a>");
				}
	
				//  成功登录后隐藏页面中的部分内容
				$("._hide_while_login_").removeClass('scrollify').removeAttr('data-div-name').hide().remove();
	
				// 调用服务加载消息数据
				//Sys.service.load('PushInfo', ctx);
			
		} else {
			$('#div_login').empty().html("<a href='" + Sys.evalUrl('/login.html') + "' class='ban_top_login_a'>登录</a>");
			
			$('#div_reg').empty().html("<a href='" + Sys.evalUrl('/regist-user.html') + "' class='ban_top_reg_a'>注册</a>");
			
			$('#a_help').attr('href', Sys.evalUrl('/info/about21.html'));
			
			$('#div_logout').hide();
		}
	});

	Sys.service.on('PushInfo', function(data, ctx) {
		if (data && data.count > 0) {
			$('#topMsgA').addClass('ban_top_newsicon_read')
				.html('<img src="' + Sys.evalImageUrl('/ban_news_noread.png') + '" width="22px" height="20px" />' +
					'<p class="ban_account_msg"><span class="ban_account_msg_t"></span></p>').show();
		} else {
			$('#topMsgA').html('<img src="' + Sys.evalImageUrl('/ban_news_read.png') + '" width="22px" height="20px" />').show();
		}
	}, false);

	Sys.service.on('SignOut', function(data, ctx) {
		window.location.assign(Sys.evalUrl('/login.html'));
	}, false);

	$(document).ready(function() {
		//$('#iosAppImgh').attr('src',Sys.config.xrSrvUrl+'/app/ios-app-rcode-pic'); // 调用服务加载IOS版二维码图片
		
		// 头菜单动态选中样式
		var mType = Sys.getMtByPname(window.self.location.href);
		$("#" + mType).attr("class", "ban_nav_a_current");

		// 头菜单切换的链接js动态生成
		$('#a_portal').attr('href',Sys.evalUrl('/index.html'));
		
		$('#a_maintain').attr('href',Sys.evalUrl('/maintain/info-list.html'));
		$('#a_common_fault').attr('href',Sys.evalUrl('/maintain/info-list.html?type=2'));
		$('#a_maintenance').attr('href',Sys.evalUrl('/maintain/info-list.html?type=3'));
		$('#a_reference').attr('href',Sys.evalUrl('/maintain/info-list.html?type=4'));
		
		$('#a_maintanin_workers').attr('href',Sys.evalUrl('/worker/soldier-list.html'));
		
		$('#a_product').attr('href',Sys.evalUrl('/product/product-list.html'));
		
		$('#a_service').attr('href', Sys.evalUrl("/service/apply-service.html"));
		
		$('#a_realize_us').attr('href',Sys.evalUrl('/info/about15.html'));
	});

	$(function(){
		 if(typeof PageTitle != "undefined"){
			document.title = PageTitle;
		 }
	});
	
    ////////////////////////////////////////
	// All private functions
	////////////////////////////////////////
	
	/**
	*安全退出按钮
	*/
	function logout() {
		Sys.service.load('SignOut');
	}

	/**
	*用户没有登录，跳转登录
	*/
	function toLogin(notGoBack){
	  Sys.errorDlg('您还没有登录，请先登录！',null,function(){
			window.self.location.assign(!notGoBack?Sys.evalUrl('login.html?_rUrl='+encodeURIComponent(window.self.location)):Sys.evalUrl('login.html'));
		});
	}

</script>

