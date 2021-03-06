<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../resources/static/images/eggplant.png"/>
    <title>Register - UTSReviews</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
</head>
<body>
<header class="page-header text-center">
    <h1>Register an Account</h1>
</header>
<div class="container">
    <form class="form-horizontal" method="post" action="/usr/register">

        <div class="form-group">
            <label class="col-sm-2 control-label">Real name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="name" placeholder="Full name" maxlength="44" required>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">Username</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="username" placeholder="Username" maxlength="44" required>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" name="password" placeholder="Password" maxlength="44" required>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-10">
                <button class="btn btn-primary" type="submit">Register</button>
                <br>
                <br><a href="/">Return to Login</a>
            </div>

        </div>
    </form>
</div>
</body>
</html>
