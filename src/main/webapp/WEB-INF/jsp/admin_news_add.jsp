<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加通知</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body background="img/school.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

<div id="header"></div>
<div class="col-xs-6 col-md-offset-3" style="padding-top: 100px;position: relative">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">添加一个新的通知</h3>
        </div>
        <div class="panel-body">
            <form action="news_add_do.do" method="post" id="newsedit" >



                <div class="input-group" style="padding-top: 20px;">
                    <span class="input-group-addon">标题</span>
                    <input type="text" class="form-control" name="title" id="title"  >
                </div>
                <div class="input-group" style="padding-top: 20px;">
                    <span  class="input-group-addon">内容</span>
                    <textarea type="text" style="height: 300px" class="form-control" name="note" id="note" ></textarea>
                </div>


                <input style="align-items: center" type="submit" value="添加" class="btn btn-success btn-sm"
                       class="text-left">
                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#readeredit").submit(function () {
                        if($("#title").val()==''||$("#note").val()=='' ){
                            alert("请填入完整读者信息！");
                            return mySubmit(false);
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>
