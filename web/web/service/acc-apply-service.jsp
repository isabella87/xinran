<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<body>
<%@include file="../inc/head-page.jsp" %>


<div class="ban_content ban_accountinfo">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">账户中心</a>&gt;<a href="#" class="ban_path_a">萌承账户信息</a></div>
    </div>
  </div>
  <div class="ban_wrapper">
    <div class="ban_account"> 
      <%@include file="../account/account-left.jsp" %>
      <div class="ban_account_content">
        <div class="ban_account_content_w">
          <h2 class="ban_page_title">服务申请
          
          <div class="ban_page_title_tool" id="scanOrgDiv" style="display: none;">
					<a:a href="show-org-info.html" cssClass="ban_button_check">查看机构信息</a:a>
				</div>
          </h2>
          
			<div class="ban_content_in">
				<form  name="serviceForm" method="put" action="" >
					<div class="ban_page_cue">您填写的信息越全，我们的评审反馈越快</div>
					<div class="ban_infobox_w">
							<div class="ban_infobox">
								<label for="textfield" class="ban_infobox_label">申请人姓名</label>
								<div class="ban_infobox_inputbox">
									<div class="ban_infobox_input_w">
										<input type="text" name="name" 
											class="ban_infobox_input _required _length" min="1" max="30"  placeholder="身份证姓名" />
									</div>
								</div>
								<div class="ban_infobox_u"></div>
								<div class="ban_infobox_cue">必填项</div>
							</div>
							<div class="ban_infobox">
								<label for="textfield1" class="ban_infobox_label">手机号</label>
								<div class="ban_infobox_inputbox">
									<div class="ban_infobox_input_w">
										<input type="text" name="mobile" 
											class="ban_infobox_input _required _phone" placeholder="请输入11位手机号" />
									</div>
								</div>
								<div class="ban_infobox_u"></div>
								<div class="ban_infobox_cue">必填项</div>
							</div>
							<div class="ban_infobox">
								<label for="textfield2" class="ban_infobox_label">身份证号</label>
								<div class="ban_infobox_inputbox">
									<div class="ban_infobox_input_w">
										<input type="text" name="id-card" 
											class="ban_infobox_input _required _idcard" placeholder="请输入身份证号" />
									</div>
								</div>
								<div class="ban_infobox_u"></div>
								<div class="ban_infobox_cue">必填项</div>
							</div>
							<div class="ban_infobox">
								<label for="textfield3" class="ban_infobox_label">联系地址</label>
								<div class="ban_infobox_inputbox">
									<div class="ban_infobox_input_w">
										<input type="text" name="address"
											class="ban_infobox_input _length" min="1" max="50" placeholder="" value="" />
									</div>
								</div>
								<div class="ban_infobox_u"></div>
								<div class="ban_infobox_cue" style="display: none;"></div>
							</div>
							<div class="ban_infobox">
								<label for="textfield3" class="ban_infobox_label">预约时间</label>
								<div class="ban_infobox_inputbox">
									<div class="ban_infobox_input_w">
							<input type="text" class="ban_infobox_input" name="due-time" placeholder="预约日期"  onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd'})"/>
									</div>
								</div>
								<div class="ban_infobox_u"></div>
								<div class="ban_infobox_cue" style="display: none;"></div>
							</div>
							<div class="ban_infobox">
								<label for="textfield" class="ban_infobox_label">服务名称</label>
								<div class="ban_infobox_inputbox">
									<div class="ban_infobox_input_w">
										<input type="text" name="service-name" 
											class="ban_infobox_input _length" min="1" max="30"  placeholder="" />
									</div>
								</div>
								<div class="ban_infobox_u"></div>
								<div class="ban_infobox_cue">必填项</div>
							</div>
							<div class="ban_infobox">
							<label for="textfield3" class="ban_infobox_label">服务类型</label>
							<div class="ban_infobox_inputbox">
								<select class="ban_infobox_select" name="service-type">
									<option selected="selected" value="">请选择</option>
						            <option value="台式机维修">台式机维修</option>
						            <option value="笔记本维修">笔记本维修</option>
						            <option value="空调维修">空调维修</option>
						            <option value="电视机维修">电视机维修</option>
						            <option value="其他电子类产品维修">其他电子类产品维修</option>
								</select>
							</div>
							<div class="ban_infobox_u"></div>
							<div class="ban_infobox_cue" style="display: none;"></div>
						</div>
							<div class="ban_infobox">
								<label for="textfield2" class="ban_infobox_label">服务描述</label>
								<div class="ban_infobox_inputbox">
									<div class="ban_infobox_input_w">
										<textarea name="content" cols="" rows="" class="ban_infobox_textarea _length" min="1" max="800"
											placeholder="400字以内"></textarea>
									</div>
								</div>
								<div class="ban_infobox_u"></div>
								<div class="ban_infobox_cue" style="display: none;"></div>
							</div>
						 
						<div class="ban_infobox_bottom">
							<input name="" type="button" class="ban_button_hilite nextBtn" value="提交申请" />
						</div>
					</div>
				</form>
			</div>

			
			
		    <div class="ban_content_in" style="display: none;">
		      <form  name="serviceForm1" method="post" action="">
		        <div class="ban_infobox_w">
			        <div class="ban_result_succeed">
			              <div class="ban_result_t"><div class="ban_result_depict">服务申请已提交!</div>
			              <p class="ban_result_additional">初审通过后，客服将将尽快与您联系！请保持电话畅通。</p>
			              </div>
			            </div>
		         
			          <div class="ban_infobox_bottom">
			            <input name="" type="button" class="ban_button_hilite" value="来来来，再来申请个！" onclick="window.location.href=Sys.evalUrl('/service/acc-apply-service.html')" />
			          </div>
		        </div>
		        </form>
		      </div>
		    
		</div>
        </div>
        
      </div>
    </div>
  </div>

