<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>
<body>
<%@include file="../inc/head-page.jsp" %>

<div class="ban_content ban_accountinfo">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">账户中心</a>
      &gt;<a href="#" class="ban_path_a">石玖账户信息</a>&gt;<a href="#" class="ban_path_a">修改手机</a></div>
    </div>
  </div>
  <div class="ban_wrapper">
    <div class="ban_account"> 
      <%@include file="../account/account-left.jsp" %>
      <div class="ban_account_content">
        <div class="ban_account_content_w">
          <h2 class="ban_page_title">修改手机</h2>
          
          <form action="" id="editForm" name="editForm">
          <div class="ban_infobox_w">
          
          <div class="ban_page_accountinfo">
            
            
            
            <div class="ban_infobox">
              <label for="textfield" class="ban_infobox_label">原绑定手机号</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_show" id="oldMobile">
                  
                </div>
              </div>
            </div>
            
          <!--  
          <div class="ban_infobox">
            <label for="textfield2" class="ban_infobox_label">原手机验证码</label>
            <div class="ban_infobox_inputbox">
              <div class="ban_infobox_intool"><a href="javascript:;" id="sendOldVcodeBtn" class="ban_infobox_inbutton">获取验证码</a></div>
              <div class="ban_infobox_input_w_s">
                <input type="text" name="old-mobile-code" id="old-mobile-code" class="ban_infobox_input validate[required]" />
              </div>
            </div>
            <div class="ban_infobox_cue">短信验证码仅能使用一次</div>
          </div>
           -->  
            
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">新手机号</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_input_w">
                  <input type="text" name="new-mobile" id="new-mobile" class="ban_infobox_input validate[required,custom[phone],minSize[11],maxSize[11]]" placeholder="" />
                </div>
              </div>
              <div class="ban_infobox_u"></div>
            </div>
            
         <%--  <div class="ban_infobox">
            <label for="textfield2" class="ban_infobox_label">新手机验证码</label>
            <div class="ban_infobox_inputbox">
              <div class="ban_infobox_intool"><a href="javascript:;" id="sendNewVcodeBtn" class="ban_infobox_inbutton">获取验证码</a></div>
              <div class="ban_infobox_input_w_s">
                <input type="text" name="new-mobile-code" id="new-mobile-code" class="ban_infobox_input validate[required]" />
              </div>
            </div>
            <div class="ban_infobox_cue">短信验证码仅能使用一次</div>
          </div> --%>
             
            
            
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">石玖登录密码</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_input_w">
                  <input type="password" onselectstart="return false;" onpaste="return false;" name="pwd" id="pwd" class="ban_infobox_input validate[required]" placeholder="" />
                </div>
              </div>
              <div class="ban_infobox_u"></div>
            </div>
          
          </div>
<div class="ban_infobox_bottom">
            <input name="" type="button" id="submitBtn" class=" ban_button_hilite" value="确认修改"  />
            <input name="" type="button" class=" ban_button_check" value="返回" onclick="history.back()"  />
          </div>
          </div>
          </form>
          
        </div>
        
      </div>
    </div>
  </div>
</div>

<%@include file="../inc/foot-page.jsp" %>

<script type="text/javascript">

$(function(){
	
	$("#sendNewVcodeBtn").on('click',sendNewVcode);
	
	$("#submitBtn").on('click',submitForm);
	
});

Sys.service.on('Account',function(data){
	if(!data.valid){
		//toLogin();
	}else{
		$("#oldMobile").html(data.showMobile);
	}
});

var accSendNewVcodeInfo = {};
Sys.service.on('AccSendNewVcode',function(d){
	if(d){
		Sys.infoDlg('验证码已发送到新手机，请注意查收！');
		Sys.vCodeCountDown($('#sendNewVcodeBtn'));
	}
},false);

var accUpdateMobileInfo = {};
Sys.service.on('AccUpdateMobile',function(data){
	if(data){
		Sys.infoDlg('修改成功！',null,function(){window.top.location.assign(Sys.evalUrl('/account/edit-account-info.html'));});
	}
},false);

////////////////////////////////////////
//All private functions
////////////////////////////////////////

/**
 * 调用后台服务发送新手机验证码
 */
function sendNewVcode(){
	
	if($('#sendNewVcodeBtn').hasClass('ban_infobox_default')){
		return;
	}
	
	if($("#new-mobile").validationEngine("validate")){
		$.extend(accSendNewVcodeInfo,{"new-mobile":$.trim($("#new-mobile").val())})
		Sys.service.load('AccSendNewVcode',{},true);
	}
}

/**
 * 点击修改手机按钮提交
 */
function submitForm(){
	
	if($("#editForm").validationEngine("validate")){
		var params = $("#editForm").serializeObject();
		$.extend(accUpdateMobileInfo,params);
		Sys.service.load('AccUpdateMobile',{},true);
	}
}

</script>
</body>
</html>