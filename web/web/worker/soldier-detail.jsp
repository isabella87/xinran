<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp"%>

<body>
	<%@include file="../inc/head-page.jsp"%>

<div class="ban_project">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a:a href="soldier-list.html" cssClass="ban_path_a">将士列表</a:a>&gt;<a href="javascript:;" id="_cursor" class="ban_path_a"></a></div>
    </div>
  </div>
  
  <div class="ban_wrapper">
  <div class="ban_page_loan1">
  <form name="orderForm" method="PUT" action="">
    <div class="ban_account_content_w" id="docContent">

	</div>
	</form>
  </div>
  </div>
</div>
 
<form id="tenderForm" action="" method="PUT"   target="_new">
	<input type="hidden" name="fee" />
	<input type="hidden" name="mp-id" />
</form>

<%@include file="../inc/foot-page.jsp"%>

<script type="text/javascript">

var g_prj ;
var mmId = Sys.getParam('mmid');

if(!mmId){
	Sys.errorDlg('参数错误！',null,function(){
		window.open("about:blank","_top").close();
	});
}

var WorkerDetailInfo = {mmId : mmId };
Sys.service.on('WorkerDetail',function(data){
	if (data) {
		g_prj = data;
		showWorkerDetails();
	}
});

/**
 * 调用服务取到数据后渲染html，将数据展示出来
 */
function showWorkerDetails(){
	
	var d = g_prj;

	/* var statusDesc = '未知状态';
	
	if(d.status==0){
		statusDesc = '未上架';
	}else if(d.status==1){
		statusDesc = '已上架';
	} */
	
	var html = new Array();
	html.push('<div class="ban_infobox_w">                                                                                                     ');
	
	html.push('<input type="hidden" name="fee" value="" /> ');
	html.push('<input type="hidden" name="mm-id" value='+ mmId + '/> ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield" class="ban_infobox_label">将士照片：</label>                                                              ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_input_w">                                                                                          ');
	//html.push('			<img style="display: block; margin: 0 auto;" src="/image/worker/'+d.mmId+'.png"></img>');
	html.push('			<img style="display: block; margin: 0 auto;" src="'+Sys.config.xrSrvUrl+'/files/'+d.fileId+'/single"></img>');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield1" class="ban_infobox_label">将士姓名：</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+Sys.encode(d.mmName)+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield2" class="ban_infobox_label">将士工号：</label>                                                                 ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+Sys.encode(d.mmNo)+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield3" class="ban_infobox_label">将士电话：</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+Sys.encode(d.mmMobile)+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield3" class="ban_infobox_label">将士级别：</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+Sys.encode(d.mmLevel)+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield3" class="ban_infobox_label">将士简介：</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+Sys.encode(d.mmIntro)+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	
	html.push('</div> ');
	
	html.push('	<div class="ban_infobox_bottom">');
	html.push('		<input name="" type="button" class=" ban_button_hilite ban_confirm_order_b submitBtn" value="立即预约"  ');
	html.push('			onclick="submitService()" /> ');
	html.push('	</div>');
	
	$("#docContent").html(html.join(''));
	$('#_cursor').html(Sys.encode(d.mmName)+"&nbsp;"+d.mmNo);
}

function submitService(){
	var url = Sys.evalUrl('/service/apply-service.html');
	Sys.toUrl(url);
}
</script>
</body>
</html>