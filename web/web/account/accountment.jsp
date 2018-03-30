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
						class="ban_path_a">资产概况</a>
				</div>
			</div>
		</div>
		<div class="ban_wrapper">
			<div class="ban_account">
				<%@include file="../account/account-left.jsp"%>
				<div class="ban_account_content">

					<div class="ban_account_content_w">
	 				   <h2 class="ban_page_title"><span class="ban_databig_u">单位：元</span>资产概况</h2>
	 				   
						<div class="ban_account_overview_top">
							<div class="ban_databig" id="visibleBlc">
								<span class="ban_databig_t">账户余额</span><span class="ban_databig_c">0<span class="ban_data_c_decimal">.00</span></span><!-- <span class="ban_databig_u">元</span> -->
							</div>
							<!-- <div class="ban_databig ban_account_overview_topr" id="amtDiv">
								<span class="ban_databig_t">当前待收本金</span><span class="ban_databig_c"  style="color: #d9272e;">0<span class="ban_data_c_decimal">.00</span></span><span class="ban_databig_u">元</span>
							</div> -->
							<ul class="ban_use_dongjie">
				            	<li>可用余额:<strong id="availableBlc">0.00</strong></li>
				                <!-- <li>募集中资金:<strong id="frozenBlc">0.00</strong></li> -->
				            </ul>
				            
				            <div class="ban_chong_t_btn">
				            	<a href="/xinran/account/recharge.html"  class="ban_button_hilite">我要充值</a>
				                <a href="/xinran/account/withdraw.html"  class="ban_button_check">我要提现</a>
				            </div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@include file="../inc/foot-page.jsp"%>


<script type="text/javascript">
var g_currIndex = "0";
Sys.service.on('Account', function(data){
	if (data) {
		if (data.userType === 1) {
			// 对于个人用户, 首先判断是否已开户
			if (data.status !== 3) {
				//showOpenAccount();
			} else {
				// 显示帐户信息
				showJxPayInfo(data.allowBorrow);
			}
		} else if (data.userType === 2) {
			// 对于机构用户, 判断是否已开户
			if (data.status !== 3) {
				//showOrgOpenAccount(); //提示机构用户联系项目经理去'班汇通后台管理系统'去开户
			} else {
				// 显示帐户信息
				showJxPayInfo(data.allowBorrow);
			}
		}
	}
});

Sys.service.on('JxPayPwdStatus', function(data, eCode, eMsg){
	if (eCode === 2) {
		Sys.infoDlg('<strong>暂时无法联机获取银行数据,请您稍后再刷新页面尝试！</strong>');
		return true;
	}
	
	var status = data; // 判断是否已设置密码
	
	if (!eCode && !status) {
		// 如果不存在错误信息并且没有设置交易密码，则转到设置交易密码页面进行设置
		var _okFun = function() {
			window.self.location.assign(Sys.evalUrl('/account/jxpay-password.html'));
		}
		dialog({
		      title: '提示',
		      content: '您还没有设置交易密码，<br>在操作出借、提现时需输入交易密码，<br>为了您的账户安全，请尽快设置交易密码！',
		      fixed: true,
		      quickClose: true,
		      cancelDisplay: false,
		      okValue: '确定',
		      ok: _okFun,
		      cancel: _okFun
		    }).showModal();
	}
},false);


/**
 * 加载账户余额、账户可用余额、(募集中资金(其实就是冻结资金)=账户余额-账户可用余额) var amt1 = "0",amt2 = ".00";
 */
Sys.service.on("JxPayAccBalance", function(data, eCode, eMsg) {
	if (eCode === 2) {
		Sys.infoDlg('<strong>暂时无法联机获取银行数据,请您稍后再刷新页面尝试！</strong>');
		return true;
	}
	
	if (data) {
		var aBal = Sys.money2Array(data.visible);  //账户余额
		var frozenBlcTemp = data.visible - data.available; //募集中资金
		$("#visibleBlc").html('<span class="ban_databig_t">账户余额</span><span class="ban_databig_c" >'+aBal[0]+'<span class="ban_data_c_decimal">.'+aBal[1]+'</span></span>');
		$("#availableBlc").html(Sys.formatNumber(data.available, true, 2));   //账户可用余额
		$("#frozenBlc").html('<dfn>募集中资金</dfn><em>'+ Sys.formatNumber(frozenBlcTemp, true, 2) +'</em>');
	}
},false);

