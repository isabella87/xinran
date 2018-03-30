<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp"%>

<body>
	<%@include file="../inc/head-page.jsp"%>

	<div class="ban_content">
		<div class="ban_path">
			<div class="ban_wrapper">
				<div class="ban_path_in">
					<a href="/xinran/index.html" class="ban_path_home"></a>&gt;
					<a:a href="javascript:;" cssClass="ban_path_a">账户中心</a:a>
					&gt;<a href="#" class="ban_path_a">将士列表</a>&gt;<a href="#" class="ban_path_a">将士详情</a>
				</div>
			</div>
		</div>
		<div class="ban_wrapper">
			<div class="ban_account">
				<%@include file="../account/account-left.jsp"%>
				<div class="ban_account_content">
					<div class="ban_account_content_w" id="docContent">


					</div>

				</div>
			</div>
		</div>
	</div>

	<%@include file="../inc/foot-page.jsp"%>

<script type="text/javascript">
"use strict";
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
	
}

Sys.service.on('FileService',function(data,ctx){
	if(data&&data.length > 0){
		var html = [];
		html.push(' <div class="ban_project_photo">      ');
		html.push('  <div class="main_visual">          ');
		html.push('<div class="flicking_con">');
		for(var i = 0; i < data.length; i++){
			html.push('<a href="javascript:;"></a>');
		}
		html.push('    </div>  ');
		html.push('    <div class="main_image">');
		html.push('      <ul>     ');
		for(var i = 0; i < data.length; i++){
			var d = data[i];
			html.push('        <li><a href="'+(d.link ? d.link : 'javascript:;')+'"><span id="prj_pic_'+d.id+'" style="background-image:url('+Sys.config.xrSrvUrl+'/files/'+d.id+'/'+d.hash+');  " ></span></a></li>      ');
		}
		html.push('      </ul>       ');
		html.push('      <a href="javascript:;" id="btn_prev"></a> <a href="javascript:;" id="btn_next"></a> </div> ');
		html.push('  </div>        ');
		html.push(' </div>        ');
		
		$(".ban_project_photo_box").html(html.join(''));
		
		_initBanner();
		
		doAfterPicLoaded(data);
		
		if(data.length === 1){
			$('.ban_project_photo_box a[id^=btn_]').remove();
			$('.ban_project_photo_box .flicking_con').empty();
		}
	}
},false);

function doAfterPicLoaded(pics){
	
	for(var i = 0;i<pics.length;i++){
		
		var d = pics[i];
		var img = new Image();
		var picObj = document.getElementById("prj_pic_"+d.id);
		
		img.src = Sys.config.xrSrvUrl+'/files/'+d.id+'/'+d.hash;
		img.id = 'virtual_pic_'+d.id;
		if(img.complete){
		    resizePic(picObj,img);
		}else{
		    img.onload = function(e){
		    	e = e || window.event;
		    	try{
		    		var pic = e.target;
		    		var picId = pic.getAttribute('id');
		    		var index = picId.substring('virtual_pic_'.length);
		    		var picObj = document.getElementById("prj_pic_"+index);
			    	resizePic(picObj,e.target);
			    	
		    	}catch (e) {
					console.log(e);
				}
		    };
		}
	}
}

function resizePic(obj,img){
	
	if(img.width/img.height > 1025/422){
		obj.style.backgroundSize = '100% auto';
	}else{
		obj.style.backgroundSize = ' auto 100%';
	}
}
		
</script>
</body>
</html>