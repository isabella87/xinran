<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<body>

<%@include file="../inc/head-page.jsp" %>


<div class="ban_content ban_accountinfo">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">账户中心</a>
     &gt;<a href="#" class="ban_path_a">石玖账户信息</a>&gt;<a href="#" class="ban_path_a">查看机构信息</a></div>
    </div>
  </div>
  <div class="ban_wrapper">
    <div class="ban_account"> 
      <%@include file="../account/account-left.jsp" %>

      <div class="ban_account_content">
        <div class="ban_account_content_w">
          <h2 class="ban_page_title">机构信息</h2>
          
          <div class="ban_infobox_w" id="orgInfoDiv">
          
          <div class="ban_page_accountinfo">
          
            <div class="ban_infobox">
              <label for="textfield" class="ban_infobox_label">法人姓名</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_show" id="lawNameDiv">
                  
                </div>
              </div>
            </div>
          
            <%-- <div class="ban_infobox">
              <label for="textfield" class="ban_infobox_label">法人身份证号</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_show" id="lawIdCardDiv">
                </div>
              </div>
              <div class="ban_infobox_u"></div>
              <div class="ban_infobox_tool"><a href="账户-修改手机.shtm" class="ban_button_check">查看图片</a></div>
            </div> --%>
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">机构名称</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_show" id="orgNameDiv">
                </div>
              </div>
              <div class="ban_infobox_u"></div>
              <div class="ban_infobox_tool"></div>
            </div>
            
             <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">组织机构代码证号</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_show" id="orgCodeNoDiv">
                </div>
              </div>
              <div class="ban_infobox_u"></div>
              <div class="ban_infobox_tool"><a href="#" class="ban_button_check">查看图片</a></div>
            </div>
            
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">银行账户户名</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_show" id="accUserNameDiv">
                </div>
              </div>
              <div class="ban_infobox_u"></div>
            </div>
            
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">银行账户号</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_show" id="accountDiv">
                </div>
              </div>
              <div class="ban_infobox_u"></div>
              <div class="ban_infobox_tool"><a href="#" class="ban_button_check">查看图片</a></div>
            </div>
            
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">银行账户开户行</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_show" id="accBankDiv">
                </div>
              </div>
              <div class="ban_infobox_u"></div>
              
            </div>
            
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">营业执照号</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_show" id="bussLicDiv">
                </div>
              </div>
              <div class="ban_infobox_u"></div>
              <div class="ban_infobox_tool"><a href="账户-修改手机.shtm" class="ban_button_check">查看图片</a></div>
              
            </div>
            
            <div class="ban_infobox">
              <label for="textfield2" class="ban_infobox_label">税务登记证号</label>
              <div class="ban_infobox_inputbox">
                <div class="ban_infobox_show" id="taxLicDiv">
                </div>
              </div>
              <div class="ban_infobox_u"></div>
              <div class="ban_infobox_tool"><a href="#" class="ban_button_check">查看图片</a></div>
            </div>
            
          <div class="ban_infobox_gap"></div>
          
          </div>
<div class="ban_infobox_bottom">
            <input name="" type="button" class="  ban_button_check" value="返回" onclick="history.back();" />
          </div>
          </div>
          
          
        </div>
        
      </div>
    </div>
  </div>
</div>

<%@include file="../inc/foot-page.jsp" %>

<script type="text/javascript">

$(function(){
	
	$('.ban_infobox_tool').hide();
});

Sys.service.on('AccInfo',function(data){
	if(data){
		loadRecord(data);
	}
});

function loadRecord(data){
	
	$('#orgInfoDiv div[id$="Div"]').each(function(){
		var id = $(this).attr('id');
		id = id.substring(0,id.length-3);
		$(this).html(Sys.encode(data[id]));
	});
}
</script>
</body>
</html>