Sys.service.on('SurveyService', function(data){
	if (data) {
		var receivingPrincipalTemp = Sys.formatNumber(data.receivingPrincipal);  // 预计待收本金
		var receivingInterestTemp = Sys.formatNumber(data.receivingInterest); // 预计待收利息
		
		var repayingPrincipalTemp = Sys.formatNumber(data.repayingPrincipal);  // 预计待还本金
		var repayingInterestTemp = Sys.formatNumber(data.repayingInterest); // 预计待还利息
		
		if (g_currIndex === "0") {
			//我的出借
			$('#receivingPrincipal').show().html('<dfn>当前待收本金</dfn><em>' + receivingPrincipalTemp + '</em>');
			$('#receivingInterest').show().html('<dfn>预计待收利息</dfn><em>' + receivingInterestTemp + '</em>');
			$('#frozenBlc').show();
			$('#repayingPrincipal').hide();
			$('#repayingInterest').hide();
			
			// 显示预计待收本金或利息列表数据并渲染
			renderingAmtList(formatPAIList(data.preReceiveAmtList),g_currIndex);  
			
			$("#title-0").addClass('ban_detailed_tab_current');
			$("#text-1").hide();
			$("#scrollDiv-1").hide();
			
		} else if (g_currIndex === "1") {
			//我的借款
			$('#repayingPrincipal').show().html('<dfn>当前待还本金</dfn><i>'+ repayingPrincipalTemp +'</i>');
			$('#repayingInterest').show().html('<dfn>预计待还利息</dfn><i>'+ repayingInterestTemp +'</i>');
			$('#receivingPrincipal').hide();
			$('#receivingInterest').hide();
			$('#frozenBlc').hide();
			
			 // 显示预计待还本金或利息列表数据并渲染
			renderingAmtList(formatPAIList(data.preRepayAmtList),g_currIndex); 
			
			$("#title-1").addClass('ban_detailed_tab_current');
			$("#text-0").hide();
			$("#scrollDiv-0").hide();
		}
	}
}, false);

$(function(){
	initTab();
	
	$("[id^=scrollDiv]").on('scroll',function(e){
		var me = $(this);
		var id = me.attr('id');
		var index = id.split('-')[1];
		
		activeScoll.call(me,e,{
			scrollDiv : "#scrollDiv-"+index,
			paiUl : "#paiUl-"+index+" > li",
			index : index
		});
	});
	
});

////////////////////////////////////////
//All private functions
////////////////////////////////////////

function initTab(){
	
	$("#inver_left .ban_detailed_tab > li").each(function(i){
		$(this).attr("id","title-"+i);
	});
	$("#inver_left .ban_timeline").each(function(i){
		$(this).attr("id","scrollDiv-"+i);
	});
	$("#inver_left .ban_account_overview_text").each(function(i){
		$(this).attr("id","text-"+i);
	});

	$("#inver_left .ban_detailed_tab > li").on("click",function(){
		var me = $(this);
		var index = me.attr("id").split('-')[1];
		
		me.addClass('ban_detailed_tab_current');
		me.siblings().removeClass('ban_detailed_tab_current');
		//$("#inver_left .ban_detailed_tab  > li").attr('class','ban_detailed_tab_li');
		//me.attr('class','ban_detailed_tab_current');
		
		$("#inver_left  .ban_timeline").hide();
		$("#inver_left  .ban_timeline[id='scrollDiv-"+index+"']").show();
		
		$("#inver_left  .ban_account_overview_text").hide();
		$("#inver_left  .ban_account_overview_text[id='text-"+index+"']").show();
		
		g_currIndex = index;
		
		Sys.service.load('SurveyService',{},true);
		
	}); 
}

/**
 * 对于未在银行开户的个人用户，显示马上开通按钮。
 */
function showOpenAccount() {
	 var html = new Array();
	 html.push('<h2 class="ban_page_title">银行存管—势在必行</h2>');
	 html.push('<div class="ban_jiangxi_bank">班汇通牵手江西银行<br /><i>实现资金银行存管</i></div>');
	 html.push('<div class="ban_kaitong_jx">');
	 html.push('  <a href="'+Sys.evalUrl('/account/apply-jxpay-info.html')+'"  class="ban_button_hilite">马上开通</a>');
	// html.push('  <a href="javascript:void(0);" target="_blank" class="ban_bank_tuoguan">什么是银行存管？</a>');
	 html.push('</div>');

	 $("#inver_left").html(html.join(''));
}

/**
 * 对于未在银行开户的机构用户，显示联系项目经理开通银行帐户的提示。
 */
function showOrgOpenAccount() {
	$('#inver_left').hide();
	Sys.infoDlg('<strong>请尽快联系班汇通项目经理。收到申请后，我们将帮您提交申请银行存管账户！</strong>');
	return true;
}

/**
 * 对于已在银行开户的用户，显示银行开户信息
 */
