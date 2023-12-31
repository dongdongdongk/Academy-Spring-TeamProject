<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
<c:import url="../template/common_css.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	
	<div class="container-fluid my-5">
		<div class="row mb-4">
			<h3 class="col-md-7 mx-auto text-center border-bottom border-dark pb-4">질문응답등록</h3>
		</div>
	
		<div class="row col-md-7 mx-auto">
			<form class="row g-3" action="./ordersAdd" method="post">
				
  				
  				<div class="col-md-12 mt-5">
    				<label for="title" class="form-label">제목</label>
    				<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요">
  				</div>
  				
  				<div class="col-md-12 mt-5">
    				<label for="info" class="form-label">내용</label>
    				<textarea class="form-control" name="info" id="info" placeholder="내용을 입력하세요"></textarea>
  				</div>

				<div class="row col-md-2 mx-auto mt-5">
					<button type="submit" class="btn btn-primary">글등록</button>
				</div>
			</form>
		</div>
	</div>
	
	<c:import url="../template/common_js.jsp"></c:import>
	<script>
		$("#info").summernote();
	</script>
</body>
</html>