<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>
<body>
<%@include file="../inc/head-page.jsp" %>


<div class="ban_content ban_accountinfo">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">账户中心</a>
      &gt;<a href="#" class="ban_path_a">萌承账户信息</a>&gt;<a href="#" class="ban_path_a">修改邮箱</a></div>
    </div>
  </div>
  <div class="ban_wrapper">
    <div class="ban_account"> 
      <%@include file="../account/account-left.jsp" %>
      <div class="ban_account_content">
        <div class="ban_account_content_w">
          <h2 class="ban_page_title">修改邮箱</h2>
          
          <form action="" id="editForm" name="editForm">
          <div class="ban_infobox_w">
          
          <div class="ban_page_accountinfo">
            
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">新邮箱地址</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_input_w">
                  <input type="text" name="textfield" id="textfield" class="ban_infobox_input" placeholder="" />
                </div>
              </div>
              <div class="ban_infobox_u"></div>
            </div>
            
            
            
          
          </div>
<div class="ban_infobox_bottom">
            <input name="" type="button" class=" ban_button_hilite" value="发送验证邮件" onclick="" />
          </div>
          </div>
          </form>
          
        </div>
        
      </div>
    </div>
  </div>
</div>

<%@include file="../inc/foot-page.jsp" %>


</body>
</html>