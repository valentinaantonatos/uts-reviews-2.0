<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
</head>
<body>
<header class="page-header text-center">
    <h1>User Register</h1>
</header>
<div class="container">
    <form class="form-horizontal" method="post" action="/usr/register">

        <div class="form-group">
            <label class="col-sm-2 control-label">Real name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="name" placeholder="Real name">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">Username</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="username" placeholder="Username">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" name="password" placeholder="Password">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-10">
                <button class="btn btn-primary" type="submit">Register</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>