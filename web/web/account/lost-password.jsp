<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<body>

<style type="text/css">
.ban_infobox_cue {
	display: none;
}

.ban_reg_verify {
	cursor: pointer;
}
</style>

<%@include file="../inc/head-page.jsp" %>

	<div class="ban_content">
		<div class="ban_wrapper">
			<h2 class="ban_page_title">
				找回密码
				<div class="ban_page_title_tool">
					
				</div>
			</h2>
			

			<div class="ban_content_in" id="resetDiv1">
				<form id="resetForm" name="resetForm" method="get" action="">
					<ul class="ban_pagetab">
						<li class="ban_pagetab_li_current">
							<div class="ban_pagetab_step">1</div>
							<h2 class="ban_pagetab_t">验证账号和密保</h2>
						</li>
						<li class="ban_pagetab_li">
							<div class="ban_pagetab_step">2</div>
							<h2 class="ban_pagetab_t">完成重置密码</h2>
						</li>
					</ul>
					<div class="ban_infobox_w">
					<div class="ban_page_loan1">
					<div class="ban_page_reg1">
						<div class="ban_infobox">
							<label for="textfield" class="ban_infobox_label">用户名或手机号码</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="text" name="login-name-or-mobile" id="login-name-or-mobile"
										class="ban_infobox_input" placeholder="注册账号或萌承绑定手机" />
								</div>
							</div>
							<div class="ban_infobox_u"></div>
							<div class="ban_infobox_cue" id="loginNameOrMobileErrorTips">
								<span class="ban_infobox_cue_warn">请输入正确的用户名或或手机号码</span>
							</div>
						</div>
						
						<div class="ban_infobox">
							<label for="textfield" class="ban_infobox_label">密保问题</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="text" name="pwd-question-answer" id="pwd-question-answer"
										class="ban_infobox_input _required " placeholder="你最喜欢谁" />
								</div>
							</div>
							<div class="ban_infobox_cue" style="display: none;">
								<span class="ban_infobox_cue_warn">此项为必填项</span>
							</div>
						</div>
						
						<div class="ban_infobox">
							<label for="textfield3" class="ban_infobox_label">验证码</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_intool">
									<img id="yzmImg" src="" class="ban_reg_verify" title="点击切换验证码" />
								</div>
								<div class="ban_infobox_input_w_s">
									<input type="text" name="captcha-code" id="captcha-code"
										class="ban_infobox_input _required _removeBlank" />
								</div>
							</div>
							<div class="ban_infobox_cue" style="display: none;"  id="captchaCodeErrorTips">
								<span class="ban_infobox_cue_warn">请输入正确的验证码</span>
							</div>
						</div>
						
						<div class="ban_infobox">
							<label for="textfield3" class="ban_infobox_label">密码</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="password" onselectstart="return false;" onpaste="return false;" name="pwd" id="password"
										class="ban_infobox_input _required _length _pwd" min="6" max="18" placeholder="6-18个字符" />
								</div>
							</div>
							<div class="ban_infobox_cue" style="display: none;">
								<span class="ban_infobox_cue_warn">此项为必填项</span>
							</div>
						</div>
						<div class="ban_infobox">
							<label for="textfield3" class="ban_infobox_label">确认密码</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="password" onselectstart="return false;" onpaste="return false;" name="passworda"
										class="ban_infobox_input _required _length _same _pwd" target="password" min="6" max="18" placeholder="6-18个字符" />
								</div>
							</div>
							<div class="ban_infobox_cue" style="display: none;">
								<span class="ban_infobox_cue_warn">此项为必填项</span>
							</div>
						</div>
						</div>
						</div>
					<div class="ban_infobox_bottom">
						<input name="" id="submitBtn" type="button" class="ban_button_hilite" value="重置密码" />
					</div>
					</div>
				</form>
			</div>

			<div class="ban_content_in" id="resetDiv2" style="display: none;">
				<ul class="ban_pagetab">
					<li class="ban_pagetab_li_pass">
						<div class="ban_pagetab_step">1</div>
						<h2 class="ban_pagetab_t">验证账号和密保</h2>
					</li>
					<li class="ban_pagetab_li_current">
						<div class="ban_pagetab_step">2</div>
						<h2 class="ban_pagetab_t">完成重置密码</h2>
					</li>
				</ul>
				<div class="ban_infobox_w">
				  <div class="ban_page_regok">
				  	<div class="ban_result_succeed">
		              <div class="ban_result_t">
		                <div class="ban_result_depict">萌承帐户密码重置成功。</div>
		              </div>
		            </div></div>
				 </div>
				 <div class="ban_infobox_bottom">
					<input id="loginButton" name="" type="button" class="ban_button_hilite"  value="登录" />
				 </div>
			</div>


		</div>
	</div>


<%@include file="../inc/foot-page.jsp"%>
	
<script type="text/javascript">
'use stricts';

var gCfg = {
		boxClass:'ban_infobox',
		eBoxClass:'ban_infobox_cue',
		errMsg: '<span class="ban_infobox_cue_warn">#[msg]</span>'
	};
	
var yzmURL = Sys.config.xrSrvUrl + '/reg/captcha-image';

$(function(){

	$("#submitBtn").on("click",submitForm);
	$("#yzmImg").on("click", changeYZM);
	
});

Sys.service.on('Account', function(data) {
	// 等待200ms再显示验证码, 否则IE浏览器上无法获取正确的cookie
	setTimeout("changeYZM()", 200);
});


var ResetPwdInfo = {};
Sys.service.on('ResetPwd',function(data){
	if (data) {
		gotoStep(2);
	}
},false);

////////////////////////////////////////
//All private functions
////////////////////////////////////////

/**
 * 点击重置密码按钮提交
 */
function submitForm() {
	var form = $('#resetForm');

	if (form.validateForm(gCfg)) {
		var login_name_or_mobile = $.trim($("#login-name-or-mobile").val());
		var pwd = $.trim($("#password").val());
		var pwd_question_answer = $.trim($("#pwd-question-answer").val());
		var captcha_code = $.trim($("#captcha-code").val());
	
		$.extend(ResetPwdInfo,{"login-name-or-mobile" : login_name_or_mobile,"pwd":pwd,"pwd-question-answer":pwd_question_answer,"captcha-code" : captcha_code});
		Sys.service.load('ResetPwd',{},true);
	}
}

/**
 * 使用新的验证码
 */
function changeYZM() {
	$("#yzmImg").attr('src', yzmURL + '?_t=' + new Date().getTime());
}

/**
 * 跳转到指定步骤
 * @param step 步骤序号(1-2)
 */
function gotoStep(step) {

	$("div[id^=resetDiv]").hide();
	$("#resetDiv" + step).show();
	$("#loginButton").on("click", loginButton);
}

function loginButton() {
	window.location.assign(Sys.evalUrl('/login.html'));
}

</script> 
</body>
</html>
