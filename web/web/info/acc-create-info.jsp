<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<%@include file="../inc/common.jsp" %>

<style type="text/css">
        div.editor_infobox{
            width:80%;
        }
</style>

<body>
<%@include file="../inc/head-page.jsp" %>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/> 
    <script type="text/javascript" charset="utf-8" src="../web/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../web/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../web/lang/zh-cn/zh-cn.js"></script>


    
<div class="ban_content ban_accountinfo">
  <div class="ban_path">
    <div class="ban_wrapper">
      <div class="ban_path_in"><a href="/xinran/index.html" class="ban_path_home"></a>&gt;<a href="#" class="ban_path_a">账户中心</a>&gt;<a href="#" class="ban_path_a">石玖信息账户信息</a></div>
    </div>
  </div>
  <div class="ban_wrapper">
    <div class="ban_account"> 
      <%@include file="../account/account-left.jsp" %>
      <div class="ban_account_content">
        <div class="ban_account_content_w">
          <h2 class="ban_page_title">创建公告信息 </h2>
          
			<div class="ban_content_in">
				
					<form  name="infoForm" method="put" action="">
					<div class="ban_infobox_w">
					
						<div class="ban_infobox">
							<label for="textfield1" class="ban_infobox_label">公告标题</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="text" name="noticeTitle" 
										class="ban_infobox_input _required _length" min="1" max="30"  placeholder="必填" />
								</div>
							</div>
						</div>
						
						<div class="ban_infobox">
							<label for="textfield3" class="ban_infobox_label">公告类型</label>
							<div class="ban_infobox_inputbox">
								<select class="ban_infobox_select" name="noticeType">
									<option selected="selected" value="">请选择</option>
						            <option value="维修资讯">维修资讯</option>
						            <option value="常见故障">常见故障</option>
						            <option value="维护保养">维护保养</option>
						            <option value="电脑问题">电脑问题</option>
						            <option value="答用户问">答用户问</option>
								</select>
							</div>
						</div>
						
						<div class="ban_infobox">
								<label for="textfield1" class="ban_infobox_label">服务描述</label>
								<div class="ban_infobox_inputbox">
									<div class="ban_infobox_input_w">
										<textarea name="notice-abstract-content" cols="" rows="" class="ban_infobox_textarea _length" min="1" max="800"
											placeholder="400字以内"></textarea>
									</div>
								</div>
								<div class="ban_infobox_u"></div>
								<div class="ban_infobox_cue" style="display: none;"></div>
							</div>
							
						<div class="ban_infobox">
							<label for="textfield1" class="ban_infobox_label">公告关键字</label>
							<div class="ban_infobox_inputbox">
								<div class="ban_infobox_input_w">
									<input type="text" name="notice-key" 
										class="ban_infobox_input _required _length" min="1" max="30"  placeholder="必填" />
								</div>
							</div>
						</div>
					
						<div class="editor_infobox">
							<label for="textfield" class="ban_infobox_label">公告信息内容</label>
							<br/>
							<br/>
							<!-- <h1>公告信息内容</h1> -->
							<script id="editor" type="text/plain" style="width:750px;height:500px;"></script>
						</div>
						
						<div class="ban_infobox_bottom">
							<input name="" type="button" class="ban_button_hilite nextBtn" value="创建公告信息" />
						</div>
					</div>
				</form>
			</div>

			
			
		    <div class="ban_content_in" style="display: none;">
		      <form  name="infoForm1" method="post" action="">
		        <div class="ban_infobox_w">
			        <div class="ban_result_succeed">
			              <div class="ban_result_t"><div class="ban_result_depict">信息以创建!</div>
			              <p class="ban_result_additional">初审通过后，客服将将尽快安排上线！</p>
			              </div>
			            </div>
		         
			          <div class="ban_infobox_bottom">
			            <input name="" type="button" class="ban_button_hilite" value="很好，再来传一个！" onclick="window.location.href=Sys.evalUrl('/info/acc-create-info.html')" />
			          </div>
		        </div>
		        </form>
		      </div>
		    
		</div>
        </div>
        
      </div>
    </div>
  </div>

<%@include file="../inc/foot-page.jsp" %>

<script type="text/javascript">

var PageTitle = "发布产品";
var fid = null;
var index ; 

var valCfg = {boxClass:'ban_infobox',eBoxClass:'ban_infobox_cue',errMsg:'<span class="ban_infobox_cue_warn">#[msg]</span>'};
$(function(){
	$('.nextBtn').on('click',submitService);
});

