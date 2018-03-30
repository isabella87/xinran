<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
  <div class="ban_sidebar">
      <ul class="ban_sidenav">
        <li class="ban_sidenav_li"><a id="a_22" href="help22.html" class="ban_sidenav_a">平台原理</a></li>
        <li class="ban_sidenav_li"><a class="ban_sidenav_a">新手指南</a>
          <ul class="ban_sidenav_2_ul">
            <li class="ban_sidenav_2_li"><a id="a_23" href="help23.html" class="ban_sidenav_2_a">· &nbsp;注册流程</a></li>
            <li class="ban_sidenav_2_li"><a id="a_24" href="help24.html" class="ban_sidenav_2_a">· &nbsp;出借流程</a></li>
          </ul>
        </li>
        <%-- <li class="ban_sidenav_li"><a class="ban_sidenav_a">法律声明</a>
          <ul class="ban_sidenav_2_ul">
            <li class="ban_sidenav_2_li"><a id="a_25" href="help25.html" class="ban_sidenav_2_a" target="_blank">· &nbsp;风险提示</a></li>
            <li class="ban_sidenav_2_li"><a id="a_26" href="help26.html" class="ban_sidenav_2_a" target="_blank">· &nbsp;注册协议</a></li>
            <li class="ban_sidenav_2_li"><a id="a_27" href="help27.html" class="ban_sidenav_2_a" target="_blank">· &nbsp;隐私条款</a></li>
            <li class="ban_sidenav_2_li"><a id="a_28" href="help28.html" class="ban_sidenav_2_a" target="_blank">· &nbsp;免责声明</a></li>
          </ul>
        </li> --%>
        <li class="ban_sidenav_li"><a class="ban_sidenav_a">常见问题</a>
          <ul class="ban_sidenav_2_ul">
            <li class="ban_sidenav_2_li"><a id="a_29" href="help29.html" class="ban_sidenav_2_a">· &nbsp;账户安全</a></li>
            <li class="ban_sidenav_2_li"><a id="a_30" href="help30.html" class="ban_sidenav_2_a">· &nbsp;账户管理</a></li>
            <li class="ban_sidenav_2_li"><a id="a_31" href="help31.html" class="ban_sidenav_2_a">· &nbsp;交易管理</a></li>
          </ul>
        </li>
      </ul>
 </div>
<script type="text/javascript">

	$(function(){
		if(typeof pageName != 'undefined'){
			$('ul.ban_sidenav > li > a:contains("'+pageName+'")').addClass('ban_current');
			$('ul.ban_sidenav_2_ul > li > a:contains("'+pageName+'")').addClass('ban_current');
		}
	});
   
</script>

