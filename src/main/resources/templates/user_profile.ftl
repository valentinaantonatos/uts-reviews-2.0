<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../resources/static/images/eggplant.png"/>
    <title>My Profile - UTSReviews</title>

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
                <li><a href="/teacher/list">Teachers</a></li>
                <li><a href="/subject/list">Subjects</a></li>
                <li><a href="/usr/views">My Reviews</a></li>
                <li class = "active"><a href = "/user_profile">My Profile</a></li>
                <li class="pull-right"><a href="/usr/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
    
<script type="text/javascript">
    function changePassword() {
        window.location.href='/user_profile';
    }
</script>
    
<div class="container">
    <form class="form-horizontal" method="post" action="/user_profile">
        <div class="form-group">
            <label class="col-sm-2 control-label">Old Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" name="oldPassword" placeholder="Old Password" required>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">New Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" name="newPassword" placeholder="New Password" required>
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label">Confirm New Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" name="confirmPassword" placeholder="New Password" required>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-10">
                <button class="btn btn-success" onclick="changePassword()" type="button">Submit</button>
<!--                <button class="btn btn-primary" type="submit">Login</button>-->
            </div>
        </div>
        <div id="profileFeedback" >Enter your old and new password!</div>
    </form>
</div>

</body>
</html>