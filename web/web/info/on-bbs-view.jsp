<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<body>
<%@include file="../inc/head-page.jsp" %>
<!--分类 : fl= 1 表示 借贷攻略 ；fl = 2 表示 了解我们 ；fl = 3 表示 帮助中心 ；  -->
<div class="ban_article" id="subject_1"  style="display: none;">
<div class="ban_path">
  <div class="ban_wrapper" id="subDiv">
    <div class="ban_path_in"><a href="/portal2/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">借贷攻略</a>&gt;<a href="#" class="ban_path_a">&nbsp;</a></div>
  </div>
</div>
  <div class="ban_wrapper">
    <div class="ban_sidebar">
      <ul class="ban_sidenav">
        <li class="ban_sidenav_li"><a id="a_5"  href="on-bbs-list.html?type=5" class="ban_sidenav_a">互联网金融</a></li>
        <li class="ban_sidenav_li"><a id="a_13" href="on-bbs-list.html?type=13" class="ban_sidenav_a">工程金融</a></li>
        <li class="ban_sidenav_li"><a id="a_6" href="on-bbs-list.html?type=6" class="ban_sidenav_a">政策法规</a></li>
        <li class="ban_sidenav_li"><a id="a_7" href="on-bbs-list.html?type=7" class="ban_sidenav_a">借贷策略</a></li>
        <li class="ban_sidenav_li"><a class="ban_sidenav_a">产品研究</a>
          <ul class="ban_sidenav_2_ul">
            <li class="ban_sidenav_2_li"><a id="a_8" href="on-bbs-list.html?type=8" class="ban_sidenav_2_a">· &nbsp;工程贷</a></li>
            <li class="ban_sidenav_2_li"><a id="a_9" href="on-bbs-list.html?type=9" class="ban_sidenav_2_a">· &nbsp;债权转让</a></li>
          </ul>
        </li>
        <li class="ban_sidenav_li"><a id="a_11" href="on-bbs-list.html?type=11" class="ban_sidenav_a">班汇通高手</a></li>
      </ul>
    </div>
    <div class="ban_main" id="info">
    </div>
    
  </div>
</div>
<div class="ban_article" id="subject_2" style="display: none;">
<div class="ban_path">
  <div class="ban_wrapper"   id="subDiv">
    <div class="ban_path_in"><a href="http://www.banbank.com" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">了解我们</a>&gt;<a href="#" class="ban_path_a">&nbsp;</a></div>
  </div>
</div>
  <div class="ban_wrapper">
    <%@ include file="../info/about-left.jsp"%>
    <div class="ban_main" id="info">
      
    </div>
    
  </div>
</div>
<div class="ban_article" id="subject_3" style="display: none;">
<div class="ban_path">
  <div class="ban_wrapper"  id="subDiv">
    <div class="ban_path_in"><a href="http://www.banbank.com" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">帮助</a>&gt;<a href="#" class="ban_path_a">&nbsp;</a></div>
  </div>
</div>
  <div class="ban_wrapper">
    <%@ include file="../info/help-left.jsp"%>
    <div class="ban_main" id="info">
     
    </div>
    
  </div>
