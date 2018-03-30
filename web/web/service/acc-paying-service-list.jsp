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
						class="ban_path_a">待支付服务</a>
				</div>
			</div>
		</div>
		<div class="ban_wrapper">
			<div class="ban_account">
				<%@include file="../account/account-left.jsp"%>
				<div class="ban_account_content">
					<div class="ban_account_content_w">
						<h2 class="ban_page_title">
							待支付服务
						</h2>
						<div class="ban_filter">
							<div class="ban_infobox_line">
					        <div class="ban_infobox">
					           <div class="ban_infobox_inputbox">
					              <div class="ban_infobox_input_w">
					                <input type="text" name="search-key" id="searchKey" class="ban_infobox_input" placeholder="请输入产品名称" />
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
var params = {
		pn:	Sys.getPage()||1,
		'search-key':Sys.getParam('searchkey')||'',
		'start-date':Sys.getParam('startDate')||'',
		'end-date':Sys.getParam('endDate')||'',
		status:Sys.getParam('status')||0
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
	
	toUrl();
}

var serviceDetailInfo = {};
Sys.service.on('CompletedService',function(data){
	if(data){
		 Sys.infoDlg('服务支付成功!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

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

var serviceInfo = {};
Sys.service.on('MajorServiceService',function(data){
	if(data){
		
		if(data.items){
			var html = new Array();
			
			html.push('<tr class="ban_table_tr">                          ');
			html.push('	<td class="ban_table_th">服务名称</td>           ');
			html.push('	<td class="ban_table_th">服务编号</td>            ');
			html.push('	<td class="ban_table_th">服务金额（元）</td>            ');
			html.push('	<td class="ban_table_th">服务类型</td>               ');
			html.push('	<td class="ban_table_th">跟单用户</td>            ');
			html.push('	<td class="ban_table_th">创建时间</td>            ');
			html.push('	<td class="ban_table_th">预约时间</td>            ');
			html.push('	<td class="ban_table_th">服务状态</td>               ');
			html.push('	<td class="ban_table_th">操作</td>             ');
			html.push('</tr>                                               ');
			
			$(data.items).each(function(i,d){
				var isCredit = d.sType==2;
				var proType = Sys.getProType(d.pType||d.oriType,d.flags,isCredit);//项目类型及样式
				var showTitle = Sys.encode(d.itemShowName),MAX_TITLE_LEN=11,showTitle = showTitle.length>MAX_TITLE_LEN?showTitle.substring(0,MAX_TITLE_LEN)+'...':showTitle;
				
				var statusDesc = '未知状态';
				
				if(d.status==-1){
					statusDesc = '服务中断';
				}else if(d.status==0){
					statusDesc = '服务中';
				}else if(d.status==99){
					statusDesc = '服务完成';
				}
				html.push('<tr class="ban_table_tr">                                                                            ');
				html.push('	<td class="ban_table_td ">'+d.serviceName+' </td>                                                ');
				html.push('	<td class="ban_table_td ">'+d.serviceNo+' </td>                                                ');
				html.push('	<td class="ban_table_td ban_table_money">'+Sys.formatNumber(d.fee,true,0)+' </td>                                     ');
				html.push('	<td class="ban_table_td ">'+d.type+' </td>                                                ');
				html.push('	<td class="ban_table_td ">'+d.tracker+'</td>                                                ');
				html.push('	<td class="ban_table_td ">'+Sys.formatDate(d.createTime,'yyyy-MM-dd')+'</td>                                                ');
				html.push('	<td class="ban_table_td ">'+Sys.formatDate(d.dueTime,'yyyy-MM-dd')+'</td>                                                ');
				html.push('	<td class="ban_table_td ">'+statusDesc+' </td>                                                ');
				
				if(d.status==-1){
					var disMsg = !d.appliable?'上架':'';
					
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/service/acc-paying-service-list.html?msid='+d.msId)+'" class="ban_table_buttonset_b">提交</a></li>             ');
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/service/acc-service-detail.html?msid='+d.msId)+'" class="ban_table_buttonset_b">详情</a></li>             ');
					html.push('			</ul>                                                                                    ');
					html.push('		</div>                                                                                       ');
					html.push('                                                                                                     ');
					html.push('	</td>                                                                                           ');
					
				}else if(d.status==0){
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="completedService(' + d.msId +')" class="ban_table_buttonset_b">支付</a></li> ');
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/service/acc-service-detail.html?msid='+d.msId)+'" class="ban_table_buttonset_b">详情</a></li>             ');
					html.push('			</ul>                                                                                    ');
					html.push('		</div>                                                                                       ');
					html.push('                                                                                                     ');
					html.push('	</td>                                                                                           ');
				}else if(d.status==99){
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/service/acc-service-detail.html?msid='+d.msId)+'" class="ban_table_buttonset_b">详情</a></li>             ');
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
	
	$.extend(serviceInfo,params);
	Sys.service.load('MajorServiceService');
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
	$("#keyword").val(params.key);
	$("#startTimeDiv").val(params.startDate);
	$("#endTimeDiv").val(params.endDate);
	
	changeColor($("#status_"+params.status));
}

function completedService(msId) {
	if(msId){
		Sys.infoDlg('<span style="font-weight: bold;color: red;">暂不支持线上支付，请当面支付或者微信支付，并告知客服，谢谢配合！</span>',null,function(){
			
    	});
		/* Sys.confirmDlg('您确定要支付此服务吗？','服务支付！',null,null,function(){
			$.extend(serviceDetailInfo,{msId : msId});
			Sys.service.load('CompletedService');
		}); */	
	}
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