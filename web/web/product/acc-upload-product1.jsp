<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<body>
<%@include file="../inc/head-page.jsp" %>


<div class="ban_content ban_accountinfo">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">账户中心</a>&gt;<a href="#" class="ban_path_a">班汇通账户信息</a></div>
    </div>
  </div>
  <div class="ban_wrapper">
    <div class="ban_account"> 
      <%@include file="../account/account-left.jsp" %>
      <div class="ban_account_content">
        <div class="ban_account_content_w">
          <h2 class="ban_page_title">上传产品信息
          
	          <div class="ban_page_title_tool" id="scanOrgDiv" style="display: none;">
						<a:a href="show-org-info.html" cssClass="ban_button_check">查看机构信息</a:a>
			  </div>
          </h2>
          
			<div class="ban_content_in">
				
					<form  name="productForm" method="put" action="" >
					<div class="ban_page_cue">您填写的信息越全，我们的评审反馈越快</div>
					<div class="ban_infobox_w">
						<div class="ban_infobox">
							<label for="textfield" class="ban_infobox_label">上传图片</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input  name="upfile" id="filepath" type="file"  class="file" />
								</div>
							</div>
							<div class="ban_infobox_u"></div>
							<div class="ban_infobox_cue">必填项</div>
						</div>
					
						<div class="ban_infobox">
							<label for="textfield1" class="ban_infobox_label">产品名称</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="text" name="pro-name" 
										class="ban_infobox_input _required _length" min="1" max="30"  placeholder="必填" />
								</div>
							</div>
							<div class="ban_infobox_u"></div>
							<div class="ban_infobox_cue">必填项</div>
						</div>
						<div class="ban_infobox">
							<label for="textfield2" class="ban_infobox_label">价格</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="text" name="price" 
										class="ban_infobox_input _int  _length" min="0"  max="8" placeholder="必填" value="" />
								</div>
							</div>
							<div class="ban_infobox_u"></div>
							<div class="ban_infobox_cue">必填项</div>
						</div>
						<div class="ban_infobox">
							<label for="textfield3" class="ban_infobox_label">商品类型</label>
							<div class="ban_infobox_inputbox">
								<select class="ban_infobox_select" name="product-type">
									<option selected="selected" value="">请选择</option>
						            <option value="显示器">显示器</option>
						            <option value="鼠标">鼠标</option>
						            <option value="键盘">键盘</option>
								</select>
							</div>
							<div class="ban_infobox_u"></div>
							<div class="ban_infobox_cue">必填项</div>
						</div>
					
						<div class="ban_infobox_bottom">
							<input name="" type="button" class="ban_button_hilite nextBtn" value="上传产品信息" />
						</div>
					</div>
				</form>
			</div>

			
			
		    <div class="ban_content_in" style="display: none;">
		      <form  name="productForm1" method="post" action="">
		        <div class="ban_infobox_w">
			        <div class="ban_result_succeed">
			              <div class="ban_result_t"><div class="ban_result_depict">产品已上传!</div>
			              <p class="ban_result_additional">初审通过后，客服将将尽快安排上线！</p>
			              </div>
			            </div>
		         
			          <div class="ban_infobox_bottom">
			            <input name="" type="button" class="ban_button_hilite" value="很好，再来传一个！" onclick="window.location.href=Sys.evalUrl('/product/acc-upload-product.html')" />
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

var PageTitle = "发布产品";
var fid = null;
var index ; 
var valCfg = {boxClass:'ban_infobox',eBoxClass:'ban_infobox_cue',errMsg:'<span class="ban_infobox_cue_warn">#[msg]</span>'};
$(function(){
	$('.nextBtn').on('click',submitService);
});

var uploadProductInfo = {};
Sys.service.on('UploadProductService',function(data){
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
	index = formName.substring("productForm".length);
	index = parseInt(index);
	
	if(form.validateForm(valCfg)){
		var url = form.attr('action');
		var params = form.serializeObject();
		if(fid){
			url = url.replace('FID',fid);
		}
		
		$.extend(uploadProductInfo, {m:form.attr('method'), u:url, p : params});
		Sys.service.load('UploadProductService',{},true);
	}else{
		//$(window.document).scrollTop(300);
	}
}

/**
 * 跳转到指定步骤  params 步骤序号（1-4） 
 */
function goStep(s){

	s = s < 1 ? 1 : s > 1 ? 1 : s;
	
	var form = $('form[name="productForm'+s+'"]');
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