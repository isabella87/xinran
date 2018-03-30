<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://web.armory.xx.org"%>
<!doctype html>
<html>
<head>
<title></title>
<a:csss />
<a:scripts />
<style type="text/css">
    body {
        background-color: #ffffff;
    }
    .row {
        height: 40px;
    }
    .row * {
        float: left;
        margin-right: 10px;
    }
    .st {
        font-weight: bold;
    }
    .clear {
        clear: both;
    }
</style>
</head>
<body>
    <%final String aurl = "/midsrv";%>
    <h1>This is a sample page</h1>
    <p>A paragraph of sample1
    <a:img id="i1" cssClass="aa" src="bht.png" title="A image" />
    <a:a id="a1" cssClass="bb" href="test/t1.html" title="A sample link" >A link</a:a>
    <a:a id="a2" href="javascript:void 0" >Add new item</a:a>
    </p>
    <img id="tt1" />
    <div id="commandbar">
    <a id="cm1" href="javascript:void 0;" >Tab1</a>&nsbp;
    <a id="cm2" href="javascript:void 0;" >Tab2</a>&nsbp;
    <div id="list" >
    </div>
    <div id="pager" class="pager" >
    </div>
    <script type="text/javascript">
        'use strict';
        $(document).ready(function() {
            document.getElementById('tt1').src = '<%=aurl%>/files/' + 17 + '/' + 'ndx4bD';
            document.getElementById('a2').onclick = function() {
                Sys.put(
                    '<%=aurl%>/sample',
                    { title: 'abc' + (window.serverTime()).toString(),  price : '255.35' },
                    function(data) {
                        console.log('Add: ' + data);
                        window.location.reload();
                    }
                );
            };
            document.getElementById('cm1').onclick = function() {
                var data = [
                    ['cm', 'cm1'],
                    ['title', 'tttssss']
                ];
                location.assign(Sys.buildQString(data));
            };
            document.getElementById('cm2').onclick = function() {
                var data = [
                    ['cm', 'cm2'],
                    ['title', 'sssssttt']
                ];
                location.assign(Sys.buildQString(data));
            };
            Sys.get(
                '<%=aurl%>/sample/list',
                {
                title: Sys.getParam('title'),
                cm: Sys.getParam('cm'),
                pn: Sys.getPage()
                },
                function(data) {
                    console.log(data);
                    Sys.bind(document.getElementById('list'), data.items,
                        function(cnt, item, index) {
                            var row = document.createElement('div');
                            row.className = 'row';

                            var title1 = document.createElement('div');
                            title1.className = 'st';
                            // title1.innerHTML = item.title;
                            title1.innerHTML = Sys.encode(item.title);

                            var img1 = document.createElement('img');
                            img1.src = Sys.evalImageUrl('/sample' + (item.picId + 1) + '.png');

                            var dp1 = document.createElement('div');
                            // dp1.innerHTML = Sys.encode(item.datepoint);
                            dp1.innerHTML = Sys.formatDate(item.datepoint, 'yyyy年M月d日');

                            var price1 = document.createElement('div');
                            // price1.innerHTML = item.price;
                            price1.innerHTML = Sys.encode(Sys.formatNumber(item.price, true, 2));

                            row.appendChild(title1);
                            row.appendChild(img1);
                            row.appendChild(dp1);
                            row.appendChild(price1);

                            cnt.appendChild(row)

                            var sep = document.createElement('div');
                            sep.className = 'clear';
                            cnt.appendChild(sep);
                        });

                    Sys.createPage(document.getElementById('pager'), data.pc);
                });
        })
    </script>
</body>
</html>