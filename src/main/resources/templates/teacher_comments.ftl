<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../resources/static/images/eggplant.png"/>
    <title>${subjectReviews[0].subject.title} Reviews - UTSReviews</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

    <script type = "text/javascript">
        //Add comment to a review
        //Use a form
       function addComment() {

       }

    </script>

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
  <!-- Need a list of comments, then change these parameters to teacherComments -->
    <#if teacherReviews?? && (teacherReviews?size > 0) >
        <h2>Comments for ${teacherReviews[0].subject.title}</h2>
    <#else >
        <h2>There are no comments for ${teacherReviews[0].subject.title}</h2>
    </#if>
</div>

<div>
  <p> ${teacherReviews[0].text} </p>
  <button class = "btn btn-primary" onClick = "addComment()">
    Add Comment
  </button>
</div>

<table class="table table-bordered">
    <tr>
        <th>User Name</th>
        <th>Comment</th>
        <th>Date/Time</th>
    </tr>
<#list teacherComments as teacherComments>
    <tr>
        <td>${teacherComments.user.name}</td>
        <td>${teacherComments.text}</td>
        <td>${teacherComments.date}</td>
    </tr>
</#list>
</table>

</body>
</html>
