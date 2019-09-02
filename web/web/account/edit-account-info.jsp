<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<body>
<%@include file="../inc/head-page.jsp" %>


<div class="ban_content ban_accountinfo">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">账户中心</a>&gt;<a href="#" class="ban_path_a">石玖账户信息</a></div>
    </div>
  </div>
  <div class="ban_wrapper">
    <div class="ban_account"> 
      <%@include file="../account/account-left.jsp" %>
      <div class="ban_account_content">
        <div class="ban_account_content_w">
          <h2 class="ban_page_title">石玖账户信息
          
          <div class="ban_page_title_tool" id="scanOrgDiv" style="display: none;">
					<a:a href="show-org-info.html" cssClass="ban_button_check">查看机构信息</a:a>
				</div>
          </h2>
          
          <div class="ban_infobox_w" id="formDiv">
          
          
          </div>
        </div>
        
      </div>
    </div>
  </div>
</div>

<%@include file="../inc/foot-page.jsp" %>

<script type="text/javascript">

Sys.service.on('AccInfo',function(data){
	if(data){
		
		if(data.userType === 2){
			$("#scanOrgDiv").show();
		}
		
		var html = new Array();
		
		html.push('<form id="accountInfoForm" name="accountInfoForm" action="" >                                                           ');
		html.push('<div class="ban_page_accountinfo">                                                                                     ');
		html.push('                                                                                                                       ');
		html.push('  <div class="ban_infobox">                                                                                            ');
		html.push('    <label for="textfield" class="ban_infobox_label">登录账号</label>                                                      ');
		html.push('    <div class="ban_infobox_inputbox">                                                                                 ');
		html.push('      <div class="ban_infobox_show">                                                                                   ');
		html.push('        '+Sys.encode(data.loginName)+'                                                                                                          ');
		html.push('      </div>                                                                                                           ');
		html.push('    </div>                                                                                                             ');
		html.push('    <div class="ban_infobox_u"></div>                                                                                  ');
        html.push('    <div class="ban_infobox_tool"><a:a href="account-password.html" cssClass="ban_button_operate">修改密码</a:a></div>                       ');
		html.push('  </div>                                                                                                               ');
		html.push('                                                                                                                       ');
		html.push('  <div class="ban_infobox">                                                                                            ');
		html.push('    <label for="textfield" class="ban_infobox_label">真实姓名</label>                                                      ');
		html.push('    <div class="ban_infobox_inputbox">                                                                                 ');
		html.push('      <div class="ban_infobox_show">                                                                                   ');
		html.push('        		'+Sys.encode(data.realName)+'                                                                                                     ');
		html.push('      </div>                                                                                                           ');
		html.push('    </div>                                                                                                             ');
		html.push('    <div class="ban_infobox_u"></div>                                                                                  ');
		if(data.mmFileId="0"){
			html.push('    <div class="ban_infobox_tool"><a:a href="http://localhost/xinran-notify/upload.jsp" cssClass="ban_button_operate">上传天将图片</a:a></div>                       ');
		}
		html.push('  </div>                                                                                                               ');
	
		html.push('  <div class="ban_infobox">                                                                                            ');
		html.push('    <label for="textfield2" class="ban_infobox_label">绑定手机</label>                                                     ');
		html.push('    <div class="ban_infobox_inputbox">                                                                                 ');
		html.push('      <div class="ban_infobox_show">                                                                                   ');
		html.push('        '+Sys.encode($.trim(data.mobile?data.mobile.slice(0,3)+'****'+data.mobile.slice(-4) : data.mobile)));
		html.push('      </div>');
		html.push('    </div>                                                                                                             ');
		html.push('    <div class="ban_infobox_u"></div>                                                                                  ');
        html.push('    <div class="ban_infobox_tool"><a:a href="account-mobile.html" cssClass="ban_button_operate">修改手机</a:a></div>                       ');
		html.push('                                                                                                                       ');
		html.push('  </div>');
		
        html.push('  <div class="ban_infobox">');
		html.push('    <label for="textfield2" class="ban_infobox_label">职务</label>                                                       ');
		html.push('    <div class="ban_infobox_inputbox">                                                                                 ');
		html.push('      <div class="ban_infobox_input_w"> ');
		html.push('        <input type="text" name="position" id="position" value="'+Sys.encode(data.position)+'" class="ban_infobox_input" placeholder="" />                 ');
		html.push('        </div>                                                                                                           ');
		html.push('    </div>                                                                                                             ');
		html.push('    <div class="ban_infobox_u"></div>                                                                                  ');
		html.push('  </div>                                                                                                               ');
		html.push('                                                                                                                       ');
        html.push('  <div class="ban_infobox">                                                                                            ');
		html.push('    <label for="textfield2" class="ban_infobox_label">工作单位</label>                                                     ');
		html.push('    <div class="ban_infobox_inputbox">                                                                                 ');
		html.push('      <div class="ban_infobox_input_w">                                                                                ');
		html.push('        <input type="text" name="company" value="'+Sys.encode(data.company)+'" id="company" class="ban_infobox_input" placeholder="" />                 ');
		html.push('      </div>                                                                                                           ');
		html.push('    </div>                                                                                                             ');
		html.push('    <div class="ban_infobox_u"></div>                                                                                  ');
		html.push('  </div>                                                                                                               ');
		html.push('                                                                                                                       ');
        html.push('  <div class="ban_infobox">                                                                                            ');
		html.push('    <label for="textfield2" class="ban_infobox_label">单位类型</label>                                                     ');
		html.push('    <div class="ban_infobox_inputbox">                                                                                 ');
		html.push('      <div class="ban_infobox_input_w">                                                                                ');
		html.push('        <input type="text" name="company-type" value="'+Sys.encode(data.companyType)+'" id="company-type" class="ban_infobox_input" placeholder="" />                 ');
		html.push('      </div>                                                                                                           ');
		html.push('    </div>                                                                                                             ');
		html.push('    <div class="ban_infobox_u"></div>                                                                                  ');
		html.push('  </div>                                                                                                               ');
		html.push('                                                                                                                       ');
        html.push('  <div class="ban_infobox">                                                                                            ');
		html.push('    <label for="textfield2" class="ban_infobox_label">通讯地址</label>                                                     ');
		html.push('    <div class="ban_infobox_inputbox">                                                                                 ');
		html.push('      <div class="ban_infobox_input_w">                                                                                ');
		html.push('        <input type="text" name="address" id="address" value="'+Sys.encode(data.address)+'" class="ban_infobox_input" placeholder="" />');
		html.push('      </div>                                                                                                           ');
		html.push('    </div>                                                                                                             ');
		html.push('    <div class="ban_infobox_u"></div>                                                                                  ');
		html.push('  </div>                                                                                                               ');
		html.push('                                                                                                                       ');
        html.push('  <div class="ban_infobox">                                                                                            ');
		html.push('    <label for="textfield2" class="ban_infobox_label">邮政编码</label>                                                     ');
		html.push('    <div class="ban_infobox_inputbox">                                                                                 ');
		html.push('      <div class="ban_infobox_input_w">                                                                                ');
		html.push('        <input type="text" name="postal-code" id="postal-code" value="'+Sys.encode(data.postalCode)+'" class="ban_infobox_input validate[custom[integer],minSize[6]]" placeholder="" />                 ');
		html.push('      </div>                                                                                                           ');
		html.push('    </div>                                                                                                             ');
		html.push('    <div class="ban_infobox_u"></div>                                                                                  ');
		html.push('  </div>                                                                                                               ');
		html.push('                                                                                                                       ');
		html.push('  <div class="ban_infobox">                                                                                            ');
		html.push('    <label for="textfield2" class="ban_infobox_label">电话</label>                                                       ');
		html.push('    <div class="ban_infobox_inputbox">                                                                                 ');
		html.push('      <div class="ban_infobox_input_w">                                                                                ');
		html.push('        <input type="text" name="home-phone" value="'+Sys.encode(data.homePhone)+'" id="home-phone" class="ban_infobox_input " placeholder="" />                 ');
		html.push('      </div>                                                                                                           ');
		html.push('    </div>                                                                                                             ');
		html.push('    <div class="ban_infobox_u"></div>                                                                                  ');
		html.push('  </div>                                                                                                               ');
		html.push('                                                                                                                       ');
		html.push('  <div class="ban_infobox">                                                                                            ');
		html.push('    <label for="textfield2" class="ban_infobox_label">QQ</label>                                                       ');
		html.push('    <div class="ban_infobox_inputbox">                                                                                 ');
		html.push('      <div class="ban_infobox_input_w">                                                                                ');
		html.push('        <input type="text" name="qq-number" id="qq-number" value="'+Sys.encode(data.qqNumber)+'"  class="ban_infobox_input " placeholder="" />                 ');
		html.push('      </div>                                                                                                           ');
		html.push('    </div>                                                                                                             ');
		html.push('    <div class="ban_infobox_u"></div>                                                                                  ');
		html.push('  </div>                                                                                                               ');
		html.push('                                                                                                                       ');
		html.push('                                                                                                                       ');
		html.push('</div>                                                                                                                 ');
		html.push('	<div class="ban_infobox_bottom">                                                                                 ');
		html.push('  <input name="" id="saveBtn" type="button" class=" ban_button_hilite" value="保存"  />  ');
		html.push('</div>                                                                                                                ');
		html.push('</form>                                                                                                               ');
		$("#formDiv").html(html.join(''));
		
		$('#saveBtn').on('click',saveForm);
	}  
});

var accUpdateAccInfoParam = {};
Sys.service.on('AccUpdateAccInfo',function(data){
	if(data){
		Sys.infoDlg('更新成功！',null,function(){
			window.location.reload();
		});
	}
},false); 

////////////////////////////////////////
//All private functions
////////////////////////////////////////

/**
 * 点击保存按钮提交
 */
function saveForm(){
	
	var form = $("#accountInfoForm");
	if(form.validationEngine('validate')){
		var p = form.serializeObject();
		$.extend(accUpdateAccInfoParam,p);
		Sys.service.load('AccUpdateAccInfo');
	}
}



</script>
</body>
</html>