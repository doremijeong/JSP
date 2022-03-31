<%@page import="member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	List<MemberVO> list = (List<MemberVO>)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 검색하기</title>
</head>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<h1 align="center">Search Member</h1>

				<form action="MemberSearch.do" method="post">
					<div class="div">
						<select name="searchOption">
							<option>아이디</option>
							<option>이름</option>
							<option>이메일</option>
							<option>전화번호</option>
						</select>
						<div class="search">
							<input type="text" placeholder="검색어를 입력해주세요." name="search">
						</div>
						<div class="button">
							<input type="submit" value="검색">
						</div>
					</div>
				</form>

				<table border="1" align="center" width="700px" height="100">
					<tr>
						<th>ID</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>E-Mail</th>
					</tr>

					<c:set var="list" value="<%=list%>" />
					<c:forEach items="${list }" var="i">
						<tr>
							<td><a href="MemberDetail.do?id=${i.id }">${i.id }</a></td>
							<td>${i.name }</td>
							<td>${i.phone }</td>
							<td>${i.email }</td>
						</tr>
					</c:forEach>

					<tr align="center">
						<td colspan="4"><a href="MemberList.do">[전체목록]</a></td>
					</tr>

				</table>
			</div>
		</div>
	</div>
</body>
</html>