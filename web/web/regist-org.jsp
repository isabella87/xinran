<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="inc/common.jsp"%>



<body>
	<style type="text/css">
		.ban_reg_verify {
			cursor: pointer;
		}
	</style>
	<%@include file="inc/head-page.jsp"%>

	<div class="ban_content">
		<div class="ban_wrapper">
			<h2 class="ban_page_title">
				注册机构账户
				<div class="ban_page_title_tool">
					<a:a href="regist-user.html" cssClass="ban_button_operate">个人注册</a:a>
				</div>
			</h2>

			<div class="ban_content_in" >
				<form id="regForm1" name="regForm1" method="POST" action="/reg/validate-mobile-code">
					<ul class="ban_pagetab">
						<li class="ban_pagetab_li_current">
							<div class="ban_pagetab_step">1</div>
							<h2 class="ban_pagetab_t">验证手机</h2>
						</li>
						<li class="ban_pagetab_li">
							<div class="ban_pagetab_step">2</div>
							<h2 class="ban_pagetab_t">填写账户信息</h2>
						</li>
						<li class="ban_pagetab_li">
							<div class="ban_pagetab_step">3</div>
							<h2 class="ban_pagetab_t">完成注册</h2>
						</li>
					</ul>
					<div class="ban_infobox_w">
					<div class="ban_page_reg1">
						<div class="ban_infobox">
							<label for="textfield" class="ban_infobox_label">手机号码</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="text" name="mobile"
										class="ban_infobox_input _required _phone" placeholder="请输入11位手机号" />
								</div>
							</div>
							<div class="ban_infobox_cue" style="display: none;">
								<span class="ban_infobox_cue_warn">请输入正确的手机号</span>
							</div>
						</div>
						<div class="ban_infobox">
							<label for="textfield3" class="ban_infobox_label">验证码</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_intool">
									<img id="yzmImg" src="" class="ban_reg_verify" title="点击切换验证码" alt="点击获取验证码" />
								</div>
								<div class="ban_infobox_input_w_s">
									<input type="text" name="captcha-code"
										class="ban_infobox_input _required _removeBlank" />
								</div>
							</div>
							<div class="ban_infobox_cue" >
								<span class="ban_infobox_cue_warn">请输入验证码的计算结果</span>
							</div>
						</div>
						<div class="ban_infobox">
							<label for="textfield2" class="ban_infobox_label">激活码</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_intool">
									<a href="javascript:void(0)" id="sendMobileCodeBtn"
										class="ban_infobox_inbutton">获取激活码</a>
								</div>
								<div class="ban_infobox_input_w_s">
									<input type="text" name="mobile-code"
										class="ban_infobox_input _required" />
								</div>
							</div>
							<div class="ban_infobox_cue"
								style="display: inline;">短信激活码仅能使用一次,30分钟内有效。</div>
						</div>

						<div class="ban_infobox">
							<label for="textfield3" class="ban_infobox_label"></label>
							<div class="ban_infobox_inputbox">
								<input name="agree" type="checkbox"  value="" id="agree"
									class="ban_detailed_agree_checkbox _required" /> <label for="agree"
									class="ban_detailed_agree_text">我同意</label> <a target="_blank" href="./web/themes/default/agreement/invest-zhuce.pdf"
									class="ban_detailed_agree_a">《注册协议》</a>
							</div>
							<div class="ban_infobox_cue" style="display: none;">
								<span class="ban_infobox_cue_warn">此项为必填项</span>
							</div>
						</div>
					</div>
					<div class="ban_infobox_bottom">
						<input id="submitBtn1" name="" type="button"
							class="ban_button_hilite " value="下一步" />
					</div>
					</div>
				</form>
			</div>


			<div class="ban_content_in"  style="display: none;">
				<form id="regForm2" name="regForm2" method="put" action="/reg/register-corp">
					<ul class="ban_pagetab">
						<li class="ban_pagetab_li_pass">
							<div class="ban_pagetab_step">1</div>
							<h2 class="ban_pagetab_t">验证手机</h2>
						</li>
						<li class="ban_pagetab_li_current">
							<div class="ban_pagetab_step">2</div>
							<h2 class="ban_pagetab_t">填写账户信息</h2>
						</li>
						<li class="ban_pagetab_li">
							<div class="ban_pagetab_step">3</div>
							<h2 class="ban_pagetab_t">完成注册</h2>
						</li>
					</ul>
					<div class="ban_infobox_w">
					<div class="ban_page_reg2">
						<!-- <div class="ban_infobox">
							<label for="textfield" class="ban_infobox_label">真实姓名</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="text" name="real-name"
										class="ban_infobox_input _required _length _blank" min="0" max="20" placeholder="必须实名，后续将银行实名认证" />
								</div>
							</div>
							<div class="ban_infobox_cue" style="display: none;">
								<span class="ban_infobox_cue_warn">此项为必填项</span>
							</div>
						</div> -->

						<div class="ban_infobox">
							<label for="textfield3" class="ban_infobox_label">用户名</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="text" name="login-name"
										class="ban_infobox_input _required _length _blank _username" min="4" max="15" placeholder="4-15个字符，支持中文" />
								</div>
							</div>
							<div class="ban_infobox_cue" style="display: none;">
								<span class="ban_infobox_cue_warn">此项为必填项</span>
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
						<div class="ban_infobox">
							<label for="textfield3" class="ban_infobox_label">推荐人手机或推荐码</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="text" name="recommend-mobile"
										class="ban_infobox_input  _recommendCode _removeBlank" placeholder="非必填" />
								</div>
							</div>
							<div class="ban_infobox_cue" style="display: none;">
								<span class="ban_infobox_cue_warn">此项为必填项</span>
							</div>
						</div>

					</div>

					<div class="ban_infobox_bottom">
						<input id="submitBtn2" name=""  type="button"
							class="ban_button_hilite " value="下一步" />
					</div>
					</div>
				</form>
			</div>

			<div class="ban_content_in"  style="display: none;">
				<form name="regForm3" method="" action="">
				<ul class="ban_pagetab">
					<li class="ban_pagetab_li_pass">
						<div class="ban_pagetab_step">1</div>
						<h2 class="ban_pagetab_t">验证手机</h2>
					</li>
					<li class="ban_pagetab_li_pass">
						<div class="ban_pagetab_step">2</div>
						<h2 class="ban_pagetab_t">填写账户信息</h2>
					</li>
					<li class="ban_pagetab_li_pass">
						<div class="ban_pagetab_step">3</div>
						<h2 class="ban_pagetab_t">完成注册</h2>
					</li>
				</ul>
				<div class="ban_infobox_w">
					<div class="ban_page_regok">
			        	<div class="ban_result_succeed">
			            	<div class="ban_result_t"><div class="ban_result_depict">恭喜，您已成功注册班汇通帐号！</div>
				           <!--  <p class="ban_result_additional">接下来请您注册银行存管账户，以使用此账户进行资金流转、出借。<br /></p> -->
			            </div>
			          </div>
			        </div>
			        <div class="ban_infobox_bottom">
			            <input name="" type="button" id="lastPageBtn" class="ban_button_default" value="5秒后 进入您的账户中心" />
			        </div>
				</div>
				</form>
			</div>


		</div>
	</div>
	<%@include file="inc/foot-page.jsp"%>
