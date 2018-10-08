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
        //Flag review code here
        //Needs to change the TINYINT value from 0 to 1
        function flagReview() {
          ${subjectReviews[0]}.setFlagged(1);
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
        <th>Date/Time</th>
        <th>Rating</th>
        <th>Difficulty Rating</th>
        <th>Comment</th>
        <th>Flag Review</th>
    </tr>
<#list subjectReviews as subjectReview>
    <tr>
        <td>${subjectReview.user.name}</td>
        <td>${subjectReview.text}</td>
        <td>${subjectReview.mark}</td>
        <td>${subjectReview.date}</td>
        <td>${subjectReview.rating}</td>
        <td>${subjectReview.difficulty}</td>
        <td>
          <!-- Comment on Reviews -->
          <a type = "button" class = "button" href = "/subject_comments">
            Comment
         </a>
       </td>

        <!-- Flag Reviews -->
        <td>
          <input type = "checkbox" name = "flagged" value = "flagReview"><br>
          <!--<input type = "submit" value = "Submit"><br> -->
          <button class = "btn btn-primary" onClick = "flagReview()">
            Flag
          </button>
        </td>
    </tr>
</#list>
</table>

</body>
</html>
