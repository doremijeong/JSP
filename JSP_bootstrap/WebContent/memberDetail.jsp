<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title></title>
<head></head>

<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card card-primary card-outline">
							<div class="card-body box-profile">
								<div class="text-center">
									<img class="profile-user-img img-fluid img-circle"
										src="<%=request.getContextPath() %>/resources/image/pro.jpg"
										alt="${mv.picture }">
								</div>

								<h3 class="profile-username text-center">${mv.name }</h3>

								<p class="text-muted text-center">Software Engineer</p>

								<ul class="list-group list-group-unbordered mb-3">
									<li class="list-group-item"><b>ID</b> <a class="float-right">${mv.id }</a></li>
									<li class="list-group-item"><b>Password</b> <a class="float-right">${mv.pwd }</a></li>
									<li class="list-group-item"><b>E-Mail</b> <a class="float-right">${mv.email }</a></li>
									<li class="list-group-item"><b>Enabled</b> <a class="float-right">${mv.enabled }</a></li>
									<li class="list-group-item"><b>RegDate</b> <a class="float-right"><fmt:formatDate value="${mv.regdate }" pattern="yyyy-MM-dd"/></a></li>
									<li class="list-group-item"><b>Phone</b> <a class="float-right">${mv.phone }</a></li>
									<li class="list-group-item"><b>Register</b> <a class="float-right">${mv.register }</a></li>
									<li class="list-group-item"><b>Address</b> <a class="float-right">${mv.address }</a></li>
									<li class="list-group-item"><b>Authority</b> <a class="float-right">${mv.authority }</a></li>
								</ul>

								<a href="MemberList.do" class="btn btn-primary btn-block"><b>Back</b></a>
								<a href="MemberUpdate.do?id=${mv.id }" class="btn btn-primary btn-block">수정하기</a>
								<form action="MemberDelete.do" method="post">
									<input type="hidden" name="id" value="${mv.id }"> 
									<input type="submit" class="btn btn-primary btn-block" style="margin-top: 10px;" value="탈퇴하기">
								</form>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