<script type="text/javascript">
'use stricts';

var gCfg = {
	boxClass:'ban_infobox',
	eBoxClass:'ban_infobox_cue',
	errMsg: '<span class="ban_infobox_cue_warn">#[msg]</span>'
};
var yzmURL = Sys.config.xrSrvUrl + '/reg/captcha-image';
var regStep = 1;

$(function() {
	$('#submitBtn1').on('click', submitForm1);
	$('#submitBtn2').on('click', submitForm2);
	$('#yzmImg').on('click', changeYZM);
	$('#sendMobileCodeBtn').on('click', sendMobileCode);
});

Sys.service.on('Account', function(data) {
	// 等待200ms再显示验证码, 否则IE浏览器上无法获取正确的cookie
	setTimeout("changeYZM()", 200);
});

var regServiceInfo = {};
Sys.service.on('RegService', function(data){
	enableBtn();

	if (data) {
		gotoStep(++regStep);
	}
}, false);

var regSendPersonMobileCodeInfo = {};
Sys.service.on('RegSendUserMobileCode', function(data) {
	if (data) {
		var mobile = getMobile();
		var me = $('#sendMobileCodeBtn');
		me.parents('.' + gCfg.boxClass).find('.' + gCfg.eBoxClass)
			.html('手机激活码已发送到您的手机【' + Sys.formatMobile($.trim(mobile.val())) + '】上，请注意查收')
			.showInline();
		Sys.vCodeCountDown(me);  //手机激活码按钮倒计时效果
	}
}, false);

