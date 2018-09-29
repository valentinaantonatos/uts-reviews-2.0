<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../resources/static/images/eggplant.png"/>
    <title>Teacher Reviews - UTSReviews</title>

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

<div>
  <button class="btn btn-primary" onclick="addTeacherReview()">
    Create Teacher Review
  </button>
</div>

<table class="table table-bordered">
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Operations</th>
    </tr>
    <#list teachers as teacher>
        <tr>
           <td>${teacher.name}</td>
            <td>${teacher.description}</td>
            <td>
                <a type="button" class="btn btn-sm" href="/teacher/${teacher.id}/reviews" >
                    Check Review
                </a>
            </td>
        </tr>
    </#list>
</table>

</body>
</html>
