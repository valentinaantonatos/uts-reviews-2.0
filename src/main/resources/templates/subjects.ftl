<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reviews of Subject</title>

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
                <li><a href="/teacher/list">Teachers</a></li>
                <li class="active"><a href="/subject/list">Subjects</a></li>
                <li><a href="/usr/views">My Reviews</a></li>
                <li class="pull-right"><a href="/usr/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<table class="table table-bordered">
    <tr>
        <th>Title</th>
        <th>Course Number</th>
        <th>Description</th>
        <th>Operations</th>
    </tr>
    <#list subjects as subject>
        <tr>
            <td>${subject.title}</td>
            <td>${subject.courseNumber}</td>
            <td>${subject.description}</td>
            <td>
                <a type="button" class="btn btn-sm" href="/subject/${subject.id}/reviews">
                    Check Review
                </a>
            </td>
        </tr>
    </#list>
</table>

</body>
</html>