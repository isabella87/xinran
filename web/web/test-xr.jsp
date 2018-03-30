<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<!doctype html>
<html>
<head>
<title>TEST</title>
<a:csss />
<a:scripts />
<style type="text/css">
body {
	font-family: "Consolas";
	font-size: 12pt;
	color: #333;
	margin: 0;
	padding: 0;
	border: 0 none;
	overflow: auto;
	background-color: transparent;
}
.input {
	margin: 20px auto;
	background-color: #FFF;
	width: 95%;
}
.input .row {
	zoom: 1;
	margin: 10px 0;
}
.clearfix:after {
	content:".";
	display:block;
	height:0;
	visibility:hidden;
	clear:both;
}
.input label {
	float: left;
	text-align: right;
	width: 20%;
	padding: 4px;
	padding-right: 10px;
}
.input input, .input textarea {
	font-family: "Consolas";
	font-size: 12pt;
	float: left;
	text-align: left;
	padding: 5px;
	width: 75%;
	border: 1px solid #666;
	overflow: hidden;
}
.input textarea {
	height: 200px;
	overflow: auto;
}
.input input.btn {
	font-weight: bold;
	text-align: center;
	margin-left: 2%;
	padding: 5px;
	width: 120px;
	cursor: pointer;
}
.input input.leftBtn {
	margin-left: 20.8%;
}
.dt {
	color: #3333ee;
	width: 95%;
	margin: 30px auto 10px auto;
	padding: 10px 20px;
	display: none;
}
pre {
	font-family: "Courier New";
	font-size: 12pt;
	border: none;
	margin: 10px auto;
	padding: 20px;
	color: #333;
	width: 95%;
	background-color: #FFFFCC;
	display: none;
}
.err {
	color: #ee3333;
}
</style>
</head>
<body>
	<div class="input">
		<div class="row clearfix">
			<label>URL:</label><input id="url" name="url" value="/sample/list?pn=2" />
		</div>
		<div class="row clearfix">
			<label>Content:</label><textarea id="data" name="data" ></textarea>
		</div>
		<div class="row clearfix">
			<input id="get" class="btn leftBtn" type="button" value="Get"  />
			<input id="post" class="btn" type="button" value="Post"  />
			<input id="put" class="btn" type="button" value="Put"  />
			<input id="delete" class="btn" type="button" value="Delete"  />
		</div>
	</div>
	<div id="dt" class="dt"></div>
	<pre id="err" class="err">
	</pre>
	<pre id="cb">
	</pre>
	<script type="text/javascript" >
	'use strict';
	var toJson = function(s) {
		if(!s) {
			return null;
		}
		return JSON.parse(s);
	}
	var success = function(data, status, xhr) {
		$('#dt').html(window.serverTime().toLocaleString()).show();
		// $('#cb').html(Sys.encode(xhr.responseText)).show();
		$('#cb').text(JSON.stringify(data, null, '  ')).show();
	};
	var error = function(ecode, emsg) {
		$('#dt').html(window.serverTime().toLocaleString()).show();
		var es = 'Code: ' + (ecode < 0 ? 'HTTP(' + (-ecode) + ')' : ecode)
			+ '<br/>Message: ' + emsg;
		$('#err').html(es).show();
	};
	$(document).ready(function() {
		$("#get").click(function() {
			$('pre').hide();
			var url = Sys.joinUrl('/xrsrv', $('#url').val());
			var data = toJson($('#data').val());
			Sys.get(url, data, success, error);
		});
		$("#post").click(function() {
			$('pre').hide();
			var url = Sys.joinUrl('/xrsrv', $('#url').val());
			var data = toJson($('#data').val());
			Sys.post(url, data, success, error);
		});
		$("#put").click(function() {
			$('pre').hide();
			var url = Sys.joinUrl('/xrsrv', $('#url').val());
			var data = toJson($('#data').val());
			Sys.put(url, data, success, error);
		});
		$("#delete").click(function() {
			$('pre').hide();
			var url = Sys.joinUrl('/xrsrv', $('#url').val());
			Sys.del(url, success, error);
		});
	});
	</script>
</body>
</html>