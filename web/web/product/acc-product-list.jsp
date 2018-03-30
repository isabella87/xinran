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
						class="ban_path_a">产品列表</a>
				</div>
			</div>
		</div>
		<div class="ban_wrapper">
			<div class="ban_account">
				<%@include file="../account/account-left.jsp"%>
				<div class="ban_account_content">
					<div class="ban_account_content_w">
						<h2 class="ban_page_title">
							产品列表
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

var productDetailInfo = {};
Sys.service.on('ProductDelService',function(data){
	if(data){
		 Sys.infoDlg('删除成功!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

Sys.service.on('ProductUpService',function(data){
	if(data){
		 Sys.infoDlg('上架成功!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

Sys.service.on('ProductDownService',function(data){
	if(data){
		 Sys.infoDlg('下架成功!',null,function(){
			 window.location.reload();
		 });
	 }
},false);

var params = {
		pn:	Sys.getPage()||1,
		'search-key':Sys.getParam('searchKey')||'',
		'start-date':Sys.getParam('startDate')||'',
		'end-date':Sys.getParam('endDate')||'',
		status:Sys.getParam('status')||2
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
	
	params['search-key'] = searchKey;
	params['start-date'] = startTime;
	params['end-date'] = endTime;
	
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

var productInfo = {};
Sys.service.on('MajorProductService',function(data){
	if(data){
		
		if(data.items){
			var html = new Array();
			
			html.push('<tr class="ban_table_tr">                          ');
			html.push('	<td class="ban_table_th">产品ID</td>           ');
			html.push('	<td class="ban_table_th">产品名称</td>           ');
			html.push('	<td class="ban_table_th">产品序号</td>            ');
			html.push('	<td class="ban_table_th">产品金额（元）</td>            ');
			html.push('	<td class="ban_table_th">产品类型</td>               ');
			html.push('	<td class="ban_table_th">创建用户</td>            ');
			html.push('	<td class="ban_table_th">创建时间</td>            ');
			html.push('	<td class="ban_table_th">产品状态</td>               ');
			html.push('	<td class="ban_table_th">操作</td>             ');
			html.push('</tr>                                              ');
			
			$(data.items).each(function(i,d){
				var isCredit = d.sType==2;
				var proType = Sys.getProType(d.pType||d.oriType,d.flags,isCredit);//项目类型及样式
				var showTitle = Sys.encode(d.itemShowName),MAX_TITLE_LEN=11,showTitle = showTitle.length>MAX_TITLE_LEN?showTitle.substring(0,MAX_TITLE_LEN)+'...':showTitle;
				
				var statusDesc = '未知状态';
				
				if(d.status==0){
					statusDesc = '未上架';
				}else if(d.status==1){
					statusDesc = '已上架';
				}else if(d.status==-1){
					statusDesc = '已下架';
				}
				//<input id="tt" name="tt" type="hidden" value="dd">
				html.push('')
				html.push('<tr class="ban_table_tr">                                                                            ');
				html.push('	<td class="ban_table_td ">'+d.mpId+' </td>                                                ');
				html.push('	<td class="ban_table_td ">'+d.proName+' </td>                                                ');
				html.push('	<td class="ban_table_td ">'+d.proNo+' </td>                                                ');
				html.push('	<td class="ban_table_td ban_table_money">'+Sys.formatNumber(d.price,true,0)+' </td>                                     ');
				html.push('	<td class="ban_table_td ">'+d.type+' </td>                                                ');
				html.push('	<td class="ban_table_td ">'+d.creator+'</td>                                                ');
				html.push('	<td class="ban_table_td ">'+Sys.formatDate(d.createTime,'yyyy-MM-dd')+'</td>                                                ');
				html.push('	<td class="ban_table_td ">'+statusDesc+' </td>                                                ');
				
				if(d.status==0){
					var disMsg = !d.appliable?'上架':'';
					
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="upProduct(' + d.mpId +')" class="ban_table_buttonset_b">上架</a></li> ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="delProduct(' + d.mpId +')" class="ban_table_buttonset_b">删除</a></li> ');
					
					
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/product/acc-product-detail.html?mpid='+d.mpId)+'" class="ban_table_buttonset_b">详情</a></li>             ');
					html.push('			</ul>                                                                                    ');
					html.push('		</div>                                                                                       ');
					html.push('                                                                                                     ');
					html.push('	</td>                                                                                           ');
					
				}else if(d.status==1){
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="downProduct(' + d.mpId +')" class="ban_table_buttonset_b">下架</a></li> ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="delProduct(' + d.mpId +')" class="ban_table_buttonset_b">删除</a></li> ');
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/product/acc-product-detail.html?mpid='+d.mpId)+'" class="ban_table_buttonset_b">详情</a></li>             ');
					html.push('			</ul>                                                                                    ');
					html.push('		</div>                                                                                       ');
					html.push('                                                                                                     ');
					html.push('	</td>                                                                                           ');
				}else if(d.status==-1){
					html.push('	<td class="ban_table_td">                                                                       ');
					html.push('		<div class="ban_table_buttonset">                                                            ');
					html.push('			<ul class="ban_table_buttonset_ul">                                                      ');
					html.push('				<li class="ban_table_buttonset_li " ><a href="javascript:void(0);" onClick="delProduct(' + d.mpId +')" class="ban_table_buttonset_b">删除</a></li> ');
					html.push('				<li class="ban_table_buttonset_li"><a                                                ');
					html.push('					href="'+Sys.evalUrl('/product/acc-product-detail.html?mpid='+d.mpId)+'" class="ban_table_buttonset_b">详情</a></li>             ');
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
	
	$.extend(productInfo,params);
	Sys.service.load('MajorProductService');
}

function upProduct(mpId) {
	if(mpId){
		Sys.confirmDlg('您确定要上架此产品吗？','产品上架！',null,null,function(){
			$.extend(productDetailInfo,{mpId : mpId});
			Sys.service.load('ProductUpService');
		});	
	}
}

function downProduct(mpId) {
	if(mpId){
		Sys.confirmDlg('您确定要下架此产品吗？','产品下架！',null,null,function(){
			$.extend(productDetailInfo,{mpId : mpId});
			Sys.service.load('ProductDownService');
		});	
	}
}

function delProduct(mpId) {
	if(mpId){
		Sys.confirmDlg('您确定要删除此产品吗？','产品删除！',null,null,function(){
			$.extend(productDetailInfo,{mpId : mpId});
			Sys.service.load('ProductDelService');
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