<%@include file="../inc/foot-page.jsp" %>

<script type="text/javascript">

var PageTitle = "订购服务";
var fid = null;
var index ; 
var valCfg = {boxClass:'ban_infobox',eBoxClass:'ban_infobox_cue',errMsg:'<span class="ban_infobox_cue_warn">#[msg]</span>'};
$(function(){
	$('.nextBtn').on('click',submitService);
});

var ApplyServiceInfo = {};
Sys.service.on('ApplyService',function(data){
	if(data){
		if(!fid && !isNaN(data)) fid = data;
		goStep(1);
	}
},false);


////////////////////////////////////////
//All private functions
////////////////////////////////////////

function submitService(){
	
	var form = $(this).parents('form');
	var formName = form.attr('name');
	index = formName.substring("serviceForm".length);
	index = parseInt(index);
	
	if(form.validateForm(valCfg)){
		var url = form.attr('action');
		var params = form.serializeObject();
		if(fid){
			url = url.replace('FID',fid);
		}
		
		$.extend(ApplyServiceInfo, {m:form.attr('method'), u:url, p : params});
		Sys.service.load('ApplyService',{},true);
	}else{
		//$(window.document).scrollTop(300);
	}
}


/**
 * 跳转到指定步骤  params 步骤序号（1-4） 
 */
function goStep(s){

	s = s < 1 ? 1 : s > 1 ? 1 : s;
	
	var form = $('form[name="serviceForm'+s+'"]');
	var div = form.parents('.ban_content_in');
	div.siblings().hide();
	div.show();
	
	if(s === 1){
		$('.showInFirst').show();
		$('#ban_content_id').css({'padding-top':'150px'});
		
	}else{
		$('.showInFirst').hide();
		$('#ban_content_id').css({'padding-top':'0px'});
	}
	$('input',div).first().focus();
}


</script>
</body>
</html>