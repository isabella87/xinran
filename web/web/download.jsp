<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@ include file="inc/common.jsp" %>

<body>
<%@include file="inc/head-page.jsp" %>
<div class="ban_download_app_bg">
	<div class="ban_wrapper ban_downapp_box">
    	<div class="ban_downapp_left" id="phoneSlide">
        	
        </div>
    	<div class="ban_downapp_right">
        	<h5 class="ban_downapp_h5">班汇通手机客户端</h5>
            <h2 class="ban_downapp_h2">全新发布</h2>
            <div class="ban_downapple">
            	<div class="ban_qrcode_app">
                	<img id="iosAppImg" src="" class="ban_qrcode_app_img">
                </div>
                <div class="ban_qrcode_box">
                    <a id="iosAppUrl" href="" target="_blank" class="ban_downapple_btn"></a>
                    <span><em>下载班汇通IOS版APP</em>1、手机扫描左侧二维码下载<br />2、用手机在AppStore中搜索"班汇通"下载</span>
                </div>
            </div>
    		<div class="ban_downapple">
            	<div class="ban_qrcode_app">
            		<img src="./web/themes/default/images/ban_app_img.png" class="ban_qrcode_app_img">
                </div>
                <div class="ban_qrcode_box">
                    <a href="http://android.app.qq.com/myapp/detail.htm?apkName=com.banhuitong.activity" target="_blank" class="ban_downand_btn"></a>
                    <span><em>下载班汇通安卓版APP</em>1、手机扫描左侧二维码下载<br />2、用手机在AndroidMarket中搜索"班汇通"下载</span>
                </div>
            </div>
        </div>
    </div>
</div>

    
<%@include file="inc/foot-page.jsp" %>

<script type="text/javascript">
'use stricts';
/**
 * 调用服务获取下载班汇通IOS版AP的链接
 */
Sys.service.on('IosAppUrl',function(data,ctx){
	if(data){
		$('#iosAppUrl').attr('href',data.iosAppUrl);
	}
});

// 创建一个js的匿名函数并立即执行
(function($){
	
	$.fn.extend({
		phoneSlide : function(cfg){

			//var me = $('#phoneSlide');
			var imgs = cfg.imgs;
			var currStep = 0;
			var currTop = 0;
			var forward = true; //前进
			var isStart = false;
			
			applyDefaults();
			createPics();
			createDots();
			doScheduler();
			
			function applyDefaults(){
				var _df = {
						schedule : 3000,
						speed : 500,
						times : 100,
						dotUlClass : 'ban_downapp_spoint_ul',
						imgUlClass : 'ban_downapp_img',
						dotClass : 'ban_downapp_spoint',
						dotActiveClass : 'ban_downapp_spoint_cur'
				};
				
				cfg = $.extend(_df,cfg||{});
			}
			
			/**
			*加载滚动的多张图片
			*/
			function createPics(){
				
				var div = $('<div class="ban_downapp_imgwidth phoneSlide_img_div"></div>');
				var ul = $('<ul class="'+cfg.imgUlClass+' phoneSlide_img_ul"></ul>');
				
				for(var i=0;i<imgs.length;i++){
					var li = $('<li class="phoneSlide_img_li"><img src="'+imgs[i]+'"  /></li>');
					ul.append(li);
				}
				div.append(ul);
				$('#phoneSlide').append(div);
			}
			
			/**
			*加载图片下面的对应的多个切换点
			*/
			function createDots(){
				var ul = $('<ul class="'+cfg.dotUlClass+'"></ul>');
				
				for(var i=0;i<imgs.length;i++){
					var li = $('<li class="'+cfg.dotClass+' phoneSlide_dot_li" data-index="'+i+'" style="cursor:pointer"></li>');
					if(i===0){
						li.addClass(cfg.dotActiveClass);
					}
					ul.append(li);
				}
				$('#phoneSlide').append(ul);
				
				$('.phoneSlide_dot_li').on('click',dotClicked);
				
				function dotClicked(){
					//var me = $(this);
					var index = $('.phoneSlide_dot_li').data('index')+1;
					gotoStep(parseInt(index));
				}
			}
			
			function gotoStep(index){
				if(index===currStep||isStart) return;
				
				var currObj = $('.phoneSlide_img_li').eq(currStep-1);
				var targetObj = $('.phoneSlide_img_li').eq(index-1);
				currTop = $('.phoneSlide_img_li').eq(currStep-1)[0].offsetLeft;
				sTo(targetObj[0].offsetLeft);
				setCursor(index);
			}
			
			function sTo(t){
				
				var speed = cfg.speed; //滚动的速度
				var times = cfg.times;
				var eveTimes = speed/times;
				var eveStep = (t - currTop)/times;
				var count = 1;
				var loopFn;
				
				(function(){
					if(count>times){
						clearTimeout(loopFn);
						isStart = false;
					}else{
						var iul = $('.phoneSlide_img_div')[0];
						iul.scrollLeft = currTop + eveStep*count;
						
						loopFn = setTimeout(arguments.callee, eveTimes);
						isStart = true;
					}
					count++;
				})();
			}
			
			function setCursor(index){
				$('.phoneSlide_dot_li').eq(currStep-1).removeClass(cfg.dotActiveClass);
				$('.phoneSlide_dot_li').eq(index-1).addClass(cfg.dotActiveClass);
				
				currStep = index;
			}
			
			function doScheduler(){
				(function(){
					var sp = currStep;
					if(forward){
						sp++;
					}else{
						sp--;
					}
					
					if(sp>imgs.length){
						sp = imgs.length-1;
						forward = false;
					}else if(sp<1){
						sp = 2;
						forward = true;
					}
					
					gotoStep(sp);
					
					setTimeout(arguments.callee, cfg.schedule);
				})();
			}
			
			
		}
	});
})(jQuery);

$(function(){
	$('#iosAppImg').attr('src',Sys.config.xrSrvUrl+'/app/ios-app-rcode-pic'); // 调用服务获取IOS二维码图片
	
	// 实现5张图片左右滚动效果
	$('#phoneSlide').phoneSlide({
		imgs : ['./web/themes/default/images/app_01.jpg',
		        './web/themes/default/images/app_02.jpg',
		        './web/themes/default/images/app_03.jpg',
		        './web/themes/default/images/app_04.jpg',
		        './web/themes/default/images/app_05.jpg']
	});
});
</script>
</body>
</html>
