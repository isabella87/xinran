<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp"%>

<body>
	<%@include file="../inc/head-page.jsp"%>

	<div class="ban_content">
		<div class="ban_path">
			<div class="ban_wrapper">
				<div class="ban_path_in">
					<a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a
						href="#" class="ban_path_a">账户中心</a>&gt;<a href="#"
						class="ban_path_a">信息列表</a>
				</div>
			</div>
		</div>
		<div class="ban_wrapper">
			<div class="ban_account">
				<%@include file="../account/account-left.jsp"%>
				<div class="ban_account_content">
					<div class="ban_account_content_w">
						<h2 class="ban_page_title">
							信息列表
						</h2>
						<div class="ban_filter">
							<div class="ban_infobox_line">
					        <div class="ban_infobox">
					           <div class="ban_infobox_inputbox">
					              <div class="ban_infobox_input_w">
					                <input type="text" name="search-key" id="searchKey" class="ban_infobox_input" placeholder="请输入信息名称" />
					              </div>
					             </div>
					         </div>
					         <div class="ban_infobox">
					            <div class="ban_infobox_inputbox ban_infobox_date_w">
					              <ul class="ban_infobox_input_interval"><li class="ban_infobox_input_interval_l"><div class="ban_infobox_input_w">
					                  <input type="text" name="start-date" id="startDateDiv" class="ban_infobox_input" placeholder="开始日期"  onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd'})" />
					                </div></li><li class="ban_infobox_input_interval_r"><div class="ban_infobox_input_w">
					                  <input type="text" name="end-date" id="endDateDiv" class="ban_infobox_input" placeholder="结束日期"  onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd'})" />
					                </div></li></ul>                
					             </div>
					          </div>
					          <div class="ban_infobox">
					            <a href="javascript:;" id="searchBtn" class="ban_button_operate ban_infobox_line_b">搜索</a></div>
					   		</div>
						</div>

						<table class="ban_table" id="dataUl">
						</table>
						<div class="ban_table_bottom">
							<div class="ban_table_page" id="pager"></div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>

	<%@include file="../inc/foot-page.jsp"%>

<script type="text/javascript">

