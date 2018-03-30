<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>
<body>
<%@include file="../inc/head-page.jsp" %>

<div class="ban_content">
 <div class="ban_path">
    <div class="ban_wrapper">
   	   <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a:a href="javascript:void(0);" cssClass="ban_path_a">借款项目</a:a>&gt;<a href="javascript:void(0);" class="ban_path_a">确认出借</a></div>
    </div>
 </div>
 <div class="ban_wrapper">
    <div class="ban_content_in">
        <ul class="ban_confirm_sum">
          <li class="ban_confirm_sum_li">
	          <span class="ban_confirm_sum_pay">本次出借金额</span><span class="ban_confirm_sum_pay_c" id="payAmt"></span><span class="ban_confirm_sum_pay_u">元</span>
	          <span>&nbsp;&nbsp;</span><span><input name="" type="button" class="ban_button_hilite ban_confirm_order_b submitBtn" value="确认出借" /></span>
          </li>
        </ul>
    </div>
    <div class="ban_content_text">
      <h2 class="ban_content_t">温馨提示</h2>
      <div class="ban_content_text_indent">
       <p>1.&nbsp;&nbsp;您的出借将通过江西银行页面进行确认；<br />
        2.&nbsp;&nbsp;确认出借成功之后，您在江西银行电子账户中的出借金额将会被冻结； <br />
        3.&nbsp;&nbsp;您在江西银行电子账户中已被冻结的出借金额将不允许提现和再次出借； <br />
        4.&nbsp;&nbsp;您的出借项目在满标复评通过之后，您在江西银行电子账户中的冻结金额会被放款至借款人在江西银行电子账户中； <br />
        5.&nbsp;&nbsp;只有在所出借项目流标后，您在江西银行电子账户中冻结资金才会被解冻； <br />
        6.&nbsp;&nbsp;禁止洗钱、虚假交易等行为，一经发现并确认，将终止该账户的使用； <br />
        7.&nbsp;&nbsp;如果出借成功但出借金额没有及时冻结，请联系客服，400 851 1888； <br />
        8.&nbsp;&nbsp; 如果您出借不成功，推荐使用IE10或者更高版本的浏览器进行出借！</p></div>
    </div>
  </div>
</div>

<form id="jxpayForm" method="POST" action="" target="_self">
</form>

<%@include file="../inc/foot-page.jsp" %>

<script type="text/javascript">
'use stricts';
var pId = <%=request.getParameter("pId")%>;
var amt = <%=request.getParameter("amt")%>;

if(!pId || !amt){
	Sys.errorDlg('参数错误！',null,function(){
		window.open("about:blank","_top").close();
	});
}else{
	$("#payAmt").html(Sys.formatNumber(amt,true,0));
}

var tsTender = {"p-id" : pId, amt : amt};
Sys.service.on('TenderService',function(data,eCode,eMsg){
	if (data) {
		//将jx返回的form拼接后提交
		submitJXForm('jxpayForm', data);
	}else{
		//处理错误日志
		if(eCode === 7){
			Sys.errorDlg(eMsg,null,function(){ window.self.location.assign(Sys.evalUrl('/account/apply-jxpay-info.html')); });
		}else if(eCode === 21){
			Sys.errorDlg(eMsg,null,function(){ window.self.location.assign(Sys.evalUrl('/account/recharge.html')); });
		}else if(eCode === 8){
			Sys.errorDlg(eMsg,null,function(){ window.self.location.assign(Sys.evalUrl('/account/jxpay-password.html')); });
		}else{
			Sys.errorDlg(eMsg);
		}
	}
	
	return true;

},false);

$(function(){
	$(".submitBtn").on("click",sureToPay);
});

function sureToPay(){
	Sys.service.load("TenderService",{},true);
}

</script>
</body>

</html>