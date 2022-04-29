<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的借还</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>
    <script type="text/javascript">
        function renderTime(date) {
            var dateee = new Date(date).toJSON();
            return new Date(+new Date(dateee) + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '')
        }
        function x(date23) {
            var date111 = new Date();
            var day = (date111-date23)/(1000*60*60*24);
            return day;
        }
    </script>





</head>
<body background="img/lizhi.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>
<div style="position: relative;top: 10%">
    <c:if test="${!empty succ}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${error}
        </div>
    </c:if>
</div>

<div class="panel panel-default" style="width: 90%;margin-left: 5%;margin-top: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            我的借还日志
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>图书号</th>
                <th>借出日期</th>
                <th>归还日期</th>
                <th>状态</th>
            </tr>
            </thead>
            <tbody id="info">
            <script type="text/javascript">
                $(function () {
                    $.ajax({
                        url:"/library_war_exploded/findLendList.do",
                        type:"get",
                        dataType:"json",
                        success:function (data) {
                            $.each(data,function (i,n) {
                                var text;
                                if (n.backDate != null){
                                    text = "已还"
                                }else if ( x(n.lendDate) > 30 ){
                                    text = "逾期";
                                    alert("你有书籍已经超过30日未归还，请注意！")
                                }else {
                                    text = "未还"
                                }
                                var text2;
                                if (n.backDate == null){
                                    text2 = "暂时未还";
                                }else {
                                    text2 = renderTime(n.backDate);
                                }
                                $("#info").append("<tr>").append("<td>"+n.bookId+"</td>")
                                    .append("<td>"+renderTime(n.lendDate)+"</td>")
                                    .append("<td>"+text2+"</td>")
                                    .append("<td>"+text+"</td>")

                            })
                        }
                    })
                })
            </script>



        </table>
    </div>
</div>

</body>
</html>
