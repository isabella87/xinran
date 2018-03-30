<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@ include file="inc/common.jsp" %>
<body>
<%@include file="inc/head-page.jsp" %>

<div class="ban_content">
  <div class="ban_wrapper">
    <h2 class="ban_page_title">用户登录
    </h2>

    <div class="ban_login_bg ban_login_add_yzm">
<div class="ban_login">
        <form id="loginForm" name="form1" method="post" action="">
          <div class="ban_login_info">欢迎您回来，我们已恭候多时！</div>
          <!--<div class="ban_login_info_warning">您输入的账号密码错误!&nbsp;&nbsp;&nbsp;&nbsp;:-(</div>-->
          <!--<div class="ban_login_info_warning">账号密码错误,3小时后再试。</div>-->
          <div class="ban_login_id">
            <label for="textfield" class="ban_login_id_l">用户名</label>
            <input type="text" name="login-name-or-mobile" id="login-name-or-mobile" placeholder="注册账号或萌承绑定手机" class="ban_login_id_in text validate[required]" />
          </div>
          <div class="ban_login_pw">
            <label for="textfield2" class="ban_login_pw_l">密码</label>
            <input type="password"  name="pwd" onselectstart="return false;" onpaste="return false;"  id="pwd"  class="ban_login_pw_in text validate[required]" />
            <input type="text" name="passwordText" onselectstart="return false;" onpaste="return false;" id="passwordText" class="ban_login_pw_in text validate[required]"  style="display: none;" />
          </div>
          <div class="ban_login_yzm" id="yzm-box" style="display: none;">
            <label for="captchaCode" class="ban_login_pw_l">验证码</label>
            <input type="text" name="captcha-code"  class="ban_login_yzm_in" /><div class="ban_login_yzm_img"><img  id="yzmImg" src="" /></div>
          </div>

          <input type="submit" name="button" id="button" value="登录" class="ban_login_b" />

          <div class="ban_login_bottom">
	          <div class="ban_login_tool"><span class="ban_login_tool_remember"><input name="remember" type="checkbox" value="" id="remember" class="ban_login_tool_checkbox" /><label for="remember" class="ban_login_tool_label">记住登录名</label></span><span class="ban_login_tool_plainpw"><input name="plainpw" type="checkbox" value="" id="plainpw" class="ban_login_tool_checkbox" /><label for="plainpw" class="ban_login_tool_label">显示明文密码</label></span>
	          </div>

	          <div class="ban_login_reg"><a:a href="account/lost-password.html" cssClass="ban_login_tool_forget">忘记密码</a:a><span class="ban_login_reg_t">还没有账号？</span><a:a href="regist-user.html" cssClass="ban_login_reg_b">立即注册</a:a></div>
        	</div>
        </form>
      </div>
      <div class="ban_login_ad"><img src="./web/themes/default/images/ban_login_img.jpg" /></div>
    </div>
  </div>
</div>

<%@include file="inc/foot-page.jsp" %>

<script type="text/javascript">
'use stricts';
var rUrl = Sys.getParam('_rUrl');

Sys.service.on('Account', function(data, ctx) {
    if (data.valid) {
        Sys.getRedirectUrl(data.userType, data.status, function(url) {
            Sys.toUrl(url ? Sys.evalUrl(url) : rUrl ? rUrl : Sys.evalUrl('/account/edit-account-info.html'));
        });
    }
});

var accSigninInfo = {};
Sys.service.on('AccSigin',function(data){
	if(!data.signResult.valid){
		Sys.errorDlg('登录失败！用户名或者密码错误！');
		return;
	}
	Sys.getRedirectUrl(data.userType,data.status,function(url){
        //Sys.toUrl(rUrl);的判断是用来当开始的时候进入到项目借款但是没登录，那登录后还要回到原来的借款项目页面;
        //若url为空则跳到账户概况页面，若不为空就按照Sys.getRedirectUrl里的判断跳转
		if(url === ''){
			if(rUrl && rUrl !== ''){
				Sys.toUrl(rUrl);
			}else{
				Sys.toUrl(Sys.evalUrl("/account/edit-account-info.html"));
			}
		}else{
			Sys.toUrl(Sys.evalUrl(url));
		}
	});
},false);

$(function(){
	if(Sys.getCookie("banbank.loginname") !== null && Sys.getCookie("banbank.loginname") !== ''){
		$("#login-name-or-mobile").val(Sys.getCookie("banbank.loginname"));
		$("#remember").prop('checked',true);
	}
	$("#loginForm").validationEngine("attach",{
		onValidationComplete:function(form, status){
			if(status){
				if($("#remember").is(":checked")){
					Sys.setCookie("banbank.loginname",$("#login-name-or-mobile").val(),30);
				}else{
					Sys.delCookie("banbank.loginname");
				}
				var reg = /\s+/g;
				var username = $.trim($("#login-name-or-mobile").val());
				var password = $("#plainpw").is(':checked')?$.trim($("#passwordText").val()):$.trim($("#pwd").val());
				if(reg.test(username)){
					Sys.errorDlg('用户名中不能含有空格！');
					return;
				}
				if(reg.test(password)){
					Sys.errorDlg('密码中不能含有空格！');
					return;
				}
				
				$.extend(accSigninInfo,{"login-name-or-mobile":username,"pwd":password});
				Sys.service.load('AccSigin',{},true);
			}
		}
	});

	$("#plainpw").on("change",changePwInputType);

	$("#passwordText").on('change',pwdTxtChange);

	$("#yzmImg").on("click", changeYZM);
});

////////////////////////////////////////
//All private functions
////////////////////////////////////////

/**
 * 使用新的验证码 
 */
function changeYZM() {
	$('#yzmImg').attr('src', Sys.config.xrSrvUrl + '/reg/captcha-image?_t=' + new Date().getTime());
}

/**
 * 明文密码框的处理；若录入汉字用空格代替
 */
function pwdTxtChange(){
	var val = $.trim($('#passwordText').val());
	$('#passwordText').val(val.replace(/[\u4E00-\u9FA5]+/g,''));
}

/**
 * 勾选显示明文密码后，切换密码的显示
 */
function changePwInputType() {
	if($('#plainpw').is(':checked')){
		$("#pwd").hide();
		$("#passwordText").show().val($("#pwd").val());
	}else{
		$("#passwordText").hide();
		$("#pwd").show().val($("#passwordText").val());
	}
}
</script>
</body>
</html>
