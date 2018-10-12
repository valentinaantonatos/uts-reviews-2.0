<!DOCTYPE html>
<html lang="en">
    <style>
        @import "lesshat";
        @import url(https://fonts.googleapis.com/css?family=Roboto);
        html { 
          background:  url(https://media.giphy.com/media/d10dMmzqCYqQ0/giphy.gif) no-repeat center center fixed; 
          background-size: cover;
          font-family: 'Roboto', sans-serif;

        }

        h2{
          font-size: 2em;
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
            font-size: 1.8em;
            color:aliceblue;
        }
    </style>
    
    <head>
    <meta charset="UTF-8">
    <title>You Messed Up</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    </head>
        <div class="error">
            <h2 class=link>${message}</h2>
            <a href="/">Try Again</a>
        </div>
</html>
