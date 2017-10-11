<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>课程管理</title>

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
		<h1>视频管理</h1>

		<p>
			<button type="button" class="btn btn-info" onclick="add()">添加</button>
		</p>
		<button type="button" class="btn btn-primary" id="deleteVideos" disabled="disabled" onclick="deleteVideos()">批量删除</button>
		<input type="text" id="title" placeholder="标题">
		<!-- Single button -->

		<div class="btn-group">
			<select class="speaker" id="speakerId">

				<option></option>

			</select>
		</div>

		<div class="btn-group">
			<select class="course" id="courseId">

				<option></option>

			</select>
		</div>

		<button type="button" class="btn btn-info" onclick="Search()">查询</button>




		<table class="table table-hover table-bordered">
			<tr>
				<th>选择</th>
				<th>序号</th>
				<th>名称</th>
				<th>介绍</th>
				<th>讲师</th>
				<th>时长</th>
				<th>播放次数</th>
				<th>编辑</th>
				<th>删除</th>
			</tr>


		</table>
		
		<nav aria-label="Page navigation" class="text-right">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li>
                <a href="#">1</a>
            </li>
            <li>
                <a href="#">2</a>
            </li>
            <li>
                <a href="#">3</a>
            </li>
            <li>
                <a href="#">4</a>
            </li>
            <li>
                <a href="#">5</a>
            </li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
		
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
					<button type="button" class="btn btn-danger " onclick="loadDeleteVideo()">删除</button>
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
					<h4 class="modal-title" id="exampleModalLabel">添加视频信息</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">视频标题:</label>
							<input type="text" class="form-control" id="addName">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">主讲人:</label>

							<select class="speaker2" id="addSpeakerName">

								<option>请选择所属讲师</option>



							</select>

						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">所属课程:</label>

							<select class="course2" id="addCourseName">

								<option>请选择所属课程</option>

							</select>

						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">视频时长(秒):</label>
							<input type="text" class="form-control" id="addTimelong" placeholder="精确到秒（正整数）">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">封面图片地址:</label>
							<input type="text" class="form-control" id="addImageURL" placeholder="具体的url">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">视频播放地址:</label>
							<input type="text" class="form-control" id="addVideoURL" placeholder="具体的url">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">备注:</label>
							<textarea rows="5" cols="10" class="form-control" id="addPresentation"></textarea>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary " onclick="loadAdd()">添加</button>
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
					<h4 class="modal-title" id="exampleModalLabel">修改视频信息</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">视频标题:</label>
							<input type="text" class="form-control" id="updateName">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">主讲人:</label>

							<select class="speaker2" id="updateSpeakerName">

								<option>请选择所属讲师</option>

							</select>

						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">所属课程:</label>

							<select class="course2" id="updateCourseName">

								<option>请选择所属课程</option>

							</select>

						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">视频时长(秒):</label>
							<input type="text" class="form-control" id="updateTimelong" placeholder="精确到秒（正整数）">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">封面图片地址:</label>
							<input type="text" class="form-control" id="updateImageURL" placeholder="具体的url">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">视频播放地址:</label>
							<input type="text" class="form-control" id="updateVideoURL" placeholder="具体的url">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">备注:</label>
							<textarea rows="5" cols="10" class="form-control" id="updatePresentation"></textarea>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary " onclick="loadUpdate()">修改</button>
				</div>
			</div>
		</div>
	</div>




	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			loadVideos(1);
			loadSpeakers();
			loadCourses();
			
		})
		
		var videos = null;
		var videoID = null;
		
		function loadVideos(pageIndex) {

			$.ajax({

				type : 'POST',
				url : 'http://localhost:8080/Video_Stu/video/listVideos',
				async : true,
				
				contentType:'application/json;charset=utf-8',
	              
	              data:JSON.stringify({
	                  'pageIndex':pageIndex,
	                  'pageSize':10
	              }),
	              
	              dataType:'json',
	              
	              success:function(data){
	                  
	                  if (data.errorCode == 0) {
	                      
	                      videos = data.data.data;
	                      $(".table tr:not(:first)").empty("");
	                      $.each(videos, function(index, obj) {
                          $(".table").append(
                                    "<tr><td><input type='checkbox' name='checkboxs' value='"+ obj.id +"' onclick='clickCheckbox()'></td><td>" 
                                    + (index + 1) + "</td><td>"
                                            + obj.name + "</td><td>"
                                            + obj.presentation + "</td><td>"
                                            + obj.speakerName + "</td><td>"
                                            + obj.timelong + "</td><td>"
                                            + obj.playCount + "</td><td>"
                                            + "<button type='button' class='btn btn-default' onclick='Update(" + obj.id + " )'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>"
                                            + "</td><td>"
                                            + "<button type='button' class='btn btn-default' onclick='loadDelete([" + obj.id + "])'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></button>" 
                                            + "</td></tr>");
                        });
	                      
	                      $(".pagination").empty("");
	                      
	                      $(".pagination").append("<li " + (data.data.pageIndex == 1 ? "class='disabled'" : '') + "><a aria-label='Previous' onclick='loadVideos(" + (data.data.pageIndex-1) + ")'><span aria-hidden='true'>&laquo;</span></a></li>");
	                      
	                      for (var i = 1; i <= data.data.pageCount; i++) {
	                          $(".pagination").append("<li " + (data.data.pageIndex == i ? "class='active'" : '') + "><a  onclick='loadVideos(" + i + ")'>" + i + "</a></li>");
	                      }
	                      $(".pagination").append("<li " + (data.data.pageIndex == data.data.pageCount ? "class='disabled'" : '') + " ><a aria-label='Next' onclick='loadVideos(" + (data.data.pageIndex+1) + ")'><span aria-hidden='true'>&raquo;</span></a></li>");
	                  }
	              },
	              
	              error:function(message) {
	                  alert(JSON.stringify(message));
	              }
	           });
	       }
		
		function clickCheckbox() {

	           var inputs = $("input[name=checkboxs]:checked");
	           
	           var length = inputs.length;
	           
	           if (length == 0) {
	               
	                 $("#deleteVideos").html("批量删除");
	                 $("#deleteVideos").attr("disabled", "disabled");
	           }else {
	                 $("#deleteVideos").html("批量删除（" +  length + "）");
	                 $("#deleteVideos").removeAttr("disabled");
	           }
	       }
		
		 function deleteVideos() {
	           
	           // 1. 获取所有被选中的 input 元素
	           var inputs = $("input[name=checkboxs]:checked");
	           
	           // 2. 定义一个数组，存放选中的 input 对应的 id
	           var ids = new Array();
	           
	           // 3. 遍历取出每一个 id，放入 ids 数组
	           inputs.each(function(){
	               
	               // 取出每一个 input 的 value 值，放入 ids 数组
	               ids.push($(this).val());
	           });
	           
	           // 执行删除请求
	           
	           videoID =  ids;
	           loadDeleteVideo();
	           
	           // 重置批量删除按钮状态
	           $("#deleteVideos").html("批量删除");
	           $("#deleteVideos").attr("disabled", "disabled");
	       }
		
		
		function loadSpeakers() {

            $.ajax({

                type : 'POST',
                url : 'http://localhost:8080/Video_Stu/speaker/listSpeakers' ,
                async : true,
                success : function(data) {
                    // alert(JSON.stringify(data));
                    // 遍历 data 在循环中执行 function
                    $.each(data.data, function(index, obj) {

                        $(".speaker").append(
                        		
                        		"<option value='"+ obj.id +"'>" + obj.name + "</option>");
                    });

                },
                error : function(msg) {
                    alert(JSON.stringify(msg));

                }
            });
        }
		
		
		function loadCourses() {

            $.ajax({

                type : 'POST',
                url : 'http://localhost:8080/Video_Stu/course/listCourses' ,
                async : true,
                success : function(data) {
                    // alert(JSON.stringify(data));
                    // 遍历 data 在循环中执行 function
                    $.each(data, function(index, obj) {

                        $(".course").append(
                                
                                "<option value='"+ obj.id +"'>" + obj.title + "</option>");
                    });

                },
                error : function(msg) {
                    alert(JSON.stringify(msg));

                }
            });
        }
		
		
		
		

		function loadDelete(videoId) {
			
			videoID = videoId;

			$("#deleteModal").modal({});

		}
		
	    function loadDeleteVideo() {
	    	
	    	$.ajax({

                type : 'POST',
                url : 'http://localhost:8080/Video_Stu/video/delete',
                async : true,

                contentType : 'application/json',  // 把页面中获取的参数变成json字符串,，此时需要加上contentType: "application/json"
                data : JSON.stringify({
                    "videoId" : videoID
                }),

                dataType : 'json',    // 得到的返回值是一个json 对象
                success : function(data) {

                    if (data.errorCode == 0) {
                    	
                    	$("#deleteModal").modal('hide');
                    	
                    	var pageIndex = $(".active a").html();
                        
                    	loadVideos(pageIndex);
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
			
			$.ajax({

                type : 'POST',
                url : 'http://localhost:8080/Video_Stu/course/listCourses' ,
                async : true,
                success : function(data) {
                    // alert(JSON.stringify(data));
                    // 遍历 data 在循环中执行 function
                    
                    $(".course2").empty();
                    $(".course2").append("<option></option>");
                    
                    $.each(data, function(index, obj) {

                        $(".course2").append(
                                
                                "<option value='"+ obj.id +"'>" + obj.title + "</option>");
                    });

                },
                error : function(msg) {
                    alert(JSON.stringify(msg));

                }
            });
			
			 $.ajax({

	                type : 'POST',
	                url : 'http://localhost:8080/Video_Stu/speaker/listSpeakers' ,
	                async : true,
	                success : function(data) {
	                    // alert(JSON.stringify(data));
	                    // 遍历 data 在循环中执行 function
	                    
	                    $(".speaker2").empty();
	                    
	                    $(".speaker2").append("<option></option>");
                   
	                    $.each(data.data, function(index, obj) {

	                        $(".speaker2").append(
	                                
	                                "<option value='"+ obj.id +"'>" + obj.name + "</option>");
	                    });

	                },
	                error : function(msg) {
	                    alert(JSON.stringify(msg));

	                }
	            });
		}
		
		function loadAdd() {

            $.ajax({

                type : 'POST',
                url : 'http://localhost:8080/Video_Stu/video/addVideo',
                async : true,

                contentType : 'application/json;charset=utf-8',
                data : JSON.stringify({

                    "name" : $("#addName").val(),
                    "speakerId" : $("#addSpeakerName").val(),
                    "courseId" : $("#addCourseName").val(),
                    "timelong" : $("#addTimelong").val(),
                    "imageURL" : $("#addImageURL").val(),
                    "videoURL" : $("#addVideoURL").val(),
                    "presentation" : $("#addPresentation").val(),

                }),

                dataType : 'json',

                success : function(data) {

                      $("#addModal").modal('hide');
                },
                error : function(msg) {
                    alert(JSON.stringify(msg));

                }
            });
        }
		
		function Search() {
			$.ajax({

                type : 'POST',
                url : 'http://localhost:8080/Video_Stu/video/search',
                async : true,

                contentType : 'application/json;charset=utf-8',
                data : JSON.stringify({

                    "title" : $("#title").val(),
                    "speakerId" : $("#speakerId").val(),
                    "courseId" : $("#courseId").val(),

                }),

                dataType : 'json',

                success : function(data) {
                    // alert(JSON.stringify(data));
                    // 遍历 data 在循环中执行 function
                    $(".table tr:not(:first)").empty("");
                    
                    $.each(data, function(index, obj) {

                        $(".table").append(
                                "<tr><td><input type='checkbox' value='"+ obj.id +"'></td><td>" 
                                + (index + 1) + "</td><td>"
                                        + obj.name + "</td><td>"
                                        + obj.presentation + "</td><td>"
                                        + obj.speakerName + "</td><td>"
                                        + obj.timelong + "</td><td>"
                                        + obj.playCount + "</td><td>"
                                        + "<button type='button' class='btn btn-default' ><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></button>"
                                        + "</td><td>"
                                        + "<button type='button' class='btn btn-default' onclick='loadDelete(" + obj.id + " )'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></button>" 
                                        + "</td></tr>");
                    });

                },
                error : function(msg) {
                    alert(JSON.stringify(msg));

                }
            });
        }
		
		
		
        function Update(videoId){
        	
        	videoID = videoId;
        	
            $("#updateModal").modal({});
            
            $.ajax({

                type : 'POST',
                url : 'http://localhost:8080/Video_Stu/course/listCourses' ,
                async : true,
                success : function(data) {
                    // alert(JSON.stringify(data));
                    // 遍历 data 在循环中执行 function
                    
                    $(".course2").empty();
                        
                        $(".course2").append("<option></option>");
                    
                    $.each(data, function(index, obj) {

                        $(".course2").append(
                                
                                "<option value='"+ obj.id +"'>" + obj.title + "</option>");
                    });

                },
                error : function(msg) {
                    alert(JSON.stringify(msg));

                }
            });
            
            
             $.ajax({

                    type : 'POST',
                    url : 'http://localhost:8080/Video_Stu/speaker/listSpeakers' ,
                    async : true,
                    success : function(data) {
                        // alert(JSON.stringify(data));
                        // 遍历 data 在循环中执行 function
                        
                        $(".speaker2").empty();
                        
                        $(".speaker2").append("<option></option>");
                        

                        $.each(data.data, function(index, obj) {
                        	
                            $(".speaker2").append(
                                    
                                    "<option value='"+ obj.id +"'>" + obj.name + "</option>");
                        });

                    },
                    error : function(msg) {
                        alert(JSON.stringify(msg));

                    }
                });
        }
        
   
		function loadUpdate() {

			$.ajax({

				type : 'POST',
				url : 'http://localhost:8080/Video_Stu/video/updateVideo',
				async : true,

				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify({

					"id" : videoID,
					"name" : $("#updateName").val(),
					"speakerId" : $("#updateSpeakerName").val(),
					"courseId" : $("#updateCourseName").val(),
					"timelong" : $("#updateTimelong").val(),
					"imageURL" : $("#updateImageURL").val(),
					"videoURL" : $("#updateVideoURL").val(),
					"presentation" : $("#updatePresentation").val(),

				}),

				dataType : 'json',

				success : function(data) {

					$("#updateModal").modal('hide');
				},
				error : function(msg) {
					alert(JSON.stringify(msg));

				}
			});
		}
	</script>



</body>
</html>