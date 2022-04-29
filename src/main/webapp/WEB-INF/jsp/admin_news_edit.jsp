<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑读者信息《 ${readerInfo.readerId}》</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="img/book2.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header" style="padding-bottom: 80px"></div>
<div class="col-xs-6 col-md-offset-3" style="position: relative;">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">编辑通知信息 《 ${news.title}》</h3>
        </div>
        <div class="panel-body">
            <form action="news_edit_do.do?newsid=${news.newsid}" method="post" id="newsedit" >
                <div class="input-group">
                    <span class="input-group-addon">ID</span>
                    <input type="text" class="form-control" name="newsid" id="newsid" value="${news.newsid}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">标题</span>
                    <input type="text" class="form-control" name="title" id="title"  value="${news.title}" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">内容</span>
                    <textarea type="text" style="height: 300px " class="form-control" name="note" id="note"  value="${news.note}" ></textarea>
                </div>
                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
                <script>
                    $("#readeredit").submit(function () {
                        if($("#newsid").val()==''||$("#title").val()==''||$("#note").val()==''){
                            alert("请填入完整读者信息！");
                            return false;
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>