</div>
<%@include file="../inc/foot-page.jsp" %>
<script type="text/javascript">
var mType = Sys.getMtByPname(window.self.location.href),type = Sys.getParam('type');
var fl = Sys.getFlByType(type);
if(type == null){
	type="15";
}

	$(document).ready(function(){
		//菜单动态选中效果  
		$("#subject_"+fl).css("display", "block");
		$("#a_"+type).attr("class", "ban_sidenav_a ban_current");
		
		//栏目名称动态生成
		var type_title = getSubjectByType(type);
		if(type_title != null){
			if(fl == 1){
				$('#subject_'+fl).find('#subDiv').empty().html('<div class="ban_path_in"><a href="http://www.banbank.com" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">借贷攻略</a>&gt;<a href="#" class="ban_path_a">'+ type_title + '</a></div>');
			}else if(fl == 2){
				$('#subject_'+fl).find('#subDiv').empty().html('<div class="ban_path_in"><a href="http://www.banbank.com" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">了解我们</a>&gt;<a href="#" class="ban_path_a">'+ type_title + '</a></div>');
			}else if(fl == 3){
				$('#subject_'+fl).find('#subDiv').empty().html('<div class="ban_path_in"><a href="http://www.banbank.com" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">帮助</a>&gt;<a href="#" class="ban_path_a">'+ type_title +'</a></div>');
			}
		} 
		
		//加载 平台 信息详细页面
		var id = Sys.getParam('id');
		var hash = Sys.getParam('hash');
		var url = (id>=1&&id<=16)?'/info/'+ type +'/' + id + '/single':'/info/'+ id +'/' +hash;
		
		$.extend(infoDetailServiceInfo,{url : url});
		Sys.service.load('InfoDetailService');
	});
	var needShowBack = true,currLoc = window.location.href;
	$('ul.ban_sidenav  li > a',$("#subject_"+fl)).each(function(){
		if(currLoc.indexOf($(this).attr('href'))>=0){
			needShowBack = false;
		}
	});
	
	var infoDetailServiceInfo = {};
	Sys.service.on('InfoDetailService',function(data){
		if(data){
			var html = new Array();
			html.push('<div class="ban_article">');
			html.push('  <div class="ban_article_head">');
			html.push('    <h1 class="ban_article_t">'+data.title+'</h1>');
			html.push('    <div class="ban_article_time">'+(!data.createTime||data.createTime==''?'':Sys.formatDate(data.createTime, 'yyyy年MM月dd日  HH:mm:ss'))+'</div><div class="ban_article_sign"></div>');
			html.push('  </div>');
			html.push('  <div class="ban_article_text">');
			html.push('  <!--后台编辑器生成 开始-->');
			html.push(data.content);
			html.push('  <!--后台编辑器生成 结束-->');
			html.push('  </div>');
			html.push('</div>');
			if(needShowBack){
				html.push('<div class="ban_back"><a href="'+Sys.evalUrl('/info/on-bbs-list.html?type='+type+(Sys.getParam('fp')?'&p='+Sys.getParam('fp'):''))+'" class="ban_button_back"><span class="ban_button_back_t">返回</span></a></div>');
			}
			
			$("#subject_"+fl).find("#info").first().html(html.join(''));
			
			loadPageTitle(data.title);
		}
	},false);
	
	function loadPageTitle(t){
		var pt;
		if(mType=='a_tzgl'){
			if(type==5){
				pt = t+'_借贷攻略_投资技巧_投融资平台_投资理财方法_班汇通';
			}else if(type==6){
				pt = '纯信息平台应是P2P和众筹监管的基本底线_政策法规_投资技巧_投融资平台_互联网金融_投资理财方法_班汇通';
			}else if(type==7){
				pt = t+'_借贷策略_投资理财思路_怎样理财_理财方法_班汇通';
			}else if(type==8){
				pt = t+'_工程贷_项目融资_建筑项目融资_班汇通';
			}else if(type==9){
				pt = t+'_债权转让_理财产品提现_班汇通';
			}else if(type==11){
				pt = '班汇通高手_新手指南_班汇通';
			}else{
				pt = "借贷攻略_投资技巧_投融资平台_互联网金融_投资理财方法_班汇通";
			}
			
			document.title = pt;
		}else if(mType=='a_ljwm'){
			pt = getSubjectByType(type)+"_了解我们_班汇通";
			document.title = pt;
		}
	}

	function getSubjectByType(type){
	    	var _GM = {
	    			1 : ['还款公告'],   2 : ['平台公告'],
	    			3 : ['媒体报道'],   4 : ['平台动态'],
	    			5 : ['互联网金融'],  6 : ['政策法规'],
	    			7 : ['借贷策略'],   8 : ['工程贷'],
	    			9 : ['债权转让'],   10 : ['班汇宝'],
	    			11 : ['班汇通高手'], 12 : ['社会责任'],
	    			13 : ['工程金融'],  14 : ['投资课堂'],
	    			15 : ['公司简介'],  16 : ['管理团队'],
	    			17 : ['顾问团队'],  18 : ['项目评级体系'],
	    			19 : ['合作伙伴'],  20 : ['招贤纳士'],
	    			21 : ['联系我们'],  22 : ['平台原理'],
	    			23 : ['注册流程'],  24 : ['出借流程'],
	    			25 : ['风险提示'],  26 : ['注册协议'],
	    			27 : ['隐私条款'],  28 : ['免责声明'],
	    			29 : ['账户安全'],  30 : ['账户管理'],
	    			31 : ['交易管理']
	    			
	    	}
	    	
	    	var _type_title = null;
	    	for(var fl in _GM){
	    		
	    		$(_GM[fl]).each(function(i){
	    			if(type == fl){
	    				_type_title = _GM[fl][i];
	    			}
	    		});
	    	}
	    	
	    	return _type_title;
	    	
	 }
</script> 
</body>
</html>
