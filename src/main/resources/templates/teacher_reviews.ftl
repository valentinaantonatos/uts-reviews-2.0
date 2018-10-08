<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../resources/static/images/eggplant.png"/>
    <title>${teacherReviews[0].teacher.name} Reviews - UTSReviews</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

    <script type = "text/javascript">
        //Flag review code here
        //Needs to change the TINYINT value from 0 to 1
        function flagReview() {
          ${teacherReviews[0]}.setFlagged(1);
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
                <li><a href = "/user_profile">My Profile</a></li>
                <li class="pull-right"><a href="/usr/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="text-center">
    <#if teacherReviews?? && (teacherReviews?size > 0) >
        <h2>Reviews for ${teacherReviews[0].teacher.name}</h2>
    <#else >
        <h2>There are no reviews for ${teacherReviews[0].teacher.name}</h2>
    </#if>
</div>

<table class="table table-bordered">
    <tr>
        <th>User Name</th>
        <th>Review</th>
        <th>Date Time</th>
        <th>Rating</th>
        <th>Comment</th>
        <th>Flag Reviews</th>
    </tr>
    <#list teacherReviews as teacherReview>
        <tr>
            <td>${teacherReview.user.name}</td>
            <td>${teacherReview.text}</td>
            <td>${teacherReview.date}</td>
            <td>${teacherReview.rating}</td>

            <!-- Comment on Reviews -->
            <td>
              <a type = "button" class = "button" href = "/teacher_comments">
                Comment
              </a>
            </td>

            <!-- Flag Reviews -->
            <td>
              <input type = "checkbox" name = "flagged" value = "flagReview"><br>
              <!--<input type = "submit" value = "Submit"><br>-->
              <button class = "btn btn-primary" onClick = "flagReview()">
                Flag
              </button>
            </td>
        </tr>
    </#list>
</table>

</body>
</html>
