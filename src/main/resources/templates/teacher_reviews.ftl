    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="../resources/static/images/eggplant.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            function confirmFlag(){
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
                <a class="navbar-brand" href="/index">Home</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/teacher/list">Teachers</a></li>
                    <li><a href="/subject/list">Subjects</a></li>
                    <li><a href="/usr/views">My Reviews</a></li>
                    <li><a href = "/user_profile">My Profile</a></li>
                    <li class="pull-right"><a href="/usr/logout">Logout</a></li>
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
                  <button id="flag" class="fa fa-flag" onClick = "confirmFlag()" >
                    </button>
                        <div id="myDIV">Unflagged!</div>
                    
                </td>
            </tr>
        </#list>
    </table>
        
    
<!-- Test Code below -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="teacherModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="teacherModalLabel">Teacher Review</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="post" id="teacherForm" name="teacherForm">
                  <!--Select teacher to review-->
                    <div class="form-group">
                        <label for="teacherId">Teacher</label>
                        <select name="teacherId" id="teacherId" class="form-control">

                        </select>
                    </div>

                     <!-- Attempt for Rating-->
                      <div class="form-group">
                        <label for="teacherRatingId">Rating</label>
                        <select name="teacherRating" id="teacherRating" class="form-control">
                          <option value="1" selected="selected">1 Worst</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5 Best</option>
                        </select>
                      </div>

                    <!--Add review content-->
                    <div class="form-group">
                        <label for="text">Content</label>
                        <textarea name="text" id="teacherText" rows="10" class="form-control"></textarea>
                    </div>

                    <input type="hidden" name="id" id="teacherReviewId">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="teacherForm">Submit</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
