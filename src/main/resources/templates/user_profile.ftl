<!DOCTYPE html>
<html lang="en">
<style>
    .navbar-header > a > span{
    padding: 5px;
    }
    .navbar-nav > li > a > span{
    padding: 5px;
    }
</style>
    
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../resources/static/images/eggplant.png"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <title>My Profile - UTSReviews</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/index"><span class="glyphicon glyphicon-education"></span>Home</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="/teacher/list"><span class="glyphicon glyphicon-pencil"></span>Teachers</a></li>
                <li><a href="/subject/list"><span class="glyphicon glyphicon-book"></span>Subjects</a></li>
                <li><a href="/usr/views"><span class="glyphicon glyphicon-edit"></span>My Reviews</a></li>
                <li class = "active"><a href = "/user_profile"><span class="glyphicon glyphicon-user"></span>My Profile</a></li>
                <li class="pull-right"><a href="/usr/logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Password has been updated.</p>
  </div>

</div>
    
    
<!--
<script>

var modal = document.getElementById('myModal');
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];

btn.onclick = function() {
    modal.style.display = "block";
}

span.onclick = function() {
    modal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
    
<script type="text/javascript">
    function changePassword() {
        window.location.href='/user_profile/changepass';
    }
</script>
    
<script type="text/javascript">
    function resetPassword(){
       var x = document.getElementById("message");
        if (document.getElementById('newPassword').value != document.getElementById('confirmPassword').value) {
            x.innerHTML = "New password doesn't match!";
        } else {
            x.innerHTML = "New passwords match!";
            changePassword();
        }
        
    }
</script>
-->
    
<div class="container">
<h1> Hello, ${user.name} </h1>
<h3>You can update your password below:</h3>
    <form class="form-horizontal" method="post" name="userForm" action="/user_profile/changepass">
        <div class="form-group">
            <label class="col-sm-2 control-label">Old Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="oldPassword" name="oldPassword" placeholder="Old Password" required>
                <#if passwordUpdateRequested>
                    ${error}                   
                </#if>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">New Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New Password" required>
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-2 control-label">Confirm New Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="New Password" required>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-10">
                <button id="myBtn" class="btn btn-success" type="submit" >Submit</button>
                <#if passwordUpdateRequested>
                    <#if passwordUpdateSuccess>
                        Password has been updated!
                    </#if>
                </#if>
            </div>
<!--
            <div id="message" name="message" >Enter your old and new password!
            </div>
-->
        </div>
    </form>
</div>

</body>
</html>