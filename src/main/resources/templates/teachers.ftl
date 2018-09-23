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