<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>全部图书信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>
</head>
<body background="img/book213weqwesdfs.jpg"
      style=" background-repeat:no-repeat ;
        background-size:100% 100%;
        background-attachment: fixed;">

<div id="header"></div>

<div style="padding: 20px 550px 10px">
    <form method="post" action="reader_querybook_do.html" class="form-inline" id="searchform">
        <div class="input-group">
            <input type="text" placeholder="输入图书名" class="form-control" id="search" name="searchWord"
                   class="form-control">
            <span class="input-group-btn">
                <input type="submit" value="搜索" class="btn btn-default">
            </span>
        </div>
    </form>
    <script>
        $("#searchform").submit(function () {
            var val = $("#search").val();
            if (val == '') {
                alert("请输入关键字");
                return false;
            }
        })
    </script>
</div>
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
<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
            全部图书
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>ISBN</th>
                <th>价格</th>
                <th>剩余数量</th>
                <th>所属分类</th>
                <th>借还</th>
                <th>详情</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${books}" var="book">
                <tr>
                    <td><c:out value="${book.name}"></c:out></td>
                    <td><c:out value="${book.author}"></c:out></td>
                    <td><c:out value="${book.publish}"></c:out></td>
                    <td><c:out value="${book.isbn}"></c:out></td>
                    <td><c:out value="${book.price}"></c:out></td>
                    <td><c:out value="${book.number}"></c:out></td>

                    <c:if test="${book.classId == 1}">
                        <td><c:out value="马克思主义"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 2}">
                        <td><c:out value="哲学"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 3}">
                        <td><c:out value="社会科学总论"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 4}">
                        <td><c:out value="政治法律"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 5}">
                        <td><c:out value="军事"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 6}">
                        <td><c:out value="经济"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 7}">
                        <td><c:out value="文化"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 8}">
                        <td><c:out value="语言"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 9}">
                        <td><c:out value="文学"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 10}">
                        <td><c:out value="艺术"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 11}">
                        <td><c:out value="历史地理"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 12}">
                        <td><c:out value="自然科学总论"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 13}">
                        <td><c:out value="数理科学和化学"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 14}">
                        <td><c:out value="天文学"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 15}">
                        <td><c:out value="生物科学"></c:out></td>
                    </c:if>

                    <c:if test="${book.classId == 16}">
                        <td><c:out value="医药卫生"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 17}">
                        <td><c:out value="农林科学"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 18}">
                        <td><c:out value="工业技术"></c:out></td>
                    </c:if>
                    <c:if test="${book.classId == 19}">
                        <td><c:out value="交通运输"></c:out></td>
                    </c:if>
<%--                    <td><c:out value="${book.classId}"></c:out></td>--%>

                    <c:set var="flag" value="false"/>
                    <c:forEach var="lend" items="${myLendList}">
                        <c:if test="${lend eq book.bookId}">
                            <c:set var="flag" value="true"/>
                        </c:if>
                    </c:forEach>
                    <c:if test="${flag}">
                        <td><a href="returnbook.html?bookId=<c:out value="${book.bookId}"></c:out>">
                            <button type="button" class="btn btn-danger btn-xs">归还</button>
                        </a></td>
                    </c:if>
                    <c:if test="${not flag}">
                        <c:if test="${book.number>0}">
                            <td><a href="lendbook.html?bookId=<c:out value="${book.bookId}"></c:out>">
                                <button type="button" class="btn btn-primary btn-xs">借阅</button>
                            </a></td>
                        </c:if>
                        <c:if test="${book.number==0}">
                            <td>
                                <button type="button" class="btn btn-defalut btn-xs" disabled="disabled">已空</button>
                            </td>
                        </c:if>
                    </c:if>
                    <td><a href="reader_book_detail.html?bookId=<c:out value="${book.bookId}"></c:out>">
                        <button type="button" class="btn btn-success btn-xs">详情</button>
                    </a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
