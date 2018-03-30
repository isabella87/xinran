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
					&gt;<a href="#" class="ban_path_a">信息列表</a>&gt;<a href="#" class="ban_path_a">信息详情</a>
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
var g_info ;
var cnId = Sys.getParam('cnid');

if(!cnId){
	Sys.errorDlg('参数错误！',null,function(){
		window.open("about:blank","_top").close();
	});
}

var cmNoticeDetailInfo = {cnId : cnId };
Sys.service.on('CmNoticeaDetailService',function(data){
	if (data) {
		g_info= data;
		showCmNoticeDetails();
	}
});

/**
 * 调用服务取到数据后渲染html，将数据展示出来
 */
function showCmNoticeDetails(){
	
	var d = g_info;

	var typeDesc = '未知类型';
	if(d.type==1){
		typeDesc = '维修资讯';
	}else if(d.type==2){
		typeDesc = '常见故障';
	}else if(d.type==3){
		typeDesc = '维护保养';
	}else if(d.type==4){
		typeDesc = '电脑问题';
	}
	
	var recommendDesc = '不推荐';
	if(d.recommend = 1){
		recommendDesc = '推荐';
	}
	
	var html = new Array();
	html.push('<div class="ban_infobox_w">                                                                                                     ');

	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield" class="ban_infobox_label">信息标题</label>                                                              ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+d.title+'                                                                                                     ');
	html.push('		</div>                                                                                                                      ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	                                                                                                                      
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield2" class="ban_infobox_label">信息类型</label>                                                                 ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+typeDesc+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	html.push('<div class="ban_infobox">                                                                                                       ');
	html.push('	<label for="textfield3" class="ban_infobox_label">信息内容</label>                                                             ');
	html.push('	<div class="ban_infobox_inputbox">                                                                                             ');
	html.push('		<div class="ban_infobox_show">                                                                                          ');
	html.push('        		'+d.content+'                                                                                                     ');
	html.push('		</div>                                                                                                                     ');
	html.push('	</div>                                                                                                                         ');
	html.push('</div>                                                                                                                          ');
	
	
	html.push('</div> ');
	
	html.push('	<div class="ban_infobox_bottom">');
	html.push('		<input name="" type="button" class=" ban_button_check" value="返回"  ');
	html.push('			onclick="history.back()" /> ');
	html.push('	</div>');
	
	$("#docContent").html(html.join(''));
	
}
		
</script>
</body>
</html>