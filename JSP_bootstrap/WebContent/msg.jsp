<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${msg gt 0 }">
		<script>alert('성공');
		location.href="/JSP_bootstrap/MemberList.do";
		</script>
	</c:when>
	<c:otherwise>
		<script>alert('실패');</script>
	</c:otherwise>
</c:choose>

