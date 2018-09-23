<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reviews of Teacher</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/index">UTS</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="/teacher/list">Teachers</a></li>
                <li><a href="/subject/list">Subjects</a></li>
                <li><a href="/usr/views">My Reviews</a></li>
                <li class="pull-right"><a href="/usr/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="text-center">
    <#if teacherReviews?? && (teacherReviews?size > 0) >
        <h2>Reviews Of Teacher ${teacherReviews[0].teacher.name}</h2>
    <#else >
        <h2>There has no reviews</h2>
    </#if>
</div>

<table class="table table-bordered">
    <tr>
        <th>User Name</th>
        <th>Review</th>
        <th>Date Time</th>
    </tr>
    <#list teacherReviews as teacherReview>
        <tr>
            <td>${teacherReview.user.name}</td>
            <td>${teacherReview.text}</td>
            <td>${teacherReview.date}</td>
        </tr>
    </#list>
</table>

</body>
</html>