<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<title></title>
<head></head>

<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card card-primary">

							<div class="card-header">
								<h3 class="card-title">회원 정보 수정</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<form action="MemberUpdate.do" method="post">
								<input type="hidden" name="id" value="${mv.id }">
								<div class="card-body">
									<div class="form-group">
										<label for="exampleInputEmail1">ID</label> <label>${mv.id }</label>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Password</label> 
										<input type="password" class="form-control" id="exampleInputPassword1" name="pwd" value="${mv.pwd }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">E-Mail</label> 
										<input type="text" class="form-control" id="exampleInputPassword1" name="email" value="${mv.email }">
									</div>
									<div class="form-group">
										<label for="exampleInputFile">Picture</label>
										<div class="input-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input" id="exampleInputFile" name="picture"> 
												<label class="custom-file-label" for="exampleInputFile">${mv.picture }</label>
											</div>
											<div class="input-group-append">
												<span class="input-group-text">Upload</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Enabled(0퇴사,1재직,2휴직)</label>
										<input type="text" class="form-control" id="exampleInputPassword1" name="enabled" value="${mv.enabled }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">RegDate</label> 
										<input type="date" class="form-control" id="exampleInputPassword1" name="regdate" value="${mv.regdate }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Phone</label> 
										<input 	type="text" class="form-control" id="exampleInputPassword1" name="phone" value="${mv.phone }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Name</label> 
										<input
											type="text" class="form-control" id="exampleInputPassword1"
											name="name" value="${mv.name }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Register</label> 
										<input type="text" class="form-control" id="exampleInputPassword1" name="register" value="${mv.register }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Address</label> 
										<input type="text" class="form-control" id="exampleInputPassword1" name="address" value="${mv.address }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Authority</label> 
										<input type="text" class="form-control" id="exampleInputPassword1" name="authority" value="${mv.authority }">
									</div>

								</div>
								<!-- /.card-body -->

								<div class="card-footer">
									<button type="submit" class="btn btn-primary">수정</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
