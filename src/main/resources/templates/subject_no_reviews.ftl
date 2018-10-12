<!DOCTYPE html>

<html lang="en">
    <style>
        @import "lesshat";
        @import url(https://fonts.googleapis.com/css?family=Roboto);
        html { 
          background:  url(https://media.giphy.com/media/3o7TKOKvE22430hZNm/giphy.gif) no-repeat center center fixed; 
          background-size: cover;
          font-family: 'Roboto', sans-serif;

        }
        h1{
          font-size: 2em;
          margin: .2em .5em;
          color: aliceblue;
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
        div.error > h2 > a {
            color:aliceblue;
        }
    </style>
    
    <head>
    <meta charset="UTF-8">
    <title>No Subject Reviews</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    </head>
        <div class="error">
            <h1>Sorry, there are currently no reviews for this subject</h1>
            <h2>Return to <a href="/subject/list">Subjects</a> to create a new review</h2>
        </div>
</html>