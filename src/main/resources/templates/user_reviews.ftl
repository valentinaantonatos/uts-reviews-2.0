<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reviews of User</title>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        function confirmDelete(url){
            if(confirm("Are you sure to Delete?")){
                window.location.href = url;
            }
        }

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

        function updateTeacher(id) {
            $('#teacherForm').prop('action','/usr/review/teacher/update');

            $('#teacherId').children().remove();
            $('#teacherId').prop('disabled','disabled');
            $.ajax(
                    {
                        type:'get',
                        dataType: 'json',
                        url: '/usr/review/teacher/list',
                        success: function (result) {
                            for(var i=0;i<result.length;i++){
                                $('#teacherId').append('<option value="'+result[i].id+'">'+result[i].courseNumber+' '+result[i].name+'</option>');
                            }

                            $.ajax({
                                type:'get',
                                dataType: 'json',
                                url: '/usr/review/teacher/'+id,
                                success: function(result){
                                    console.log(result);
                                    $('#teacherId').val(result.teacher.id);
                                    $('#teacherText').val(result.text);
                                    $('#teacherReviewId').val(result.id);
                                    $('#teacherModal').modal();
                                }
                            });
                        }
                    }
            );
        }

        function updateSubject(id) {
            $('#subjectForm').prop('action','/usr/review/subject/update');

            $('#subjectId').children().remove();
            $('#subjectId').prop('disabled','disabled');
            $.ajax(
                    {
                        type:'get',
                        dataType: 'json',
                        url: '/usr/review/subject/list',
                        success: function (result) {
                            for(var i=0;i<result.length;i++){
                                $('#subjectId').append('<option value="'+result[i].id+'">'+result[i].courseNumber+' '+result[i].title+'</option>');
                            }

                            $.ajax({
                                type:'get',
                                dataType: 'json',
                                url: '/usr/review/subject/'+id,
                                success: function(result){
                                    console.log(result);
                                    $('#subjectId').val(result.subject.id);
                                    $('#subjectText').val(result.text);
                                    $('#subjectReviewId').val(result.id);
                                    $('#subjectModal').modal();
                                }
                            });
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
            <a class="navbar-brand" href="/index">UTS</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="/teacher/list">Teachers</a></li>
                <li><a href="/subject/list">Subjects</a></li>
                <li class="active"><a href="/usr/views">My Reviews</a></li>
                <li class="pull-right"><a href="/usr/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div>
    <button class="btn btn-primary" onclick="addTeacherReview()">
        Review for Teacher
    </button>

    <button class="btn btn-success" onclick="addSubjectReview()">
        Review for Subject
    </button>
</div>

<div class="text-center">
    <h2>Reviews Of Teachers</h2>
</div>

<table class="table table-bordered">
    <tr>
        <th>Name Of Teacher</th>
        <th>Review</th>
        <th>Date Time</th>
        <th>Operations</th>
    </tr>
    <#list teacherReviews as teacherReview>
        <tr>
            <td>${teacherReview.teacher.name}</td>
            <td>${teacherReview.text}</td>
            <td>${teacherReview.date}</td>
            <td>
                <a type="button" class="btn btn-sm" onclick="updateTeacher('${teacherReview.id}')">
                    Edit
                </a>
                <a type="button" class="btn btn-sm" onclick="confirmDelete('/usr/review/teacher/delete/${teacherReview.id}')" >
                    Delete
                </a>
            </td>
        </tr>
    </#list>
</table>

<div class="text-center">
    <h2>Reviews Of Subjects</h2>
</div>

<table class="table table-bordered">
    <tr>
        <th>Subject Title</th>
        <th>Review</th>
        <th>Date Time</th>
        <th>Operations</th>
    </tr>
<#list subjectReviews as subjectReview>
    <tr>
        <td>${subjectReview.subject.title}</td>
        <td>${subjectReview.text}</td>
        <td>${subjectReview.date}</td>
        <td>
            <a type="button" class="btn btn-sm" onclick="updateSubject('${subjectReview.id}')">
                Edit
            </a>
            <a type="button" class="btn btn-sm" onclick="confirmDelete('/usr/review/subject/delete/${subjectReview.id}')" >
                Delete
            </a>
        </td>
    </tr>
</#list>
</table>

<!-- 模态框（Modal） -->
<div class="modal fade" id="teacherModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="teacherModalLabel">Review for Teacher</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="post" id="teacherForm" name="teacherForm">
                    <div class="form-group">
                        <label for="teacherId">Teacher</label>
                        <select name="teacherId" id="teacherId" class="form-control">

                        </select>
                    </div>

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

<!-- 模态框（Modal） -->
<div class="modal fade" id="subjectModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="subjectModalLabel">Review for Subject</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="post" id="subjectForm" name="subjectForm">
                    <div class="form-group">
                        <label for="subjectId">Subject</label>
                        <select name="subjectId" id="subjectId" class="form-control">

                        </select>
                    </div>

                    <div class="form-group">
                        <label for="text">Content</label>
                        <textarea name="text" id="subjectText" rows="10" class="form-control"></textarea>
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