<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
				<div class="commentList">
				<c:forEach var="comment" items="${comment_list}">
				<c:choose>
					<c:when test="${comment.level eq 1}">
					<div class="commentValue">
					</c:when>
					<c:when test="${comment.level%2 eq 0 }">
					<div class="commentValue" style = "background-color:#e5e5e5; width: 96%; padding-left: 2%; padding-right: 2%;">
					</c:when>
					<c:when test="${comment.level%2 ne 0 }">
					<div class="commentValue" style = "background-color:#eaeaea; width: 96%; padding-left: 2%; padding-right: 2%;">
					</c:when>
				</c:choose>
						<p class="commentValHead">
							<span class="commentId">${comment.rv_id}</span> <span class="commentDate"><fmt:formatDate
							value="${comment.rv_date}" pattern="yyyy/MM/dd HH:mm:ss"/></span>
						</p>
						<c:if test="${comment.rv_delflag eq 'N'}">
							<p class="commentValMiddle">${comment.rv_content}</p>
						</c:if>
						<c:if test="${comment.rv_delflag ne 'N'}">
							<p class="commentValMiddle" style="color : #aaa;">삭제된 게시글 입니다.</p>
						</c:if>
						<c:if test="${comment.rv_delflag eq 'N'}">
						<p class="commentValFoot">
							<input type="hidden" name="rv_no" value="${comment.rv_no}"/>
							<a href="#" class="commentPlus" onclick="return false;">답글</a>
							<a href="#" class="commentModify" onclick="return false;">수정</a>
							<a href="#" class="commentDelete" onclick="return false;">삭제</a>
						</p>
						</c:if>
					</div>
				</c:forEach>
				</div>