<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<body>
<%@include file="../inc/head-page.jsp" %>


<div class="ban_content ban_accountinfo">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">账户中心</a>
      &gt;<a href="#" class="ban_path_a">石玖账户信息</a>&gt;<a href="#" class="ban_path_a">修改密码</a></div>
    </div>
  </div>
  <div class="ban_wrapper">
    <div class="ban_account"> 
      <%@include file="../account/account-left.jsp" %>
      <div class="ban_account_content">
        <div class="ban_account_content_w">
          <h2 class="ban_page_title">修改密码</h2>
          
          <form action="" id="editForm" name="editForm">
          <div class="ban_infobox_w">
          
          <div class="ban_page_accountinfo">
            
            
            
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">请输入原密码</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_input_w">
                  <input type="password" onselectstart="return false;" onpaste="return false;" name="old-pwd" id="old-pwd" class="ban_infobox_input validate[required]" placeholder="" />
                </div>
              </div>
              <div class="ban_infobox_u"></div>
            </div>
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">请输入新密码</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_input_w">
                  <input type="password" onselectstart="return false;" onpaste="return false;" name="new-pwd" id="new-pwd" class="ban_infobox_input validate[required,custom[password]]" placeholder="" />
                </div>
              </div>
              <div class="ban_infobox_u"></div>
            </div>
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">请确认新密码</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_input_w">
                  <input type="password" onselectstart="return false;" onpaste="return false;" name="newPwd2" id="newPwd2" class="ban_infobox_input validate[required,custom[password]]" placeholder="" />
                </div>
              </div>
              <div class="ban_infobox_u"></div>
            </div>
          
          </div>
		  <div class="ban_infobox_bottom">
            <input name="" type="button" id="updatePwdBtn" class=" ban_button_hilite" value="确认修改"  />
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
'use stricts';
$(function(){
	
	$('#updatePwdBtn').on('click',updateForm);
});

var accUpdatePwdInfo = {};
Sys.service.on('AccUpdatePwd',function(data){
	if(data){
		Sys.infoDlg('修改成功！',null,function(){window.top.location.assign(Sys.evalUrl('/account/edit-account-info.html'));});
	}
},false);

////////////////////////////////////////
//All private functions
////////////////////////////////////////

/**
 * 点击[修改密码]按钮
 */
function updateForm(){
	var form = $("#editForm");
	if(form.validationEngine('validate')){
		if($.trim($("#new-pwd").val()) != $.trim($("#newPwd2").val())){
			Sys.errorDlg('确认密码不一致，请修改！');
			return;
		}
		
		var params = form.serializeObject();
		$.extend(accUpdatePwdInfo,params);
		Sys.service.load('AccUpdatePwd',{},true);
	}
}

</script>
</body>
</html>