var cmNoticeDetailInfo = {};
Sys.service.on('CmNoticeDelService',function(data){
	if(data){
		 Sys.infoDlg('删除成功!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

Sys.service.on('CmNoticeSubmitService',function(data){
	if(data){
		 Sys.infoDlg('提交成功，请情况审核发布!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

Sys.service.on('CmNoticeReturnService',function(data){
	if(data){
		 Sys.infoDlg('回退成功，请修改后重新提交审核!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

Sys.service.on('CmNoticeRevokeService',function(data){
	if(data){
		 Sys.infoDlg('撤销成功，该信息将不会显示到线上!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

Sys.service.on('CmNoticePublishService',function(data){
	if(data){
		 Sys.infoDlg('发布成功，请到线上阅览!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

var params = {
		pn:	Sys.getPage()||1,
		'search-key':Sys.getParam('searchKey')||'',
		'start-date':Sys.getParam('startDate')||'',
		'end-date':Sys.getParam('endDate')||'',
		status:Sys.getParam('status')||1,
		type:Sys.getParam('type')||1
};

$(function(){
	
	loadData();
	
	$(".ban_minitab > li.ban_minitab_li").on('click',toFilter);
	
	$(".ban_infobox_line input").keydown(keyDownFn);
	
	$("#searchBtn").on('click',toSearch);
});

function keyDownFn(e){
	e = window.event||e;
	
	if(e.keyCode==13){
		toSearch();
	}
}

function toSearch(){
	
	var searchKey = $.trim($("#searchKey").val());
	var startTime = $('#startDateDiv').val();
	var endTime = $('#endDateDiv').val();
	
	params.searchKey = searchKey;
	params.startDate = startTime;
	params.endDate = endTime;
	params.status = 1;
	toUrl();
}

function toFilter(){

	changeColor($(this));
	
	var st = $(this).attr('id'),st = st.substring(st.lastIndexOf('_')+1);
	params.status = st;
	
	toUrl();
}

function changeColor($this){
	$this.parent().find('a').attr('class','ban_minitab_a');
	$this.find('a').attr('class','ban_minitab_a_current');
}

var infoAllServiceInfo = {};
Sys.service.on('AccInfoAllService',function(data){
	if(data){
		
		if(data.items){
			var html = new Array();
			
			html.push('<tr class="ban_table_tr">                          ');
			html.push('	<td class="ban_table_th">信息标题</td>           ');
			html.push('	<td class="ban_table_th">信息类型</td>            ');
			html.push('	<td class="ban_table_th">内容摘要</td>            ');
			html.push('	<td class="ban_table_th">信息状态</td>               ');
			html.push('	<td class="ban_table_th">创建用户</td>            ');
			html.push('	<td class="ban_table_th">创建时间</td>            ');
			html.push('	<td class="ban_table_th">是否推荐</td>               ');
			html.push('	<td class="ban_table_th">操作</td>             ');
			html.push('</tr>                                              ');
			
			$(data.items).each(function(i,d){
				var statusDesc = '未知状态';
				
				if(d.status==0){
					statusDesc = '待提交';
				}else if(d.status==1){
					statusDesc = '待发布';
				}else if(d.status==2){
					statusDesc = '已发布';
				}else if(d.status==3){
					statusDesc = '已撤下';
				}
				
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
				
				var MAX_SHOW_CON = 15;
				var showAbstract = d.abstractContent,showAbstract = showAbstract.length>MAX_SHOW_CON?showAbstract.substring(0,MAX_SHOW_CON)+"......":showAbstract;
				
				//<input id="tt" name="tt" type="hidden" value="dd">
				html.push('')
				html.push('<tr class="ban_table_tr">                                                                            ');
				html.push('	<td class="ban_table_td ">'+d.title+' </td>                                                ');
				html.push('	<td class="ban_table_td ">'+typeDesc+' </td>                                                ');
				html.push('	<td class="ban_table_td ">'+showAbstract+' </td>                                     ');
				html.push('	<td class="ban_table_td ">'+statusDesc+' </td>                                                ');
				html.push('	<td class="ban_table_td ">'+d.creator+'</td>                                                ');
				html.push('	<td class="ban_table_td ">'+Sys.formatDate(d.createTime,'yyyy-MM-dd')+'</td>                                                ');
				html.push('	<td class="ban_table_td ">'+recommendDesc+' </td>                                                ');
				
				if(d.status==0){
					
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="submitInfo(' + d.cnId +')" class="ban_table_buttonset_b">提交审核</a></li> ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="delInfo(' + d.cnId +')" class="ban_table_buttonset_b">删除</a></li> ');
					
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/info/acc-info-detail.html?type='+d.type +'&id=' + d.cnId + '&hash=' + d.hash)+'" class="ban_table_buttonset_b">详情</a></li>             ');
					html.push('			</ul>                                                                                    ');
					html.push('		</div>                                                                                       ');
					html.push('                                                                                                     ');
					html.push('	</td>                                                                                           ');
					
				}else if(d.status==1){
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="publishInfo(' + d.cnId +')" class="ban_table_buttonset_b">发布</a></li> ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="returnInfo(' + d.cnId +')" class="ban_table_buttonset_b">退回重审核</a></li> ');
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/info/acc-info-detail.html?type='+d.type +'&id=' + d.cnId + '&hash=' + d.hash)+'" class="ban_table_buttonset_b">详情</a></li>             ');
					html.push('			</ul>                                                                                    ');
					html.push('		</div>                                                                                       ');
					html.push('                                                                                                     ');
					html.push('	</td>                                                                                           ');
				}
				else if(d.status==2){
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="returnInfo(' + d.cnId +')" class="ban_table_buttonset_b">退回重审核</a></li> ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="revokeInfo(' + d.cnId +')" class="ban_table_buttonset_b">撤下</a></li> ');
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/info/acc-info-detail.html?type='+d.type +'&id=' + d.cnId + '&hash=' + d.hash)+'" class="ban_table_buttonset_b">详情</a></li>             ');
					html.push('			</ul>                                                                                    ');
					html.push('		</div>                                                                                       ');
					html.push('                                                                                                     ');
					html.push('	</td>                                                                                           ');
				}else if(d.status==3){
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/info/acc-info-detail.html?type='+d.type +'&id=' + d.cnId + '&hash=' + d.hash)+'" class="ban_table_buttonset_b">详情</a></li>             ');
					html.push('			</ul>                                                                                    ');
					html.push('		</div>                                                                                       ');
					html.push('                                                                                                     ');
					html.push('	</td>                                                                                           ');
				}else{
					html.push('	       ');
				}
				
				html.push('</tr>                                                                                                ');
			});
			
			$("#dataUl").html(html.join(''));
			
			if(data.pc){
				Sys.createPage(document.getElementById('pager'), data.pc);
			}
			
		}
	}
},false);

function loadData(){
	
	fillBackInputs();
	
	$.extend(infoAllServiceInfo,params);
	Sys.service.load('AccInfoAllService');
}

function submitInfo(cnId) {
	if(cnId){
		Sys.confirmDlg('您确定要提交此公告信息吗？','信息提交！',null,null,function(){
			$.extend(cmNoticeDetailInfo,{cnId : cnId});
			Sys.service.load('CmNoticeSubmitService');
		});	
	}
}

function delInfo(cnId) {
	if(cnId){
		Sys.confirmDlg('您确定要删除此公告信息吗？','信息删除！',null,null,function(){
			$.extend(cmNoticeDetailInfo,{cnId : cnId});
			Sys.service.load('CmNoticeDelService');
		});	
	}
}

function returnInfo(cnId) {
	if(cnId){
		Sys.confirmDlg('您确定要回退此公告信息吗？','信息回退！',null,null,function(){
			$.extend(cmNoticeDetailInfo,{cnId : cnId});
			Sys.service.load('CmNoticeReturnService');
		});	
	}
}

function publishInfo(cnId) {
	if(cnId){
		Sys.confirmDlg('您确定要发布此公告信息吗？','信息发布！',null,null,function(){
			$.extend(cmNoticeDetailInfo,{cnId : cnId});
			Sys.service.load('CmNoticePublishService');
		});	
	}
}

function revokeInfo(cnId) {
	if(cnId){
		Sys.confirmDlg('您确定要撤销此公告信息吗？','信息撤销！',null,null,function(){
			$.extend(cmNoticeDetailInfo,{cnId : cnId});
			Sys.service.load('CmNoticeRevokeService');
		});	
	}
}


function toUrl(){
	
	var pStr = "";
	for(var k in params){
		pStr += "&"+k+"="+params[k];	
	}
	pStr = pStr.length>0?pStr.substring(1):pStr;
	
	var currUrl = window.self.location.href;
	currUrl = currUrl.indexOf('?')>=0?currUrl.substring(0,currUrl.lastIndexOf('?')):currUrl;
	window.self.location.assign(currUrl+"?"+pStr);
}

function fillBackInputs(){
	$("#searchKey").val(params.searchKey);
	$("#startDateDiv").val(params.startDate);
	$("#endDateDiv").val(params.endDate);
	
	changeColor($("#status_"+params.status));
}

function loadTotalCount(totals){
	
	if(totals){
		for(var t in totals){
			$("#"+t+"Span").text(totals[t]);
		}
	}
}
</script>
</body>
</html>