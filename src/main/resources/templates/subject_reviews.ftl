<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../resources/static/images/eggplant.png"/>
    <title>${subjectReviews[0].subject.title} Reviews - UTSReviews</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/index">Home</a>
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
    <#if subjectReviews?? && (subjectReviews?size > 0) >
        <h2>Reviews for ${subjectReviews[0].subject.title}</h2>
    <#else >
        <h2>There are no reviews for ${subjectReviews[0].subject.title}</h2>
    </#if>
</div>

<table class="table table-bordered">
    <tr>
        <th>User Name</th>
        <th>Review</th>
        <th>Subject Mark</th>
        <th>Subject Difficulty</th>
        <th>Subject Rating</th>
        <th>Date/Time</th>
    </tr>
<#list subjectReviews as subjectReview>
    <tr>
        <td>${subjectReview.user.name}</td>
        <td>${subjectReview.text}</td>
        <td>${subjectReview.mark}</td>
        <td>${subjectReview.difficulty}</td>
        <td>${subjectReview.rating}</td>
        <td>${subjectReview.date}</td>
    </tr>
</#list>
</table>

</body>
</html>
