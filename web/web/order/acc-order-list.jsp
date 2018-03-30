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
						class="ban_path_a">订单列表</a>
				</div>
			</div>
		</div>
		<div class="ban_wrapper">
			<div class="ban_account">
				<%@include file="../account/account-left.jsp"%>
				<div class="ban_account_content">
					<div class="ban_account_content_w">
						<h2 class="ban_page_title">
							历史订单
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
		'status':Sys.getParam('status')||65535,
		'pay-type':Sys.getParam('pay-type')||65535
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
	
	var searchkey = $.trim($("#searchKey").val());
	var startTime = $('#startDateDiv').val();
	var endTime = $('#endDateDiv').val();
	
	params.searchkey = searchkey;
	params.startDate = startTime;
	params.endDate = endTime;
	
	toUrl();
}

var orderDetailInfo = {};
Sys.service.on('OrderDelService',function(data){
	if(data){
		 Sys.infoDlg('删除成功!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

Sys.service.on('OrderSubmitService',function(data){
	if(data){
		 Sys.infoDlg('订单提交成功!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

Sys.service.on('OrderDownService',function(data){
	if(data){
		 Sys.infoDlg('下架成功!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

Sys.service.on('OrderPayService',function(data){
	if(data){
		 Sys.infoDlg('订单支付成功!',null,function(){
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

var orderInfo = {};
Sys.service.on('OrderService',function(data){
	if(data){
		
		if(data.items){
			var html = new Array();
			
			html.push('<tr class="ban_table_tr">                          ');
			html.push('	<td class="ban_table_th">产品名称</td>           ');
			html.push('	<td class="ban_table_th">产品编号</td>            ');
			html.push('	<td class="ban_table_th">产品金额（元）</td>            ');
			html.push('	<td class="ban_table_th">快递费用（元）</td>               ');
			html.push('	<td class="ban_table_th">订单编号</td>            ');
			html.push('	<td class="ban_table_th">创建时间</td>            ');
			html.push('	<td class="ban_table_th">支付方式</td>            ');
			html.push('	<td class="ban_table_th">订单状态</td>               ');
			html.push('	<td class="ban_table_th">操作</td>             ');
			html.push('</tr>                                                ');
			
			$(data.items).each(function(i,d){
				var isCredit = d.sType==2;
				var proType = Sys.getProType(d.pType||d.oriType,d.flags,isCredit);//项目类型及样式
				var showTitle = Sys.encode(d.itemShowName),MAX_TITLE_LEN=11,showTitle = showTitle.length>MAX_TITLE_LEN?showTitle.substring(0,MAX_TITLE_LEN)+'...':showTitle;
				
				var statusDesc = '未知状态';
				var payTypeDesc = '未知方式';
				if(d.status==0){
					statusDesc = '待确认';
				}else if(d.status==1){
					statusDesc = '待支付';
				}else if(d.status==2){
					statusDesc = '已支付';
				}
				
				if(d.payType==0){
					payTypeDesc = '线下支付';
				}else if(d.payType==1){
					payTypeDesc = '待支付宝支付';
				}else if(d.payType==2){
					payTypeDesc = '微信支付';
				}
				
				html.push('<tr class="ban_table_tr">                                                                            ');
				html.push('	<td class="ban_table_td ">'+d.proName+' </td>                                                ');
				html.push('	<td class="ban_table_td ">'+d.proNo+' </td>                                                ');
				html.push('	<td class="ban_table_td ban_table_money">'+Sys.formatNumber(d.price,true,0)+' </td>                                     ');
				html.push('	<td class="ban_table_td ban_table_money">'+Sys.formatNumber(d.despatchFee,true,0)+' </td>                                     ');
				html.push('	<td class="ban_table_td ">'+d.poId+' </td>                                                ');
				html.push('	<td class="ban_table_td ">'+Sys.formatDate(d.createTime,'yyyy-MM-dd')+'</td>                                                ');
				html.push('	<td class="ban_table_td ">'+payTypeDesc+'</td>                                                ');
				html.push('	<td class="ban_table_td ">'+statusDesc+' </td>                                                ');
				
				if(d.status==0){
					
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="submitOrder(' + d.poId +')" class="ban_table_buttonset_b">提交</a></li> ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="delOrder(' + d.poId +')" class="ban_table_buttonset_b">删除</a></li> ');
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/order/acc-order-detail.html?poid='+d.poId)+'" class="ban_table_buttonset_b">详情</a></li>             ');
					html.push('			</ul>                                                                                    ');
					html.push('		</div>                                                                                       ');
					html.push('                                                                                                     ');
					html.push('	</td>                                                                                           ');
					
				}else if(d.status==1){
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="payOrder(' + d.poId +')" class="ban_table_buttonset_b">支付</a></li> ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="downOrder(' + d.poId +')" class="ban_table_buttonset_b">下架</a></li> ');
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/order/acc-order-detail.html?poid='+d.poId)+'" class="ban_table_buttonset_b">详情</a></li>             ');
					html.push('			</ul>                                                                                    ');
					html.push('		</div>                                                                                       ');
					html.push('                                                                                                     ');
					html.push('	</td>                                                                                           ');
				}else if(d.status==2){
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
	
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/order/acc-order-detail.html?poid='+d.poId)+'" class="ban_table_buttonset_b">详情</a></li>             ');
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
	
	$.extend(orderInfo,params);
	Sys.service.load('OrderService');
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

function submitOrder(poId) {
	if(poId){
		Sys.confirmDlg('您确定要提交此订单吗？','订单提交！',null,null,function(){
			$.extend(orderDetailInfo,{poId : poId});
			Sys.service.load('OrderSubmitService');
		});	
	}
}

function payOrder(poId) {
	if(poId){
		Sys.confirmDlg('您确定要支付此订单吗？','订单支付！',null,null,function(){
			$.extend(orderDetailInfo,{poId : poId});
			Sys.service.load('OrderPayService');
		});	
	}
}

function downOrder(poId) {
	if(poId){
		Sys.confirmDlg('您确定要下架此订单吗？','订单下架！',null,null,function(){
			$.extend(orderDetailInfo,{poId : poId});
			Sys.service.load('OrderDownService');
		});	
	}
}

function delOrder(poId) {
	if(poId){
		Sys.confirmDlg('您确定要删除此订单吗？','订单删除！',null,null,function(){
			$.extend(orderDetailInfo,{poId : poId});
			Sys.service.load('OrderDelService');
		});	
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