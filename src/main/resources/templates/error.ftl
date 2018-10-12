<!DOCTYPE html>
<html lang="en">
    <style>
        @import "lesshat";
        @import url(https://fonts.googleapis.com/css?family=Roboto);
        html { 
          background:  url(http://www.reactiongifs.com/wp-content/uploads/2013/09/angry-dwight.gif) no-repeat center center fixed; 
          background-size: cover;
          font-family: 'Roboto', sans-serif;

        }
        h1{
          font-size: 16em;
          margin: .2em .5em;
          color: rgba(255,255,255, 0.7);
          margin-bottom:0px;
        }
        h2{
          font-size: 1.7em;
          margin: .2em .5em;
          color: aliceblue;
            .material-icons {
                font-size: 1.5em;
                position: relative;
                top: 10px;
            }
        }
        div.error{
          position:absolute;
          top:30%;
          margin-top:-8em;
          width:100%;
          text-align:center;
        }
        div.error > a {
            color:aliceblue;
        }
    </style>
    
    <head>
    <meta charset="UTF-8">
    <title>Page Not Found</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    </head>
        <div class="error">
            <h1>404</h1>
            <h2>The page you are trying to access does not exist!</h2>
            <a href="javascript:history.back()">Go Back</a>
        </div>
</html>