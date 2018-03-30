<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<body>
<%@include file="../inc/head-page.jsp" %>


<div class="ban_content ban_accountinfo">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">账户中心</a>
      &gt;<a href="#" class="ban_path_a">萌承账户信息</a>&gt;<a href="#" class="ban_path_a">补录推荐码</a></div>
    </div>
  </div>
  <div class="ban_wrapper">
    <div class="ban_account"> 
      <%@include file="../account/account-left.jsp" %>
      <div class="ban_account_content">
        <div class="ban_account_content_w">
          <h2 class="ban_page_title">补录推荐码</h2>
          
          <form action="" id="editForm" name="editForm">
          <div class="ban_infobox_w">
          
          <div class="ban_account_invite">
        
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label"  style="margin-left: 100px">输入推荐人手机号或推荐码</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_input_w_s">
                  <input type="text" onselectstart="return false;" onpaste="return false;" name="recommend-mobile" id="recommend-mobile" class="ban_infobox_input   _required  _recommendCode _removeBlank" placeholder="" />
                </div>
              </div>
              <div class="ban_infobox_cue" style="display: none; left:520px">
				<span class="ban_infobox_cue_warn">请输入推荐人手机号或推荐码</span>
			  </div>
            </div>
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label"  style="margin-left: 100px">确认推荐人手机号或推荐码</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_input_w_s">
                  <input type="text" onselectstart="return false;" onpaste="return false;" name="recommendMobile2" id="recommendMobile2" class="ban_infobox_input   _required  _recommendCode _removeBlank" placeholder="" />
                </div>
              </div>
              <div class="ban_infobox_cue" style="display: none; left:520px">
				<span class="ban_infobox_cue_warn">请输入推荐人手机号或推荐码</span>
			  </div>
            </div>
          
          </div>
			<div class="ban_infobox_bottom">
	            <input name="" type="button" id="updateRecMobileBtn" class=" ban_button_hilite" value="确认"  />
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
var gCfg = {boxClass : 'ban_infobox', eBoxClass : 'ban_infobox_cue', errMsg : '<span class="ban_infobox_cue_warn">#[msg]</span>'};
$(function(){
	
	$('#updateRecMobileBtn').on('click',updateForm);
});

var accUpdateRecMobileInfo = {};
Sys.service.on('AccUpdateRecommendMobile',function(data){
	if(data){
		Sys.infoDlg('补录推荐码成功！',null,function(){
			//window.location.reload();
			window.top.location.assign(Sys.evalUrl('/account/accountment.html'));
		});
	}
},false);

/**
 * 点击确认按钮 更新补录推荐码
 */
function updateForm(){
	var form = $("#editForm");
	if(form.validateForm(gCfg)){
		
		if($.trim($("#recommend-mobile").val()) !== $.trim($("#recommendMobile2").val())){
			Sys.errorDlg('两次输入的推荐人手机号或推荐码不一致，请修改！');
			return;
		}
		
		var params = form.serializeObject();
		$.extend(accUpdateRecMobileInfo,params);
		Sys.service.load('AccUpdateRecommendMobile',{},true);
	}
}

</script>
</body>
</html>