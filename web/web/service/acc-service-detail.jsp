<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>
<body>

<%@include file="../inc/head-page.jsp" %>

<div class="ban_content">
		<div class="ban_path">
			<div class="ban_wrapper">
				<div class="ban_path_in">
					<a href="/xinran/index.html" class="ban_path_home"></a>&gt;
					<a:a href="javascript:;" cssClass="ban_path_a">账户中心</a:a>
					&gt;<a href="#" class="ban_path_a">服务列表</a>&gt;<a href="#" class="ban_path_a">服务详情</a>
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
<%@include file="../inc/foot-page.jsp" %>


<script type="text/javascript">
"use strict";
var g_service = {};
var msId = Sys.getParam('msid');

if(!msId){
	Sys.errorDlg('参数错误！',null,function(){
		window.open("about:blank","_top").close();
	});
}

var serviceDetailInfo = {msId:msId};
Sys.service.on('ServiceDetail',function(data){
	if (data) {
		g_service = data;
		showServiceDetails();
	}
});
		
function showServiceDetails(){
	var d = g_service;
	var html = new Array();                                                                                                                                               
	var statusDesc = '未知状态';
	
	if(d.status==-1){
		statusDesc = '服务中断';
	}else if(d.status==0){
		statusDesc = '服务中';
	}else if(d.status==99){
		statusDesc = '服务完成';
	}                                                                                                                                                               
	                                                                                                                                                                      
html.push('	<div class="ban_infobox_w">                                                                                                                                   ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield" class="ban_infobox_label">申请人姓名</label>                                                                                       ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('		<div class="ban_infobox_show">                                                                                          ');
html.push('        		'+d.name+'                                                                                                     ');
html.push('		</div>                                                                                                                     ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield1" class="ban_infobox_label">手机号</label>                                                                                          ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('		<div class="ban_infobox_show">                                                                                          ');
html.push('        		'+d.mobile+'                                                                                                     ');
html.push('		</div>                                                                                                                     ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield2" class="ban_infobox_label">身份证号</label>                                                                                        ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('		<div class="ban_infobox_show">                                                                                          ');
html.push('        		'+d.idCard+'                                                                                                     ');
html.push('		</div>                                                                                                                     ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield3" class="ban_infobox_label">联系地址</label>                                                                                        ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('		<div class="ban_infobox_show">                                                                                          ');
html.push('        		'+d.address+'                                                                                                     ');
html.push('		</div>                                                                                                                     ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield3" class="ban_infobox_label">预约时间</label>                                                                                        ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('		<div class="ban_infobox_show">                                                                                          ');
html.push('        		'+Sys.formatDate(d.dueTime,'yyyy-MM-dd')+'                                                                                                     ');
html.push('		</div>                                                                                                                     ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield" class="ban_infobox_label">服务名称</label>                                                                                         ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('		<div class="ban_infobox_show">                                                                                          ');
html.push('        		'+d.serviceName+'                                                                                                     ');
html.push('		</div>                                                                                                                     ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('	<label for="textfield3" class="ban_infobox_label">服务类型</label>                                                                                            ');
html.push('	<div class="ban_infobox_inputbox">                                                                                                                            ');
html.push('		<div class="ban_infobox_show">                                                                                          ');
html.push('        		'+d.type+'                                                                                                     ');
html.push('		</div>                                                                                                                     ');
html.push('	</div>                                                                                                                                                        ');
html.push('</div>                                                                                                                                                         ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield2" class="ban_infobox_label">服务描述</label>                                                                                        ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('		<div class="ban_infobox_show">                                                                                          ');
html.push('        		'+d.content+'                                                                                                     ');
html.push('		</div>                                                                                                                     ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
html.push('	<div class="ban_infobox">                                                                                                                                     ');
html.push('		<label for="textfield" class="ban_infobox_label">服务状态</label>                                                                                         ');
html.push('		<div class="ban_infobox_inputbox">                                                                                                                        ');
html.push('		<div class="ban_infobox_show">                                                                                          ');
html.push('        		'+statusDesc+'                                                                                                     ');
html.push('		</div>                                                                                                                     ');
html.push('		</div>                                                                                                                                                    ');
html.push('	</div>                                                                                                                                                        ');
                                                                                                                                                             
html.push('	<div class="ban_infobox_bottom">');
html.push('		<input name="" type="button" class=" ban_button_check" value="返回"  ');
html.push('			onclick="history.back()" /> ');
html.push('	</div>');                                                                                                                                                       
html.push('</div>                                                                                                                                                         ');
                                                                                                                                                                        
	$("#docContent").html(html.join(''));
}

</script>
</body>
</html>
