<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../../inc/common.jsp"%>
<style>

</style>
<body style="background-color:#fff">
    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="ban_jiangxi_search_table" style="background-color:#fff">
       	  
	</table>
	<script type="text/javascript">
		var bankId = Sys.getParam('bankId');
		var bankCardInfo = Sys.getBankCardInfo(bankId);
		if(bankCardInfo){
			var html = new Array();

			html.push('	 <tr><th colspan="3" align="center"><em>'+ bankCardInfo.bank +'银行网银限额</em></th></tr>  ');
			html.push('  <tr bgcolor="#eaeaea">  ');
			html.push('    	<th>开通网银类型</th>     ');
			html.push('     <th>单笔限额（元）</th> ');
			html.push('     <th>日累计限额（元）</th>  ');
			html.push('  </tr> ');
			
			$.each(bankCardInfo.info,function(i,data){
				html.push('	 <tr>   ');
				html.push('    	<td>'+ data.type +'</td>  ');
				html.push('     <td>'+ data.single +'</td>   ');
				html.push('     <td>'+ data.oneDay +'</td>  ');
				html.push('  </tr> ');
			});
			
			html.push('  <tr>  ');
			html.push('   <td colspan="3">温馨提示：网银及线上充值限额取决于本人的银行卡设置，若在设置的网上支付额度低于以上限额，以银行设置的为准，'+ bankCardInfo.bank +'银行服务热线：'+ bankCardInfo.num);
			if(bankCardInfo.id === 'bank-zs'){
				html.push('    </br></br><span>请注意：不支持在线充值，仅支持提现</span>');
			}
			html.push('    </td>');
			html.push('  </tr> ');

			$(".ban_jiangxi_search_table").html(html.join(''));
		}
		
	</script>
</body>

