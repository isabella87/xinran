<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
 <div class="ban_sidebar">
      <ul class="ban_sidenav">
        <li class="ban_sidenav_li"><a id="a_15" href="about15.html"  class="ban_sidenav_a">公司简介</a></li>
        <%-- <li class="ban_sidenav_li"><a id="a_16" href="about16.html" class="ban_sidenav_a">管理团队</a></li>
        <li class="ban_sidenav_li"><a id="a_17" href="about17.html" class="ban_sidenav_a">顾问团队</a></li> --%>
        <%--<li class="ban_sidenav_li"><a id="a_4" href="on-bbs-list.html?type=4" class="ban_sidenav_a">平台动态</a></li>
         <li class="ban_sidenav_li"><a id="a_2" href="on-bbs-list.html?type=2" class="ban_sidenav_a">平台公告</a></li> 
		<li class="ban_sidenav_li"><a id="a_12" href="on-bbs-list.html?type=12" class="ban_sidenav_a">社会责任</a></li>
		 <li class="ban_sidenav_li"><a id="a_19" href="about19.html" class="ban_sidenav_a">合作伙伴</a></li> --%>
		<li class="ban_sidenav_li"><a id="a_20" href="about20.html" class="ban_sidenav_a">招贤纳士</a></li>
		<li class="ban_sidenav_li"><a id="a_21" href="about21.html" class="ban_sidenav_a">联系我们</a></li>
      </ul>
  </div>

<script type="text/javascript">

	$(function(){
		if(typeof pageName != 'undefined'){
			$('ul.ban_sidenav > li > a:contains("'+pageName+'")').addClass('ban_current');
		}
	});
   
</script>

