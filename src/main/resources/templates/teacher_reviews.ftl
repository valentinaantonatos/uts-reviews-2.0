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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <title>${teacherReviews[0].teacher.name} Reviews - UTSReviews</title>

        <style>
            .fa {
                font-size: 40px;
                cursor: pointer;
                user-select: none;
            }

            .fa:hover {
                color: darkblue;
            }
        </style>

        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="/js/bootstrap.min.js"></script>

        <script type = "text/javascript">
            //Flag review code here
            //Needs to change the TINYINT value from 0 to 1
            function flagReview() {
              ${teacherReviews[0]}.setFlagged(1);
            }

        </script>
        
        <!-- Flag Modal -->
        <script>
            function confirmFlag(url){
            if(confirm("Are you sure you want to flag?")){
              window.location.href = url;
            }
                
          }
        </script>

        <!-- Test -->
            <script>
        function myFunction(x) {
//            $('#teacherForm').prop('action','/usr/review/teacher/add');
//
//            $('#teacherId').children().remove();
//            $.ajax(
//                    {
//                        type:'get',
//                        dataType: 'json',
//                        url: '/usr/review/teacher/list',
//                        success: function (result) {
//                            for(var i=0;i<result.length;i++){
//                                $('#teacherId').append('<option value="'+result[i].id+'">'+result[i].name+'</option>');
//                            }
//                            $('#teacherModal').modal();
//                        }
//                    }
//            );
            
            var x = document.getElementById("myDIV");
              if (x.innerHTML === "Unflagged!") {
                x.innerHTML = "Flagged!";
              } 
            
        }
        </script>

    </head>
    <body>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/index"><span class="glyphicon glyphicon-education"></span>Home</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/teacher/list"><span class="glyphicon glyphicon-pencil"></span>Teachers</a></li>
                    <li><a href="/subject/list"><span class="glyphicon glyphicon-book"></span>Subjects</a></li>
                    <li><a href="/usr/views"><span class="glyphicon glyphicon-edit"></span>My Reviews</a></li>
                    <li><a href = "/user_profile"><span class="glyphicon glyphicon-user"></span>My Profile</a></li>
                    <li class="pull-right"><a href="/usr/logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="text-center">
        <#if teacherReviews?? && (teacherReviews?size > 0) >
            <h2>Reviews for ${teacherReviews[0].teacher.name}</h2>
        <#else >
            <h2>There are no reviews for ${teacherReviews[0].teacher.name}</h2>
        </#if>
    </div>

    <table class="table table-bordered">
        <tr>
            <th>User Name</th>
            <th>Review</th>
            <th>Date/Time</th>
            <th>Rating</th>
            <th>Flag Reviews</th>
        </tr>
        <#list teacherReviews as teacherReview>
            <tr>
                <td>${teacherReview.user.name}</td>
                <td>${teacherReview.text}</td>
                <td>${teacherReview.date}</td>
                <td>${teacherReview.overallRating}</td>

                <!-- Flag Reviews -->
                <td>
                  <!--<input type = "checkbox" name = "flagged" value = "flagReview"><br>-->
                  <!--<input type = "submit" value = "Submit"><br>-->
                  <!--<button class = "btn btn-primary" onClick = "flagReview()" > Flag </button>-->
                  <button id="flag" class="fa fa-flag" onClick = "confirmFlag('/teacher/${id}/reviews/flag/${teacherReview.id}')">
                    </button>
                    ${teacherReview.flagged}
                    
                </td>
            </tr>
        </#list>
    </table>

</body>
</html>