var CmNoticeDetailInfo = {};
Sys.service.on('CreateCmNoticeService',function(data){
	if(data){
		if(!fid && !isNaN(data)) fid = data;
		goStep(1);
	}
},false);


////////////////////////////////////////
//All private functions
////////////////////////////////////////

function submitService(){
	
	var form = $(this).parents('form');
	var formName = form.attr('name');
	index = formName.substring("infoForm".length);
	index = parseInt(index);
	var params =form.serializeObject();
	var noticeContent;
	var url = form.attr('action');
	noticeContent = UE.getEditor('editor').getContent();
	
	if(form.validateForm(valCfg)){
		if(params.noticeTitle ==null){
			alert("请输入公告标题！");
		}else if(params.noticeType==null){
			alert("请输入公告类型！");
		}else  if(noticeContent==null){
			alert("请输入公告内容！");
		}else{
			params.noticeContent = noticeContent;
			$.extend(CmNoticeDetailInfo, {m:form.attr('method'), u:url, p : params});
			
			Sys.service.load('CreateCmNoticeService',{},true);
		}	
	}
}

/**
 * 跳转到指定步骤  params 步骤序号（1-4） 
 */
function goStep(s){

	s = s < 1 ? 1 : s > 1 ? 1 : s;
	
	var form = $('form[name="infoForm'+s+'"]');
	var div = form.parents('.ban_content_in');
	div.siblings().hide();
	div.show();
	
	if(s === 1){
		$('.showInFirst').show();
		$('#ban_content_id').css({'padding-top':'150px'});
		
	}else{
		$('.showInFirst').hide();
		$('#ban_content_id').css({'padding-top':'0px'});
	}
	$('input',div).first().focus();
}


//实例化编辑器
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
var ue = UE.getEditor('editor');


function isFocus(e){
    alert(UE.getEditor('editor').isFocus());
    UE.dom.domUtils.preventDefault(e)
}
function setblur(e){
    UE.getEditor('editor').blur();
    UE.dom.domUtils.preventDefault(e)
}
function insertHtml() {
    var value = prompt('插入html代码', '');
    UE.getEditor('editor').execCommand('insertHtml', value)
}
function createEditor() {
    enableBtn();
    UE.getEditor('editor');
}
function getAllHtml() {
    alert(UE.getEditor('editor').getAllHtml())
}
function getContent() {
    var arr = [];
    arr.push("使用editor.getContent()方法可以获得编辑器的内容");
    arr.push("内容为：");
    arr.push(UE.getEditor('editor').getContent());
    alert(arr.join("\n"));
}
function getPlainTxt() {
    var arr = [];
    arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
    arr.push("内容为：");
    arr.push(UE.getEditor('editor').getPlainTxt());
    alert(arr.join('\n'))
}
function setContent(isAppendTo) {
    var arr = [];
    arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
    UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
    alert(arr.join("\n"));
}
function setDisabled() {
    UE.getEditor('editor').setDisabled('fullscreen');
    disableBtn("enable");
}

function setEnabled() {
    UE.getEditor('editor').setEnabled();
    enableBtn();
}

function getText() {
    //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
    var range = UE.getEditor('editor').selection.getRange();
    range.select();
    var txt = UE.getEditor('editor').selection.getText();
    alert(txt)
}

function getContentTxt() {
    var arr = [];
    arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
    arr.push("编辑器的纯文本内容为：");
    arr.push(UE.getEditor('editor').getContentTxt());
    alert(arr.join("\n"));
}
function hasContent() {
    var arr = [];
    arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
    arr.push("判断结果为：");
    arr.push(UE.getEditor('editor').hasContents());
    alert(arr.join("\n"));
}
function setFocus() {
    UE.getEditor('editor').focus();
}
function deleteEditor() {
    disableBtn();
    UE.getEditor('editor').destroy();
}
function disableBtn(str) {
    var div = document.getElementById('btns');
    var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
    for (var i = 0, btn; btn = btns[i++];) {
        if (btn.id == str) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        } else {
            btn.setAttribute("disabled", "true");
        }
    }
}
function enableBtn() {
    var div = document.getElementById('btns');
    var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
    for (var i = 0, btn; btn = btns[i++];) {
        UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
    }
}

function getLocalData () {
    alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
}

function clearLocalData () {
    UE.getEditor('editor').execCommand( "clearlocaldata" );
    alert("已清空草稿箱")
}
</script>
</body>
</html>