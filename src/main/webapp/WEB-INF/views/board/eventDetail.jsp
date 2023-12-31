<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
</head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">

<!-- FontAwesome CSS -->
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">

<!-- ElegantFonts CSS -->
<link rel="stylesheet" href="/resources/css/elegant-fonts.css">

<!-- themify-icons CSS -->
<link rel="stylesheet" href="/resources/css/themify-icons.css">

<!-- Swiper CSS -->
<link rel="stylesheet" href="/resources/css/swiper.min.css">

<!-- Styles -->
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/event.css">
<c:import url="../template/common_css.jsp"></c:import>      
<c:import url="../template/header.jsp"></c:import>
<body class="courses-page">
        <div class="page-header">
            <div class="page-header-overlay">
                <div class="container">
                    <div class="row">
                         <div class="col-12">
                            <header class="entry-header">
                                <h1>이벤트</h1>
                            </header><!-- .entry-header -->
                        </div><!-- .col -->
                    </div><!-- .row -->
                </div><!-- .container -->
            </div><!-- .page-header-overlay -->
        </div><!-- .page-header -->

	<div class="container-fluid my-5">
		<div class="event_contents">
			<div class="event_view">
				<div class="view_title">
					<h3 hidden="">${dto.num}</h3>
					<h3>
				<c:choose>
					<c:when test="${dto.endDate.after(dto.regDate)}">
					
					<!-- 등록일이 종료일보다 늦은 경우 -->
					<span class="bgColor category">진행중</span>
				</c:when>
				<c:when test="${dto.regDate.after(dto.endDate)}">
					<!-- 종료일이 등록일보다 늦은 경우 -->
					<span class="bgColor1 category">종료</span>
				</c:when>
				</c:choose>	
						${dto.title}
						
			
					</h3>
					<ul>
						<li>
							<span>작성자</span>
							${dto.writer}
						</li>
						<li>
							|
						</li>
						<li>
							<span>작성일</span>
							${dto.regDate}
						</li>
						<li>
							|
						</li>
						<li>
							<span>조회수</span>
							${dto.hit}
						</li>
					</ul>
				</div>
				
				<h3>${dto.contents}</h3>

				<c:if test="${not empty member}">
					<c:if test="${member.roleDTO.roleName eq 'ADMIN'}">
						<a class="btn" href= "./delete?num=${dto.num}">삭제</a>
						<a class="btn" href= "./update?num=${dto.num}">수정</a>
					</c:if>
				</c:if>

				<a class="btn" href= "./list">목록</a>
			</div>
		</div>
	</div>

<c:import url="../template/topBtn.jsp"></c:import>
<c:import url="../template/kakao.jsp"></c:import>	
<c:import url="../template/bottom.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>