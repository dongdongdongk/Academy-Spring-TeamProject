<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='utf-8' />
    <title>동영상 강좌 서비스</title>
    <c:import url="./template/tempcss.jsp"></c:import>
    <c:import url="./template/common_css.jsp"></c:import>
    <style>
    #calendar-wrapper {
    text-align: center;
    margin-top: 70px;
    margin-bottom: 60px;
    width: 100%;
    display: table;
  }
    #calendar {
        width: 800px;
        height: 800px;
        display: inline-block;
 }
    </style>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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
	<!--달력 입니다 건들지마세요-->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>
    <script>

        document.addEventListener('DOMContentLoaded', function() {
          let calendarEl = document.getElementById('calendar');
          let calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth'
          });
          calendar.render();
        });
  
      </script>
      <link href='/fullcalendar/main.css' rel='stylesheet' />
    <script src='/fullcalendar/main.js'></script>
    <script>
    	document.addEventListener('DOMContentLoaded', function() {
        	var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
                headerToolbar: {
                    left: 'prevYear,prev,next,nextYear today',
                    center: 'title',
                    right: 'dayGridMonth,dayGridWeek,dayGridDay'
                },

                selectable: true,
                selectMirror: true,

                navLinks: true, // can click day/week names to navigate views
                editable: true,
                // Create new event
                select: function (arg) {
                    Swal.fire({
                        html: "<div class='mb-7'>Create new event?</div><div class='fw-bold mb-5'>Event Name:</div><input type='text' class='form-control' name='event_name' />",
                        icon: "info",
                        showCancelButton: true,
                        buttonsStyling: false,
                        confirmButtonText: "Yes, create it!",
                        cancelButtonText: "No, return",
                        customClass: {
                            confirmButton: "btn btn-primary",
                            cancelButton: "btn btn-active-light"
                        }
                    }).then(function (result) {
                        if (result.value) {
                            var title = document.querySelector("input[name=;event_name']").value;
                            if (title) {
                                calendar.addEvent({
                                    title: title,
                                    start: arg.start,
                                    end: arg.end,
                                    allDay: arg.allDay
                                })
                            }
                            calendar.unselect()
                        } else if (result.dismiss === "cancel") {
                            Swal.fire({
                                text: "Event creation was declined!.",
                                icon: "error",
                                buttonsStyling: false,
                                confirmButtonText: "Ok, got it!",
                                customClass: {
                                    confirmButton: "btn btn-primary",
                                }
                            });
                        }
                    });
                },

                // Delete event
                eventClick: function (arg) {
                    Swal.fire({
                        text: "Are you sure you want to delete this event?",
                        icon: "warning",
                        showCancelButton: true,
                        buttonsStyling: false,
                        confirmButtonText: "Yes, delete it!",
                        cancelButtonText: "No, return",
                        customClass: {
                            confirmButton: "btn btn-primary",
                            cancelButton: "btn btn-active-light"
                        }
                    }).then(function (result) {
                        if (result.value) {
                            arg.event.remove()
                        } else if (result.dismiss === "cancel") {
                            Swal.fire({
                                text: "Event was not deleted!.",
                                icon: "error",
                                buttonsStyling: false,
                                confirmButtonText: "Ok, got it!",
                                customClass: {
                                    confirmButton: "btn btn-primary",
                                }
                            });
                        }
                    });
                },
                dayMaxEvents: true, // allow "more" link when too many events
                // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
                events: [
                    {
                    title: '정보처리기사 1회 필기 원서접수',
                    start: '2023-01-10',
                    end: '2023-01-13'
                    },
                    {
                    title: '정보처리기사 1회 필기 시험',
                    start: '2023-02-13',
                    end: '2023-02-25'
                    },
                    {
                    title: '정보처리기사 1회 필기 시험 합격자 발표',
                    start: '2023-03-21'
                    },
                    {
                    groupId: 999,
                    title: '정보처리기사 1회 실기 원서접수',
                    start: '2023-03-28',
                    end: '2023-03-31'
                    },
                    {
                    title: '정보처리기사 1회 실기 시험',
                    start: '2023-04-23'
                    },
                    {
                    groupId: 999,
                    title: '정보처리기사 1회 실기 합격자 발표',
                    start: '2023-06-09'
                    },
                    {
                    groupId: 999,
                    title: '정보처리기사 2회 필기 원서접수',
                    start: '2023-04-17',
                    end: '2023-04-20'
                    },
                    {
                    title: '정보처리기사 2회 필기 시험',
                    start: '2023-05-13',
                    end: '2023-05-20'
                    },
                    {
                    title: '정보처리기사 2회 필기 시험 합격자 발표',
                    start: '2023-06-14'
                    },
                    {
                    groupId: 999,
                    title: '정보처리기사 2회 실기 원서접수',
                    start: '2023-06-27',
                    end: '2023-06-30'
                    },
                    {
                    title: '정보처리기사 2회 실기 시험',
                    start: '2023-07-22'
                    },
                    {
                    groupId: 999,
                    title: '정보처리기사 2회 실기 합격자 발표',
                    start: '2023-09-01'
                    },
                    {
                    title: '정보처리기사 3회 필기 원서접수',
                    start: '2023-06-19',
                    end: '2023-06-22'
                    },
                    {
                    title: '정보처리기사 3회 필기 시험',
                    start: '2023-07-08',
                    end: '2023-07-23'
                    },
                    {
                    title: '정보처리기사 3회 필기 시험 합격자 발표',
                    start: '2023-08-02'
                    },
                    {
                    groupId: 999,
                    title: '정보처리기사 3회 실기 원서접수',
                    start: '2023-09-04',
                    end: '2023-09-07'
                    },
                    {
                    title: '정보처리기사 3회 실기 시험',
                    start: '2023-10-07'
                    },
                    {
                    groupId: 999,
                    title: '정보처리기사 3회 실기 합격자 발표',
                    start: '2023-11-15'
                    },
                    {
                    groupId: 999,
                    title: '장현서 교수 생신',
                    start: '2023-06-16'
                    },
                ]
            });

            calendar.render();
        });

    </script>
    <!--달력 입니다 건들지마세요-->
