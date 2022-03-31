<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<title></title>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	
	$('#idcheck').on('click', function(){
		
		idvalue = $('#id').val();
		console.log(idvalue);
		
	
		 //공백체크
		if(idvalue.length < 1 || idvalue >12){
			alert("id를 입력하세요");
			return false;
		}
		
		//길이 체크
		if(idvalue.length < 4 || idvalue.length > 12){
			alert('id는 4~12사이 입니다.');
			return false;
		}
	
		$.ajax({
			url : "/IDCheck.do",
			type : 'get',
			data : {"id" : idvalue},
			dataType : 'json',
			success : function(res){
				$('#idspan').html(res.sw).css('color','red');
			},
			error : function(xhr){
				alert('상태 :' + xhr.status);
			}
		})
	
	})
})

</script>
</head>

<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card card-primary">

							<div class="card-header">
								<h3 class="card-title">회원 가입</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form action="MemberRegister.do" method="post">
								<div class="card-body">
									<div class="form-group">
										<label for="exampleInputEmail1">ID</label> 
										<input type="text" class="form-control" id="id" name="id" placeholder="ID">
										<input id="idcheck" type="button" value="중복검사">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Password</label> <input
											type="password" class="form-control"
											id="exampleInputPassword1" name="pwd" placeholder="Password">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">E-Mail</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											name="email" placeholder="E-Mail">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">Picture</label>
										<div class="input-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input"
													id="exampleInputFile" name="picture"> <label
													class="custom-file-label" for="exampleInputFile">Choose
													file</label>
											</div>
											<div class="input-group-append">
												<span class="input-group-text">Upload</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Enabled(0퇴사,1재직,2휴직)</label>
										<input type="text" class="form-control"
											id="exampleInputPassword1" name="enabled"
											placeholder="Enabled">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">RegDate</label> 
										<input type="date" class="form-control" id="exampleInputPassword1" name="regdate" placeholder="RegDate">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Phone</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											name="phone" placeholder="Phone">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Name</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											name="name" placeholder="Name">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Register</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											name="register" placeholder="Register">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Address</label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											name="address" placeholder="Address">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Authority</label> 
										<input type="text" class="form-control" id="exampleInputPassword1" name="authority" placeholder="Authority">
									</div>

								</div>
								<!-- /.card-body -->

								<div class="card-footer">
									<button type="submit" class="btn btn-primary">등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
