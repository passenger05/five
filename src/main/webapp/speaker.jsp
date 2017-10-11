<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>主讲人管理</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

    <div class="container">

        <p>
                    视频管理系统 &emsp;&emsp;&emsp;
            <a href="video.jsp">视频管理</a>
            &emsp;&emsp;&emsp;
            <a href="speaker.jsp">主讲人管理</a>
            &emsp;&emsp;&emsp;
            <a href="course.jsp">课程管理</a>
        </p>
        <h1>主讲人管理</h1>

        <p>
            <button type="button" class="btn btn-info" onclick="add()">添加</button>
        </p>





        <table class="table table-hover table-bordered">
            <tr>
                <th>序号</th>
                <th>名称</th>
                <th>职位</th>
                <th>简介</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>


        </table>
        
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="exampleModalLabel">你确定要删除吗</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary " onclick="loadDisappear()">关闭</button>
                    <button type="button" class="btn btn-danger " onclick="loadDeleteSpeaker()">删除</button>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="exampleModalLabel">添加主讲人</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">姓名:</label>
                            <input type="text" class="form-control" id="addName">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">职位:</label>
                            <input type="text" class="form-control" id="addPosition">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">头像地址:</label>
                            <input type="text" class="form-control" id="addImageURL">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">简介:</label>
                            <input type="text" class="form-control" id="addDescription">
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary " onclick="loadAdd()">保存</button>
                </div>
            </div>
        </div>
    </div>



	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">更新主讲人</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">姓名:</label>
							<input type="text" class="form-control" id="updateName">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">职位:</label>
							<input type="text" class="form-control" id="updatePosition">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">头像地址:</label>
							<input type="text" class="form-control" id="updateImageURL">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">简介:</label>
							<input type="text" class="form-control" id="updateDescription">
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary " onclick="loadUpdate2()">更新</button>
				</div>
			</div>
		</div>
	</div>



	<script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			loadSpeakers();

		})

		var speakers = null;
		var speakerID = null;

		function loadSpeakers() {
			
			$
					.ajax({

						type : 'POST',
						url : 'http://localhost:8080/Video_Stu/speaker/listSpeakers',
						async : true,
						success : function(data) {
							if(data.errorCode == 0){
								speakers = data.data;
								
	                            $(".table tr:not(:first)").empty("");
	                            $
	                                    .each(
	                                    		speakers,
	                                            function(index, obj) {

	                                                $(".table")
	                                                        .append(
	                                                                "<tr><td>"
	                                                                        + (index + 1)
	                                                                        + "</td><td>"
	                                                                        + obj.name
	                                                                        + "</td><td>"
	                                                                        + obj.position
	                                                                        + "</td><td>"
	                                                                        + obj.description
	                                                                        + "</td><td>"
	                                                                        + "<button type='button' class='btn btn-default' onclick='loadUpdate("
	                                                                        + index
	                                                                        + " )'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>"
	                                                                        + "</td><td>"
	                                                                        + "<button type='button' class='btn btn-default' onclick='loadDelete("
	                                                                        + obj.id
	                                                                        + ")'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></button>"
	                                                                        + "</td></tr>");

	                                            });
							}
						},
						error : function(msg) {
							alert(JSON.stringify(msg));

						}
					});
		}

		function loadDelete(speakerId) {

			speakerID = speakerId;

			$("#deleteModal").modal({});

		}

		function loadDeleteSpeaker() {

			$.ajax({

				type : 'POST',
				url : 'http://localhost:8080/Video_Stu/speaker/delete',
				async : true,

				contentType : 'application/json', // 把页面中获取的参数变成json字符串,，此时需要加上contentType: "application/json"
				data : JSON.stringify({
					"speakerId" : speakerID
				}),

				dataType : 'json', // 得到的返回值是一个json 对象
				success : function(data) {

					if (data.errorCode == 0) {

						$("#deleteModal").modal('hide');

						var pageIndex = $(".active a").html();

						loadSpeakers();
					}
				},
				error : function(msg) {
					alert(JSON.stringify(msg));

				}
			});

		}

		function loadDisappear() {
			$("#deleteModal").modal('hide');

		}
		
		function add(){
			
			$("#addModal").modal({});
		}
		
		function loadAdd() {
			
			
			$.ajax({

				type : 'POST',
				url : 'http://localhost:8080/Video_Stu/speaker/addSpeaker',
				async : true,

				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify({

					"name" : $("#addName").val(),
					"position" : $("#addPosition").val(),
					"imageURL" : $("#addImageURL").val(),
					"description" : $("#addDescription").val(),

				}),

				dataType : 'json',

				success : function(data) {

					$("#addModal").modal('hide');
					loadSpeakers();
				},
				error : function(msg) {
					alert(JSON.stringify(msg));

				}
			});
		}
		
		
	    function loadUpdate(index) {
	    	
	    	var speaker = speakers[index];
	    	
	    	speakerID = speaker.id;
            
	    	$("#updateName").val(speaker.name);
	    	$("#updatePosition").val(speaker.position);
	    	$("#updateImageURL").val(speaker.imageURL);
	    	$("#updateDescription").val(speaker.description);
	    	
            $("#updateModal").modal({});
            
        }
	    
	    function loadUpdate2() {
            
            $.ajax({

                type : 'POST',
                url : 'http://localhost:8080/Video_Stu/speaker/updateSpeaker',
                async : true,

                contentType : 'application/json;charset=utf-8',
                data : JSON.stringify({
                    "id" : speakerID,
                    "name" : $("#updateName").val(),
                    "position" : $("#updatePosition").val(),
                    "imageURL" : $("#updateImageURL").val(),
                    "description" : $("#updateDescription").val(),

                }),

                dataType : 'json',

                success : function(data) {

                    $("#updateModal").modal('hide');
                    loadSpeakers();
                },
                error : function(msg) {
                    alert(JSON.stringify(msg));

                }
            });
        }
        
		
		
	</script>

</body>
</html>