</head>
<body>
    <div class="hero-content">
        <header class="site-header">
            <div class="top-header-bar">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-lg-6 d-none d-md-flex flex-wrap justify-content-center justify-content-lg-start mb-3 mb-lg-0">
                            <div class="header-bar-email d-flex align-items-center">
                                <i class="fa fa-envelope"></i><a href="#">Academy@gmail.com</a>
                            </div><!-- .header-bar-email -->

                            <div class="header-bar-text lg-flex align-items-center">
                                <p><i class="fa fa-phone"></i>010-1234-5678 </p>
                            </div><!-- .header-bar-text -->
                        </div><!-- .col -->
                        
                        <div class="col-12 col-lg-6 d-flex flex-wrap justify-content-center justify-content-lg-end align-items-center">
                            <!-- <div class="header-bar-search">
                                <form class="flex align-items-stretch">
                                    <input type="search" placeholder="무엇을 배우고 싶습니까?">
                                    <button type="submit" value="" class="flex justify-content-center align-items-center"><i class="fa fa-search"></i></button>
                                </form>
                            </div>.header-bar-search -->

                            <div class="header-bar-menu">
                                <ul class="flex justify-content-center align-items-center py-2 pt-md-0">
	                                <c:if test="${empty member}">
	                                    <li><a href="/member/memberAgree">회원가입</a></li>
	                                    <li><a href="/member/memberLogin">로그인</a></li>
	                                </c:if>
	                                <c:if test="${not empty member}">
	                                	<span id="login_log" style="border-bottom: 1px solid white;">${member.id} 님, 환영합니다.</span>
	                                	<c:if test="${member.roleDTO.roleName eq 'ADMIN'}">
	                                		<li><a id="adminPage" href="/member/adminPage">관리자페이지</a></li>
	                                	</c:if>
	                                	<c:if test="${member.roleDTO.roleName eq 'MEMBER'}">
	                                		<li><a href="/member/memberPage">마이페이지</a></li>
	                                	</c:if>
	                                    <li><a href="/member/memberLogout">로그아웃</a></li>
	                                </c:if>
                                </ul>
                            </div><!-- .header-bar-menu -->
                        </div><!-- .col -->
                    </div><!-- .row -->
                </div><!-- .container-fluid -->
            </div><!-- .top-header-bar -->

            <div class="nav-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-9 col-lg-3">
                            <div class="site-branding">
                                <h1 class="site-title"><a href="/" rel="home">Acade<span>my</span></a></h1>
                            </div><!-- .site-branding -->
                        </div><!-- .col -->
                        <div class="col-3 col-lg-9 flex justify-content-end align-content-center" id="gnb">
                            <nav class="site-navigation flex justify-content-end align-items-center">
                                <ul class="flex flex-column flex-lg-row justify-content-lg-end align-content-center">
                                    <li class="current-menu-item"><a href="/">Home</a></li>
                                    <li><a href="/template/about">About</a></li>
                                    <li><a href="/product/list">수강신청</a></li>
                                </ul>

                                <div class="dropdown">
                                    <button class="dropbtn">고객센터</button>
                                    <div class="dropdown-view">
                                        <ul class="dropdown-content">
                                            <li><a href="/cr/crList">수강후기</a></li>
                                            <li><a href="/notice/list">공지사항</a></li>
                                            <li><a href="/qna/qnaList">질문응답</a></li>
                                            <li><a href="/event/list">이벤트</a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="hamburger-menu d-lg-none">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div><!-- .hamburger-menu -->

                                <div class="header-bar-cart">
                                    <a href="/cart/cartList?id=${member.id}" class="flex justify-content-center align-items-center"><span aria-hidden="true" class="icon_bag_alt"></span></a>
                                </div><!-- .header-bar-search -->
                            </nav><!-- .site-navigation -->
                        </div><!-- .col -->
                    </div><!-- .row -->
                </div><!-- .container -->
            </div><!-- .nav-bar -->
        </header><!-- .site-header -->

        <div class="hero-content-overlay">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="hero-content-wrap flex flex-column justify-content-center align-items-start">
                            <header class="entry-header wow fadeInDown" data-wow-delay="0.1s"
                            style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInDown;">
                                <h4>온라인 과정 시작하기</h4>
                                <h1>세상의 모든 배움의 시작</h1>
                            </header><!-- .entry-header -->

                            <div class="entry-content wow fadeInDown" data-wow-delay="0.1s"
                            style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInDown;">
                                <p>어디에서도 찾아볼 수 없었던 특별한 클래스 지금 시작하세요.</p>
                            </div><!-- .entry-content -->

                            <footer class="entry-footer read-more wow fadeInDown" data-wow-delay="0.1s"
                            style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInDown;">
                                <a href="/product/list">더보기</a>
                            </footer><!-- .entry-footer -->
                        </div><!-- .hero-content-wrap -->
                    </div><!-- .col -->
                </div><!-- .row -->
            </div><!-- .container -->
        </div><!-- .hero-content-hero-content-overlay -->
    </div><!-- .hero-content -->
    
    <div class="icon-boxes">
        <div class="container-fluid">
            <div class="flex flex-wrap align-items-stretch">
                <div class="icon-box">
                    <div class="icon wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <span class="ti-user"></span>
                    </div><!-- .icon -->

                    <header class="entry-header">
                        <h2 class="entry-title wow fadeInUp" data-wow-delay="0.1s"
                        style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">전문가에게 배우세요</h2>
                    </header><!-- .entry-header -->

                    <div class="entry-content wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <p>기본에 충실하면서도 개념 하나하나를 놓치지 않는 전문가의 꼼꼼한 설명으로 지금까지 많은 사람들을 훌륭한 개발자로 성장하게 했습니다</p>
                    </div><!-- .entry-content -->

                    <footer class="entry-footer read-more wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <a href="/qna/qnaList">더보기<i class="fa fa-long-arrow-right"></i></a>
                    </footer><!-- .entry-footer -->
                </div><!-- .icon-box -->

                <div class="icon-box">
                    <div class="icon wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <span class="ti-folder"></span>
                    </div><!-- .icon -->

                    <header class="entry-header wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <h2 class="entry-title">모든 강좌 무제한 시청</h2>
                    </header><!-- .entry-header -->

                    <div class="entry-content wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <p>웹사이트에 등록된 모든 무료/유료 강좌를 무제한으로 시청할 수 있습니다.</p>
                    </div><!-- .entry-content -->

                    <footer class="entry-footer read-more wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <a href="/product/list">더보기<i class="fa fa-long-arrow-right"></i></a>
                    </footer><!-- .entry-footer -->
                </div><!-- .icon-box -->

                <div class="icon-box">
                    <div class="icon wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <span class="ti-book"></span>
                    </div><!-- .icon -->

                    <header class="entry-header wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <h2 class="entry-title">비법이 담긴 도서 증정</h2>
                    </header><!-- .entry-header -->

                    <div class="entry-content wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <p>강사의 10년간의 경험이 담긴 소책자를 택배로 배송해드립니다.</p>
                    </div><!-- .entry-content -->

                    <footer class="entry-footer read-more wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <a href="/product/list">더보기<i class="fa fa-long-arrow-right"></i></a>
                    </footer><!-- .entry-footer -->
                </div><!-- .icon-box -->

                <div class="icon-box">
                    <div class="icon wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <span class="ti-world"></span>
                    </div><!-- .icon -->

                    <header class="entry-header wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <h2 class="entry-title">성장을 위한 클래스</h2>
                    </header><!-- .entry-header -->

                    <div class="entry-content wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <p>지금보다 나은 인생을 원하신다면 최고 전문가의 이야기를 들어보세요.</p>
                    </div><!-- .entry-content -->

                    <footer class="entry-footer read-more wow fadeInUp" data-wow-delay="0.1s"
                        style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <a href="/qna/qnaList">더보기<i class="fa fa-long-arrow-right"></i></a>
                    </footer><!-- .entry-footer -->
                </div><!-- .icon-box -->
            </div><!-- .row -->
        </div><!-- .container-fluid -->
    </div><!-- .icon-boxes -->
    <!--달력 입니다 건들지마세요-->
    <div id="calendar-wrapper" class="wow fadeInUp" data-wow-delay="0.1s"
    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
    <div id='calendar'></div>
    </div>
    <!--달력 입니다 건들지마세요-->
    <!-- <section class="featured-courses horizontal-column courses-wrap">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <header class="heading flex justify-content-between align-items-center">
                        <h2 class="entry-title">주요 과정</h2>

                        <a class="btn mt-4 mt-sm-0" href="/product/list">전체 보기</a>
                    </header>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="course-content flex flex-wrap justify-content-between align-content-lg-stretch">
                        <figure class="course-thumbnail">
                            <a href="#"><img src="/resources/images/1.jpg" alt=""></a>
                        </figure>

                        <div class="course-content-wrap">
                            <header class="entry-header">
                                <div class="course-ratings flex align-items-center">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-o"></span>
                                </div>

                                <h2 class="entry-title">전체 Android 개발자 과정</h2>

                                <div class="entry-meta flex flex-wrap align-items-center">
                                    <div class="course-author">김동현</div>

                                    <div class="course-date">2023년 4월 14일</div>
                                </div>
                            </header>

                            <footer class="entry-footer flex justify-content-between align-items-center">
                                <div class="course-cost">
                                    <span class="free-cost">무료</span>
                                </div>
                            </footer>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="course-content flex flex-wrap justify-content-between align-content-lg-stretch">
                        <figure class="course-thumbnail">
                            <img src="/resources/images/2.jpg" alt="">
                        </figure>

                        <div class="course-content-wrap">
                            <header class="entry-header">
                                <div class="course-ratings flex align-items-center">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-o"></span>

                                    <span class="course-ratings-count">(4 votes)</span>
                                </div>

                                <h2 class="entry-title">웹 디자인에 대해</h2>

                                <div class="entry-meta flex flex-wrap align-items-center">
                                    <div class="course-author">장현서</div>

                                    <div class="course-date">2023년 4월 14일</div>
                                </div>
                            </header>

                            <footer class="entry-footer flex justify-content-between align-items-center">
                                <div class="course-cost">
                                    32000원 <span class="price-drop">59000원</span>
                                </div>
                            </footer>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->

    <section class="about-section">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-6 align-content-lg-stretch">
                    <header class="heading wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <h2 class="entry-title">정보처리기사 실기 파이널</h2>

                        <p>제대로 배우고 제대로 놀아봅시다. 무기력했던 생활에 활력을 불어넣어요 어디에서도 찾아볼 수 없었던 특별한 클래스 지금 시작하세요.</p>
                    </header><!-- .heading -->

                    <div class="entry-content ezuca-stats">
                        <div class="stats-wrap flex flex-wrap justify-content-lg-between wow fadeInUp" data-wow-delay="0.1s"
                        style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="stats-count">
                                50<span>M+</span>
                                <p>학습 중인 학생</p>
                            </div><!-- .stats-count -->

                            <div class="stats-count">
                                30<span>K+</span>
                                <p>활성 과정</p>
                            </div><!-- .stats-count -->

                            <div class="stats-count">
                                340<span>M+</span>
                                <p>강사 온라인</p>
                            </div><!-- .stats-count -->

                            <div class="stats-count">
                                20<span>+</span>
                                <p>국가 도달</p>
                            </div><!-- .stats-count -->
                        </div><!-- .stats-wrap -->
                    </div><!-- .ezuca-stats -->
                </div><!-- .col -->

                <div class="col-12 col-lg-6 flex align-content-center mt-5 mt-lg-0">
                    <div class="ezuca-video position-relative wow fadeInUp" data-wow-delay="0.1s"
                    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <div class="video-play-btn position-absolute" onclick="OpenWindow('https://www.wannaedu.com/template/viewer.jsp?id=223&lid=305811', '새 창', 800, 600)">
                            <!-- <button onclick="OpenWindow('https://www.wannaedu.com/template/viewer.jsp?id=223&lid=305811', '새 창', 800, 600)" > -->
                            <img src="/resources/images/bbuu3333.png" alt=""> 
                        <!-- </button> -->
                            
                        </div><!-- .video-play-btn -->
                        
                        <img src="/resources/images/4444.jpg" alt="">
                    </div><!-- .ezuca-video -->
                </div><!-- .col -->
            </div><!-- .row -->
        </div><!-- .container -->
    </section><!-- .about-section -->

    <section class="testimonial-section">
        <!-- Swiper -->
        <div class="swiper-container testimonial-slider ">
            <div class="swiper-wrapper wow fadeInUp" data-wow-delay="0.1s"
            style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                <div class="swiper-slide ">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-lg-6 order-2 order-lg-1 flex align-items-center mt-5 mt-lg-0">
                                <figure class="user-avatar">
                                    <img src="/resources/images/11.png" alt="">
                                </figure><!-- .user-avatar -->
                            </div><!-- .col -->

                            <div class="col-12 col-lg-6 order-1 order-lg-2 content-wrap h-100">
                                <div class="entry-content">
                                    <p>필기 합격 이후 실기 후기로 다시 찾아 뵙게 되었습니다! 여러분들 인강 꼭 들으세요!!!수제비 인강은 여러분들 합격에 큰 힘이 될 겁니다!!!</p>
                                </div><!-- .entry-content -->

                                <div class="entry-footer">
                                    <h3 class="testimonial-user">정*인 - <span>Goodee Academy</span></h3>
                                </div><!-- .entry-footer -->
                            </div><!-- .col -->
                        </div><!-- .row -->
                    </div><!-- .container -->
                </div><!-- .swiper-slide -->

                <div class="swiper-slide">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-lg-6 order-2 order-lg-1 flex align-items-center mt-5 mt-lg-0">
                                <figure class="user-avatar">
                                    <img src="/resources/images/22.png" alt="">
                                </figure><!-- .user-avatar -->
                            </div><!-- .col -->

                            <div class="col-12 col-lg-6 order-1 order-lg-2 content-wrap h-100">
                                <div class="entry-content">
                                    <p>직장에서 필요하기도 하고 밀린 숙제같이 왜 그때 안 땄을까하는 후회가 되는 정처기였는데 늦은 나이에 도전하게 되었습니다.</p>
                                </div><!-- .entry-content -->

                                <div class="entry-footer">
                                    <h3 class="testimonial-user">윈* - <span>Goodee Academy</span></h3>
                                </div><!-- .entry-footer -->
                            </div><!-- .col -->
                        </div><!-- .row -->
                    </div><!-- .container -->
                </div><!-- .swiper-slide -->

                <div class="swiper-slide">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-lg-6 flex order-2 order-lg-1 align-items-center mt-5 mt-lg-0">
                                <figure class="user-avatar">
                                    <img src="/resources/images/33.png" alt="">
                                </figure><!-- .user-avatar -->
                            </div><!-- .col -->

                            <div class="col-12 col-lg-6 order-1 order-lg-2 content-wrap h-100">
                                <div class="entry-content">
                                    <p>4학년 많고 많은 고민과 진로에 대한 방황이 이는 시기에 정보 처리 기사라는 자격증을 접하게 되었고 이에 대한 시작을 하게 되었습니다</p>
                                </div><!-- .entry-content -->

                                <div class="entry-footer">
                                    <h3 class="testimonial-user">이*훈 - <span>Goodee Academy</span></h3>
                                </div><!-- .entry-footer -->
                            </div><!-- .col -->
                        </div><!-- .row -->
                    </div><!-- .container -->
                </div><!-- .swiper-slide -->
            </div><!-- .swiper-wrapper -->

            <div class="container">
                <div class="row">
                    <div class="col-12 col-lg-6 mt-5 mt-lg-0">
                        <div class="swiper-pagination position-relative flex justify-content-center align-items-center"></div>
                    </div><!-- .col -->
                </div><!-- .row -->
            </div><!-- .container -->
        </div><!-- .testimonial-slider -->
    </section><!-- .testimonial-section -->

    <section class="featured-courses vertical-column courses-wrap">
        <div class="container">
            <div class="row mx-m-25 wow fadeInUp" data-wow-delay="0.1s"
            style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                <div class="col-12 px-25">
                    <header class="heading flex flex-wrap justify-content-between align-items-center">
                        <h2 class="entry-title">주요 과정</h2>

                        <nav class="courses-menu mt-3 mt-lg-0">
                            <ul class="flex flex-wrap justify-content-md-end align-items-center">
                                <li class="active">All</li>
                                <li>Java</li>
                                <li>C</li>
                                <li>Python</li>
                                <li>Database</li>
                            </ul>
                        </nav><!-- .courses-menu -->
                    </header><!-- .heading -->
                </div><!-- .col -->

                <div class="col-12 col-md-6 col-lg-4 px-25">
                    <div class="course-content">
                        <figure class="course-thumbnail">
                            <img src="/resources/images/스크린샷 2023-04-10 114359.png" alt="">
                        </figure><!-- .course-thumbnail -->

                        <div class="course-content-wrap">
                            <header class="entry-header">
                                <h2 class="entry-title">전체 Android 개발자 과정</h2>

                                <div class="entry-meta flex align-items-center">
                                    <div class="course-author">박**</div>

                                    <div class="course-date">2023년 4월 14일</div>
                                </div><!-- .course-date -->
                            </header><!-- .entry-header -->

                            <footer class="entry-footer flex justify-content-between align-items-center">
                                <div class="course-cost">
                                    45000원 <span class="price-drop">68000원</span>
                                </div><!-- .course-cost -->

                                <div class="course-ratings flex justify-content-end align-items-center">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-o"></span>
                                </div><!-- .course-ratings -->
                            </footer><!-- .entry-footer -->
                        </div><!-- .course-content-wrap -->
                    </div><!-- .course-content -->
                </div><!-- .col -->

                <div class="col-12 col-md-6 col-lg-4 px-25">
                    <div class="course-content">
                        <figure class="course-thumbnail">
                            <img src="/resources/images/스크린샷 2023-04-10 114350.png" alt="">
                        </figure><!-- .course-thumbnail -->

                        <div class="course-content-wrap">
                            <header class="entry-header">
                                <h2 class="entry-title">자바과정 초급에서 고급으로</h2>

                                <div class="entry-meta flex align-items-center">
                                    <div class="course-author">이**</div>

                                    <div class="course-date">2023년 4월 14일</div>
                                </div><!-- .course-date -->
                            </header><!-- .entry-header -->

                            <footer class="entry-footer flex justify-content-between align-items-center">
                                <div class="course-cost">
                                    <span class="free-cost">30000원</span>
                                </div><!-- .price-drop -->

                                <div class="course-ratings flex justify-content-end align-items-center">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-o"></span>
                                </div><!-- .course-ratings -->
                            </footer><!-- .entry-footer -->
                        </div><!-- .course-content-wrap -->
                    </div><!-- .course-content -->
                </div><!-- .col -->

                <div class="col-12 col-md-6 col-lg-4 px-25">
                    <div class="course-content">
                        <figure class="course-thumbnail">
                           <img src="/resources/images/스크린샷 2023-04-10 114409.png" alt="">
                        </figure><!-- .course-thumbnail -->

                        <div class="course-content-wrap">
                            <header class="entry-header">
                                <h2 class="entry-title">전체 디지털 마케팅 과정</h2>

                                <div class="entry-meta flex align-items-center">
                                    <div class="course-author">정**</div>

                                    <div class="course-date">2023년 4월 14일</div>
                                </div><!-- .course-date -->
                            </header><!-- .entry-header -->

                            <footer class="entry-footer flex justify-content-between align-items-center">
                                <div class="course-cost">
                                    55000원<span class="price-drop">78000원</span>
                                </div><!-- .course-cost -->

                                <div class="course-ratings flex justify-content-end align-items-center">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-o"></span>

                                </div><!-- .course-ratings -->
                            </footer><!-- .entry-footer -->
                        </div><!-- .course-content-wrap -->
                    </div><!-- .course-content -->
                </div><!-- .col -->

                <div class="col-12 col-md-6 col-lg-4 px-25">
                    <div class="course-content">
                        <figure class="course-thumbnail">
                          <img src="/resources/images/스크린샷 2023-04-10 114325.png" alt="">
                        </figure><!-- .course-thumbnail -->

                        <div class="course-content-wrap">
                            <header class="entry-header">
                                <h2 class="entry-title">언리얼 엔진 개발자 과정</h2>

                                <div class="entry-meta flex align-items-center">
                                    <div class="course-author">장현서</div>

                                    <div class="course-date">2023년 4월 14일</div>
                                </div><!-- .course-date -->
                            </header><!-- .entry-header -->

                            <footer class="entry-footer flex justify-content-between align-items-center">
                                <div class="course-cost">
                                    <span class="free-cost">40000원</span>
                                </div><!-- .course-cost -->

                                <div class="course-ratings flex justify-content-end align-items-center">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-o"></span>
                                </div><!-- .course-ratings -->
                            </footer><!-- .entry-footer -->
                        </div><!-- .course-content-wrap -->
                    </div><!-- .course-content -->
                </div><!-- .col -->

                <div class="col-12 col-md-6 col-lg-4 px-25">
                    <div class="course-content">
                        <figure class="course-thumbnail">
                           <img src="/resources/images/스크린샷 2023-04-10 114233.png" alt="">
                        </figure><!-- .course-thumbnail -->

                        <div class="course-content-wrap">
                            <header class="entry-header">
                                <h2 class="entry-title"><a href="#">Progressive Web Apps</a></h2>

                                <div class="entry-meta flex align-items-center">
                                    <div class="course-author">장현서</div>

                                    <div class="course-date">2023년 4월 14일</div>
                                </div><!-- .course-date -->
                            </header><!-- .entry-header -->

                            <footer class="entry-footer flex justify-content-between align-items-center">
                                <div class="course-cost">
                                    38000원<span class="price-drop">48000원</span>
                                </div><!-- .course-cost -->

                                <div class="course-ratings flex justify-content-end align-items-center">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-o"></span>

                                </div><!-- .course-ratings -->
                            </footer><!-- .entry-footer -->
                        </div><!-- .course-content-wrap -->
                    </div><!-- .course-content -->
                </div><!-- .col -->

                <div class="col-12 col-md-6 col-lg-4 px-25">
                    <div class="course-content">
                        <figure class="course-thumbnail">
                            <img src="/resources/images/스크린샷 2023-04-10 114313.png" alt="">
                        </figure><!-- .course-thumbnail -->

                        <div class="course-content-wrap">
                            <header class="entry-header">
                                <h2 class="entry-title">암호화폐 투자 강좌 2023</h2>

                                <div class="entry-meta flex align-items-center">
                                    <div class="course-author">장현서</div>

                                    <div class="course-date">2023년 4월 14일</div>
                                </div><!-- .course-date -->
                            </header><!-- .entry-header -->

                            <footer class="entry-footer flex justify-content-between align-items-center">
                                <div class="course-cost">
                                    <span class="free-cost">35000원</span>
                                </div><!-- .course-cost -->

                                <div class="course-ratings flex justify-content-end align-items-center">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star-o"></span>

                                </div><!-- .course-ratings -->
                            </footer><!-- .entry-footer -->
                        </div><!-- .course-content-wrap -->
                    </div><!-- .course-content -->
                </div><!-- .col -->

                <div class="col-12 px-25 flex justify-content-center">
                    <a class="btn" href="/product/list">전체 강의 보기</a>
                </div><!-- .col -->
            </div><!-- .row -->
        </div><!-- .container -->
    </section><!-- .courses-wrap -->

    <section class="latest-news-events">
        <div class="container wow fadeInUp" data-wow-delay="0.1s"
        style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
            <div class="row">
                <div class="col-12">
                    <header class="heading flex justify-content-between align-items-center">
                        <h2 class="entry-title">최신 뉴스 & 이벤트</h2>
                    </header><!-- .heading -->
                </div><!-- .col -->

                <div class="col-12 col-lg-6">
                    <div class="featured-event-content">
                        <figure class="event-thumbnail position-relative m-0">
                            <a href="/event/list"><img src="/resources/images/event-1.jpg" alt=""></a>

                            <div class="posted-date position-absolute">
                                <div class="day">23</div>
                                <div class="month">4</div>
                            </div><!-- .posted-date -->
                        </figure><!-- .event-thumbnail -->

                        <header class="entry-header flex flex-wrap align-items-center">
                            <h2 class="entry-title"><a href="#">전체 재무 분석가 교육 및 투자 과정</a></h2>

                            <div class="event-location"><i class="fa fa-map-marker"></i>40 Baria Sreet 133/2 NewYork City, US</div>

                            <div class="event-duration"><i class="fa fa-calendar"></i>2023년 4월 14일</div>
                        </header><!-- .entry-header -->
                    </div><!-- .featured-event-content -->
                </div><!-- .col -->

                <div class="col-12 col-lg-6 mt-5 mt-lg-0">
                    <div class="event-content flex flex-wrap justify-content-between align-content-stretch">
                        <figure class="event-thumbnail">
                            <a href="/event/list"><img src="/resources/images/event-2.jpg" alt=""></a>
                        </figure><!-- .course-thumbnail -->

                        <div class="event-content-wrap">
                            <header class="entry-header">
                                <div class="posted-date">
                                    <i class="fa fa-calendar"></i> 2023년 4월 14일
                                </div><!-- .posted-date -->

                                <h2 class="entry-title"><a href="#">맞춤형 온라인 학습 경험</a></h2>

                                <div class="entry-meta flex flex-wrap align-items-center">
                                    <div class="post-author"><a href="#">장현서</a></div>
                                </div><!-- .entry-meta -->
                            </header><!-- .entry-header -->

                            <div class="entry-content">
                                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.</p>
                            </div><!-- .entry-content -->
                        </div><!-- .event-content-wrap -->
                    </div><!-- .event-content -->

                    <div class="event-content flex flex-wrap justify-content-between align-content-lg-stretch">
                        <figure class="event-thumbnail">
                            <a href="/event/list"><img src="/resources/images/event-3.jpg" alt=""></a>
                        </figure><!-- .course-thumbnail -->

                        <div class="event-content-wrap">
                            <header class="entry-header">
                                <div class="posted-date">
                                    <i class="fa fa-calendar"></i> 2023년 4월 14일
                                </div><!-- .posted-date -->

                                <h2 class="entry-title">우리 회사는 어떤 투자 프로젝트를 선택해야 하나요?</h2>

                                <div class="entry-meta flex flex-wrap align-items-center">
                                    <div class="post-author">장현서</div>
                                </div><!-- .entry-meta -->
                            </header><!-- .entry-header -->

                            <div class="entry-content">
                                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.</p>
                            </div><!-- .entry-content -->
                        </div><!-- .event-content-wrap -->
                    </div><!-- .event-content -->
                </div><!-- .col -->
            </div><!-- .row -->
        </div><!-- .container -->
    </section><!-- .latest-news-events -->

    <section class="home-gallery wow fadeInUp" data-wow-delay="0.1s"
    style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
        <div class="gallery-wrap flex flex-wrap">
            <div class="gallery-grid gallery-grid1x1">
                <img src="/resources/images/a.jpg" alt="">
            </div><!-- .gallery-grid -->

            <div class="gallery-grid gallery-grid1x1">
                <img src="/resources/images/b.jpg" alt="">
            </div><!-- .gallery-grid -->

            <div class="gallery-grid gallery-grid2x2">
                <img src="/resources/images/c.jpg" alt="">
            </div><!-- .gallery-grid -->

            <div class="gallery-grid gallery-grid1x1">
                <img src="/resources/images/d.jpg" alt="">
            </div><!-- .gallery-grid -->

            <div class="gallery-grid gallery-grid1x1">
                <img src="/resources/images/e.jpg" alt="">
            </div><!-- .gallery-grid -->

            <div class="gallery-grid gallery-grid2x1">
                <img src="/resources/images/g.jpg" alt="">
            </div><!-- .gallery-grid -->

            <div class="gallery-grid gallery-grid2x1">
                <img src="/resources/images/h.jpg" alt="">
            </div><!-- .gallery-grid -->

            <div class="gallery-grid gallery-grid1x1">
                <img src="/resources/images/i.jpg" alt="">
            </div><!-- .gallery-grid -->

            <div class="gallery-grid gallery-grid2x2 ">
                <img src="/resources/images/j.jpg" alt="">
            </div><!-- .gallery-grid -->

            <div class="gallery-grid gallery-grid1x1">
                <img src="/resources/images/k.jpg" alt="">
            </div><!-- .gallery-grid -->

            <div class="gallery-grid gallery-grid1x1">
                <img src="/resources/images/l.jpg" alt="">
            </div><!-- .gallery-grid -->

            <div class="gallery-grid gallery-grid2x1">
                <img src="/resources/images/m.jpg" alt="">
            </div><!-- .gallery-grid -->
            <div class="gallery-grid gallery-grid2x1">
                <img src="/resources/images/자연10.png" alt="">
            </div><!-- .gallery-grid -->
            <div class="gallery-grid gallery-grid1x1">
                <a href="#"><img src="/resources/images/o.jpg" alt=""></a>
            </div><!-- .gallery-grid -->
           

            <!-- <div class="gallery-grid gallery-grid3x1">
                <a href=""><img src="/resources/images/n.jpg" alt=""></a>
            </div> -->
            <!-- <div class="gallery-grid gallery-grid1x1">
                <a href="#"><img src="/resources/images/o.jpg" alt=""></a>
            </div> -->
        </div><!-- .gallery-wrap -->
    </section><!-- .home-gallery -->

    <div class="clients-logo">
        <div class="container">
            <div class="row">
                <div class="col-12 flex flex-wrap justify-content-center justify-content-lg-between align-items-center">
                    <div class="logo-wrap">
                        <img src="/resources/images/logo-1.png" alt="">
                    </div><!-- .logo-wrap -->

                    <div class="logo-wrap">
                        <img src="/resources/images/logo-2.png" alt="">
                    </div><!-- .logo-wrap -->

                    <div class="logo-wrap">
                        <img src="/resources/images/logo-3.png" alt="">
                    </div><!-- .logo-wrap -->

                    <div class="logo-wrap">
                        <img src="/resources/images/logo-4.png" alt="">
                    </div><!-- .logo-wrap -->

                    <!-- <div class="logo-wrap">
                        <img src="/resources/images/logo-5.png" alt="">
                    </div> -->
                </div><!-- .col -->
            </div><!-- .row -->
        </div><!-- .container -->
    </div><!-- .clients-logo -->

    <footer class="site-footer">
        <div class="footer-widgets">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-6 col-lg-3">
                        <div class="foot-about">
                            <h1><a href="/" rel="home">Acade<span>my</span></a></h1>

                            <p>세상의 모든 배움의 시작 Academy</p>

                            <p class="footer-copyright"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                        </div><!-- .foot-about -->
                    </div><!-- .col -->

                    <div class="col-12 col-md-6 col-lg-3 mt-5 mt-md-0">
                        <div class="foot-contact">
                            <h2>상담문의</h2>

                            <ul>
                                <li>Email: Academy@gmail.com</li>
                                <li>Phone: 1000-1234</li>
                                <li>Address: 서울특별시 금천구 가산디지털1로 151(가산동, 세진 이노플렉스1차) 306호</li>
                            </ul>
                        </div><!-- .foot-contact -->
                    </div><!-- .col -->

                    <div class="col-12 col-md-6 col-lg-3 mt-5 mt-lg-0">
                        <div class="quick-links flex flex-wrap">
                            <h2 class="w-100">빠른 링크</h2>

                            <ul class="w-50">
                                <li><a href="/cr/crList">수강후기</a></li>
                                <li><a href="/product/list">강의&책</a></li>
                                <li><a href="/notice/list">공지사항</a></li>
                                <li><a href="/qna/qnaList">질문&응답</a></li>
                            </ul>

                            <ul class="w-50">
                                <li><a href="/">메인화면</a></li>
                                <li><a href="/event/list">이벤트</a></li>
                                <li><a href="/template/about">About</a></li>
                                <li><a href="#">Instructor</a></li>
                            </ul>
                        </div><!-- .quick-links -->
                    </div><!-- .col -->

                    <div class="col-12 col-md-6 col-lg-3 mt-5 mt-lg-0">
                        <div class="follow-us">
                            <h2>Follow</h2>

                            <ul class="follow-us flex flex-wrap align-items-center">
                                <li><a href="https://ko-kr.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://www.google.com/"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
                            </ul>
                        </div><!-- .quick-links -->
                    </div><!-- .col -->
                </div><!-- .row -->
            </div><!-- .container -->
        </div><!-- .footer-widgets -->

      
                </div><!-- .row -->
            </div><!-- .container -->
        </div><!-- .footer-bar -->
    </footer><!-- .site-footer -->

<c:import url="./template/topBtn.jsp"></c:import>
<c:import url="./template/common_js.jsp"></c:import>
<c:import url="./template/tempjs.jsp"></c:import>
<script type='text/javascript' src='/resources/js/jquery.js'></script>
<script type='text/javascript' src='/resources/js/swiper.min.js'></script>
<script type='text/javascript' src='/resources/js/masonry.pkgd.min.js'></script>
<script type='text/javascript' src='/resources/js/jquery.collapsible.min.js'></script>
<script type='text/javascript' src='/resources/js/custom.js'></script>
<script type='text/javascript' src='/resources/js/homeScreen.js'></script>

</body>
</html>

