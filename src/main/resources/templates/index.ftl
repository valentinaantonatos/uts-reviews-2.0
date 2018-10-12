<!DOCTYPE html>
<html lang="en">
    
    <style>
        .background {
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;   
            }
        .heading {
            float: none; 
            margin: auto;
            text-align: center; 
            display: block; 
            width: auto; 
            height: auto;
        }
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
    
    <title>Home - UTSReviews</title>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body class="background" background="/images/laurel1.jpg">
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
                    <li><a href = "/user_profile"><span class="glyphicon glyphicon-user"></span>My Profile</a></li>
                    <li class="pull-right"><a href="/usr/logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="heading" class="text-center" class="align-middle">
<!--        <h1>Welcome to UTSReviews</h1>-->
<!--        <h2 class="heading">Review UTS Tutors and Subjects</h2>-->
<!--        <h2>Your uni. Your voice.</h2>-->
    </div>
</body>
</html>
