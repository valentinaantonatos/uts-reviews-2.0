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

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Password has been updated.</p>
  </div>

</div>
    
    
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
            x.innerHTML = "New password doesnt match!";
        } else {
            x.innerHTML = "New passwords match!";
            changePassword();
        }
        
    }
</script>
    
<div class="container">
<h1> Hello, ${user.name} </h1>
    <form class="form-horizontal" method="post" name="userForm" action="/user_profile/changepass">
        <div class="form-group">
            <label class="col-sm-2 control-label">Old Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="oldPassword" name="oldPassword" placeholder="Old Password" required>
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
                <#if passwordUpdated>
                    Password has been updated!
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