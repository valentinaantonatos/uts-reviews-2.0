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
    
    <title>Subject Reviews - UTSReviews</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

    <script type = "text/javascript">

    function addSubjectReview() {
            $('#subjectForm').prop('action','/usr/review/subject/add');

            $('#subjectId').children().remove();
            $.ajax(
                    {
                        type:'get',
                        dataType: 'json',
                        url: '/usr/review/subject/list',
                        success: function (result) {
                            for(var i=0;i<result.length;i++){
                                $('#subjectId').append('<option value="'+result[i].id+'">'+result[i].title+'</option>');
                            }
                            $('#subjectModal').modal();
                        }
                    }
            );
        }

    <!-- Test: -->
        function showSubjectReview() {
            $('#subjectForm').prop('action','/usr/review/subject');

            $.ajax(
                    {
                        type:'get',
                        dataType: 'json',
                        url: '/usr/review/subject/list',
                        success: function (result) {
                            for(var i=0;i<result.length;i++){
                                $('#subjectId').append('<option value="'+result[i].id+'">'+result[i].title+'</option>');
                            }
                            $('#subjectModal').modal();
                        }
                    }
            );
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
                <li><a href="/teacher/list"><span class="glyphicon glyphicon-pencil"></span>Teachers</a></li>
                <li class="active"><a href="/subject/list"><span class="glyphicon glyphicon-book"></span>Subjects</a></li>
                <li><a href="/usr/views"><span class="glyphicon glyphicon-edit"></span>My Reviews</a></li>
                <li><a href = "/user_profile"><span class="glyphicon glyphicon-user"></span>My Profile</a></li>
                <li class="pull-right"><a href="/usr/logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
    
<div class="text-center">
    <h2>Subject Reviews</h2>
  </div>
    
<div class="col-md-7 col-sm-12">
  <button class="btn btn-success" onclick="addSubjectReview()">
      Create Subject Review
  </button>
</div>

<div class="container-fluid">
    <table class="table table-striped" class="col-md-7 col-sm-12">
        <tr>
            <th>Title</th>
            <th>Course Number</th>
            <th>Description</th>
            <th>Operations</th>
        </tr>
    <#list subjects as subject>
        <tr>
            <td>${subject.title}</td>
            <td>${subject.courseNumber}</td>
            <td>${subject.description}</td>
            <td>
                <a type="button" class="btn btn-sm" href="/subject/${subject.id}/reviews">
                    Check Review
                </a>
            </td>
        </tr>
    </#list>
    </table>
</div>


<!-- Test Code below -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="subjectModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="subjectModalLabel">Subject Review</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="post" id="subjectForm" name="subjectForm">
                    <!--Select subject to review-->
                    <div class="form-group">
                        <label for="subjectId">Subject</label>
                        <select name="subjectId" id="subjectId" class="form-control">

                        </select>
                    </div>

                    <!-- Subject Mark Attempt -->
                    <div class = "form-group">
                      <label for = "mark">Mark</label>
                      <select name="mark" id="mark" class="form-control">
                        <option value="High Distinction">High Distinction</option>
                        <option value="Distinction">Distinction</option>
                        <option value="Credit">Credit</option>
                        <option value="Pass" selected="selected">Pass</option>
                        <option value="Fail">Fail</option>
                      </select>
                    </div>


                    <!-- Attempt for Rating-->
                    <div class="form-group">
                      <label for="subjectRatingId">Rating</label>
                      <select name="subjectRatingId" id="subjectRatingId" class="form-control">
                        <option value="1" selected="selected">1 Worst</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5 Best</option>
                      </select>
                    </div>

                    <!-- Attempt for subject DifficultyRating-->
                    <div class="form-group">
                      <label for="difficultyRatingId">Difficulty Rating</label>
                      <!--<select name="difficultyRatingId" id="difficultyRatingId" class="form-control">-->
                      <!--<input name="difficulty" type = "text" id = "difficulty"  class = "form-control">-->

                      <div class="slidecontainer">
                        <input name="difficulty" type="range" min="1" max="5" value="50" class="slider" id="myRange">
                        <p> Value: <span name="difficultyValue" id="difficultyValue" ></span></p>
                      </div>

                      <script>
                      var slider = document.getElementById("myRange");
                      var output = document.getElementById("difficultyValue");
                      output.innerHTML = slider.value;
                      slider.oninput = function() {
                        output.innerHTML = this.value;
                      }
                      </script>

                    </select>

                    <!--Add review content-->
                    <div class="form-group">
                        <label for="text">Content</label>
                        <textarea name="text" id="subjectText" rows="10" class="form-control" maxlength="999" required></textarea>
                    </div>

                    <input type="hidden" name="id" id="subjectReviewId">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="subjectForm">Submit</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


</body>
</html>
