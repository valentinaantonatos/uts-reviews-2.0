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
    
    <title>Teacher Reviews - UTSReviews</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

    <script type = "text/javascript">
            function addTeacherReview() {
            $('#teacherForm').prop('action','/usr/review/teacher/add');

            $('#teacherId').children().remove();
            $.ajax(
                    {
                        type:'get',
                        dataType: 'json',
                        url: '/usr/review/teacher/list',
                        success: function (result) {
                            for(var i=0;i<result.length;i++){
                                $('#teacherId').append('<option value="'+result[i].id+'">'+result[i].name+'</option>');
                            }
                            $('#teacherModal').modal();
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
    <h2>Teacher Reviews</h2>
</div>

<div class="col-md-7 col-sm-12">
  <button class="btn btn-primary" onclick="addTeacherReview()">
    Create Teacher Review
  </button>
  <p> </p>
</div>

<div class="container-fluid">
<table class="table table-striped" class="col-md-7 col-sm-12">
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Operations</th>
    </tr>
    <#list teachers as teacher>
        <tr>
           <td>${teacher.name}</td>
            <td>${teacher.description}</td>
            <td>
                <a type="button" class="btn btn-sm" href="/teacher/${teacher.id}/reviews" >
                    Check Review
                </a>
            </td>
        </tr>
    </#list>
</table>
</div>

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
                        <select name="teacherId" id="teacherId" class="form-control"></select>
                    </div>

                     <!-- Attempt for Rating-->
                      <div class="form-group">
                        <label for="teacherRatingId">Rating</label>
                        <select name="teacherRating" id="teacherRating" class="form-control">
                          <option value="1">1 Very Dissatisfied</option>
                          <option value="2">2 Dissatisfied</option>
                          <option value="3" selected="selected">3 Neutral</option>
                          <option value="4">4 Satisfied</option>
                          <option value="5">5 Very Satisfied</option>
                        </select>
                      </div>

                    <!--Add review content-->
                    <div class="form-group">
                        <label for="text">Content</label>
                        <textarea name="text" id="teacherText" name="teacherText" rows="10" class="form-control" maxlength="999" required></textarea>
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
