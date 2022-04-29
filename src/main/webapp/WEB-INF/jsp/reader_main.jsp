<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${readercard.name}的主页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>

    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>





</head>
<body background="img/wallhaven-g7jg63.png" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>



<div class="panel-heading">
    <h5 class="panel-title" style="font-family: 华文琥珀; color: #ac2925;font-size: 250%">
        图书馆最新通知
    </h5>
</div>
<div id="note">
        <div class="panel-body">
        <table style="font-family: 华文宋体; font-size: 140%; color: white" class="table table-hover">
            <thead>
            <tr>
                <td style="width: 25%;">标题</td>
                <td>内容</td>
            </tr>
            <tr>
                <td>&nbsp</td>
                <td>&nbsp</td>
            </tr>
            </thead>
            <tbody id="info" >
                <script type="text/javascript">
                    $(function () {

                                $.ajax({
                                    url:"/library_war_exploded/findAllNews.do",
                                    type:"get",
                                    dataType:"json",
                                    success:function (data) {
                                        $.each(data,function (i,n) {
                                            $("#info").append("<tr>").append("<td>"+n.title+"</td>").append("<td>"+n.note+"</td>")
                                            $("#info").append("<tr>").append("<td>"+"&nbsp"+"</td>")
                                                .append("<td>"+"&nbsp"+"</td>")
                                        })
                                    }
                                })
                    })
                </script>
            </tbody>
        </table>
        </div>
</div>
</body>
</html>