function showJxPayInfo(allowBorrow) {
	// 判断是否设置过密码
	Sys.service.load('JxPayPwdStatus');
	
	// 若allowBorrow(允许借款)返回1，默认进入我的借款标签
	if(allowBorrow === 1){
		g_currIndex = "1";
	}
	
	// 加载账户余额
	Sys.service.load("JxPayAccBalance", {}, true);
	
	// 加载账户资产数据及我的投资或我的借款标签数据
	Sys.service.load('SurveyService', {}, true);
}


function formatPAIList(list){
	
	if(!list||list.length==0) return null;
	var fl = [];
	
	$(list).each(function(i,data){
		//准备数据：每天的数据的放入数组显示到页面
		var k = Sys.formatDate(data.dueTime,'yyyy年MM月dd日');
		if(!fl[k]){
			fl[k] = [];
		}
		fl[k].push(data);
	});
	return fl;
}

/**
 * 我的出借或我的借款列表数据加载
 */
function renderingAmtList(listItem,index){
	
	$("#totalLx-"+index).html((index==="0"?'<span class="ban_databig_t">预计待收</span>':'<span class="ban_databig_t">预计待还</span>')+Sys.formatNumber(0,true,2));
	if(listItem){
		var html = [];
		var nearestDate = null;
		var currDate = new Date(Sys.formatDate(window.serverTime().getTime(),'yyyy/MM/dd'));
		html.push('<ul class="ban_timeline_ul" id="paiUl-'+index+'">');
		for(var k in listItem){ //键值对中的k-即日期
			var t = new Date(k.replace(/[年|月]+/g,'/').replace(/[日]+/g,''));
			
			if(!nearestDate){
				nearestDate = t;
			}else{
				//默认进来取离当前日期最近的日期显示数据
				if(Math.abs(currDate.getTime() - t.getTime()) <= Math.abs(currDate.getTime() - nearestDate.getTime())){
					nearestDate = t;
				}
			}
			
			html.push('<li class="ban_timeline_li">                                                   ');
			html.push('	<div class="ban_timeline_time" name="'+t.getTime()+'">'+k+'</div>               ');//ban_timeline_time_current
			$(listItem[k]).each(function(i,d){
				html.push('		<a href="javascript:;" class="ban_timeline_event"><span                                           ');
				html.push('		class="ban_button_hilite ban_timeline_event_t2">'+Sys.BhbBonusMapping[d.tranType]+'</span><span         ');
				html.push('		class="ban_timeline_event_t1">'+Sys.encode(d.itemShowName)+'</span><span              ');
				html.push('		class="ban_timeline_event_ts" name="'+d.amt+'">'+Sys.formatNumber(d.amt,true,2)+'</span><span  ');
				html.push('		class="ban_timeline_event_t3">元</span></a>                  ');
			});
			
			html.push('</li>                                                                          ');
		}
		html.push('</ul>')
		$("#scrollDiv-"+index).html(html.join(''));
		
		activeScoll(null,{
			scrollDiv : "#scrollDiv-"+index,
			paiUl : "#paiUl-"+index+" > li",
			index : index
		});
		
		var ob = $('div[name="'+nearestDate.getTime()+'"]').parents('.ban_timeline_li').next();
		var initScrollHeight = 30;
		if(ob.length>0){
			initScrollHeight = ob.offset().top - $("#scrollDiv-"+index).offset().top - $("#scrollDiv-"+index).height();
		}
		
		$("#scrollDiv-"+index).scrollTop(initScrollHeight);
	}else{
		//$("#paiUl").remove();
	}
}


/**
 * 滚动效果
 * @param   activeScoll0( e, {  scrollDiv : "#scrollDiv-0",  paiUl : "#paiUl-0 > li" , index : 1 或 0 }
 */
function activeScoll(e,cfg){
	e = e||window.event;
	var scrollDiv = $(cfg.scrollDiv);
	var currPos;
	var total=0;
	$(cfg.paiUl).each(function(){
		var m = $(this).offset().top - (scrollDiv.offset().top+scrollDiv.height());
		if(m<-10){
			currPos = $(this);
			$(this).find('span.ban_timeline_event_ts').each(function(){
				total += parseFloat($(this).attr('name'));
			});
		}
	});
	
	$(cfg.paiUl+" > div").removeClass('ban_timeline_time_current');
	currPos.children('div').first().addClass('ban_timeline_time_current');
	
	$("#totalLx-"+cfg.index).html((cfg.index==="0"?'<span class="ban_databig_t">预计待收</span>':'<span class="ban_databig_t">预计待还</span>')+Sys.formatNumber(total,true,2));
}

</script>
</body>
</html>