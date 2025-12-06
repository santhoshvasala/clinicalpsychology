<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
<style>
textarea {
      width: 100%;
      padding: 0.6rem 0.7rem;
      border: 1px solid var(--border);
      border-radius: 8px;
      font-size: 0.95rem;
      background: #fff;
    }
</style>
</head>
<body>
	<div class="container mt-5 bg-light">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3 mt-3 text-warning">Update Session Notes</h1>
				<form
					action="${pageContext.request.contextPath}/handleUpdateSessionNotes/${sessionNoteVal.id}"
					method="post">
					<button type="submit" disabled style="display: none"
						aria-hidden="true"></button>
					<div class="form-group">
						<label for="name">Date: </label> 
						
					<fmt:formatDate value="${sessionNoteVal.sessionoccuredon}" pattern="yyyy-MM-dd'T'HH:mm" var="dobDate" />
					<input type="datetime-local"
							name="sessionoccuredon" id="sessionoccuredon" disabled="disabled" value="${dobDate}" />
					</div>
					<div class="form-group">
						<label for="name">Session Notes: </label>
						<textarea
							id="sessionnote" name="sessionnote">${sessionNoteVal.sessionnote}</textarea>
					</div>
					<div class="container text-center mb-4">
						<a href="${pageContext.request.contextPath}/homePage"
							class="btn btn-outline-danger">HOME</a>
						<button type="submit" class="btn btn-primary">UPDATE</button>
					</div>
				</form>
			</div>
		</div>
	</div>



</body>
</html>