////////////////////////////////////////
// All private functions
////////////////////////////////////////

/**
 * 第一步页面中点击"下一步"按钮
 */
function submitForm1() {
	var form = $('#regForm1');

	if (!$('input[name=agree]').is(':checked')) {
		// TODO:点击下一步，若没有勾选<<注册协议>>，提示用户勾选
		Sys.errorDlg("请先阅读并勾选《注册协议》！");
		return;
	}

	if (form.validateForm(gCfg)) {
		var params = form.serializeObject();
		disableBtn();

		$.extend(regServiceInfo, {
			method : (form.attr('method') || 'get'),
			action : form.attr('action'),
			params : params,
		});
		Sys.service.load('RegService', {}, true);
	}
}

/**
 * 第二步页面中点击"下一步"按钮
 */
function submitForm2(){
	var form = $('#regForm2');

	if (form.validateForm(gCfg)) {
		var params = form.serializeObject();
		params['mobile'] = $.trim($('input[name="mobile"]').val());
		disableBtn();

		$.extend(regServiceInfo, {
			method : (form.attr('method') || 'get'),
			action : form.attr('action'),
			params : params,
		});
		Sys.service.load('RegService', {}, true);
	}
}

/**
 * 调用后台服务发送手机验证码
 */
function sendMobileCode() {
	if($('#sendMobileCodeBtn').hasClass('ban_infobox_default')){
		return;
	}

	var mobile = getMobile();
	var captchaCode = getCaptchaCode();
	if (mobile.validateForm(gCfg) && captchaCode.validateForm(gCfg)) {
		$.extend(regSendPersonMobileCodeInfo, {
			"mobile" : $.trim(mobile.val()),
			"captcha-code" : $.trim(captchaCode.val()),
		});
		Sys.service.load('RegSendUserMobileCode', {}, true);
	}
}

/**
 * 禁用下一步按钮
 */
function disableBtn() {
	$("#submitBtn1, #submitBtn2").addClass('ban_button_default').removeClass('ban_button_hilite').prop('disabled', true);
}

/**
 * 启用下一步按钮
 */
function enableBtn(){
	$("#submitBtn1, #submitBtn2").removeClass('ban_button_default').addClass('ban_button_hilite').prop('disabled', false);
}

/**
 * 使用新的验证码
 */
function changeYZM() {
	$("#yzmImg").attr('src', yzmURL + '?_t=' + new Date().getTime());
}

/**
 * 获取用户输入的手机号码
 */
function getMobile() {
	return $('form[name="regForm1"]').find('input[name="mobile"]');
}

/**
 * 获取用户输入的验证码
 */
function getCaptchaCode() {
	return $('form[name="regForm1"]').find('input[name="captcha-code"]');
}

/**
 * 跳转到指定步骤
 * @param step 步骤序号(1-3)
 */
function gotoStep(step) {
	step = step < 1 ? 1 : step > 3 ? 3 : step;
	var form = $('form[name="regForm' + step + '"]');
	var div = form.parents('.ban_content_in');
	div.siblings().hide();
	div.show();

	if (step === 3) {
		regCountDownEvt();
	}
}

/**
 * 注册银行存管帐户按钮倒计时
 */
function regCountDownEvt() {
	var waitSec = 4;

	var ci = setInterval(function() {
		if (waitSec <= 0) {
			$("#lastPageBtn").val('进入账户中心').attr('class','ban_button_hilite').on('click',
					function() {
						window.self.location.assign(Sys.evalUrl('/login.html'));
					});
			window.clearInterval(ci);
		} else {
			$("#lastPageBtn").val(waitSec + '秒后 进入账户中心');
		}
		waitSec--;
	}, 1000);
}
</script>
</body>
</html>
