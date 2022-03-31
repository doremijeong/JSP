<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title></title>
<head></head>

<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
			
			
				<div class="row">
					<div class="col-12">
						<div class="card">
							<form action="MemberSearch.do" method="post">
								<div class="card-header">
									<h3 class="card-title">MemberList</h3>
									<select name="searchOption" style="margin-left: 66%;">
										<option>아이디</option>
										<option>이름</option>
										<option>이메일</option>
										<option>전화번호</option>
									</select>
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 150px;">
											<input type="text" name="search"
												class="form-control float-right" placeholder="Search">

											<div class="input-group-append">
												<button type="submit" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- /.card-header -->
							<div class="card-body table-responsive p-0">
								<table class="table table-hover text-nowrap">
									<thead>
										<tr>
											<th>ID</th>
											<th>이름</th>
											<th>전화번호</th>
											<th>E-Mail</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list }" var="list">
											<tr>
												<td><a href="MemberDetail.do?id=${list.id}">${list.id}</a></td>
												<td>${list.name }</td>
												<td>${list.phone }</td>
												<td>${list.email }</td>
											</tr>
										</c:forEach>

										<!-- 페이징 처리 시작 -->
										<c:if test="${pagingVO.totalCount gt 0  }">
											<tr>
												<td colspan="4" align="center">
													<!-- 첫번째페이지 번호가 페이지 수보다 큰 경우(이젠페이지 존재함.) --> <c:if
														test="${pagingVO.firstPageNo gt pagingVO.pageSize }">
														<a href="MemberList.do?pageNo=${pagingVO.firstPageNo - pagingVO.pageSize }">[이전]</a>
													</c:if> <c:forEach var="pNo" begin="${pagingVO.firstPageNo }"
														end="${pagingVO.lastPageNo }" step="1">
														<a <c:if test="${pNo eq pagingVO.currentPageNo }">style="color:orange;"</c:if> href="MemberList.do?pageNo=${pNo }">[${pNo }]</a>
													</c:forEach> <!-- 마지막페이지번호가 전체페이지 수보다 작은 경우(다음페이지 존재함.) --> 
													<c:if test="${pagingVO.lastPageNo lt pagingVO.totalPageCount }">
														<a href="MemberList.do?pageNo=${pagingVO.firstPageNo + pagingVO.pageSize }">[다음]</a>
													</c:if>
												</td>
											</tr>
										</c:if>
										<!-- 페이징 처리 끝 -->

										<tr align="center">
											<td colspan="4"><a href="MemberRegister.do">회원 가입</a></td>
										</tr>

									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
				</div>
			</div>
		</div>
	</div>

</body>