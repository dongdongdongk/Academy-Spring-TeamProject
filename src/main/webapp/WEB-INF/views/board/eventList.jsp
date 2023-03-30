<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />

        <!DOCTYPE html>
        <html>

        <head>
            <title>Hello World</title>

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
            <c:import url="../template/common_css.jsp"></c:import>
        </head>

        

        <body class="courses-page">
            <div class="page-header">
                <header class="site-header">
                    <div class="top-header-bar">
                        <div class="container-fluid">
                            <div class="row">
                                <div
                                    class="col-12 col-lg-6 d-none d-md-flex flex-wrap justify-content-center justify-content-lg-start mb-3 mb-lg-0">
                                    <div class="header-bar-email d-flex align-items-center">
                                        <i class="fa fa-envelope"></i><a href="#">tuanna.design@gmail.com</a>
                                    </div><!-- .header-bar-email -->

                                    <div class="header-bar-text lg-flex align-items-center">
                                        <p><i class="fa fa-phone"></i>001-1234-88888 </p>
                                    </div><!-- .header-bar-text -->
                                </div><!-- .col -->

                                <div
                                    class="col-12 col-lg-6 d-flex flex-wrap justify-content-center justify-content-lg-end align-items-center">
                                    <div class="header-bar-search">
                                        <form class="flex align-items-stretch">
                                            <input type="search" placeholder="What would you like to learn?">
                                            <button type="submit" value=""
                                                class="flex justify-content-center align-items-center"><i
                                                    class="fa fa-search"></i></button>
                                        </form>
                                    </div><!-- .header-bar-search -->

                                    <div class="header-bar-menu">
                                        <ul class="flex justify-content-center align-items-center py-2 pt-md-0">
                                            <li><a href="#">Register</a></li>
                                            <li><a href="#">Login</a></li>
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
                                        <h1 class="site-title"><a href="index.html" rel="home">Ezu<span>ca</span></a>
                                        </h1>
                                    </div><!-- .site-branding -->
                                </div><!-- .col -->

                                <div class="col-3 col-lg-9 flex justify-content-end align-content-center">
                                    <nav class="site-navigation flex justify-content-end align-items-center">
                                        <ul
                                            class="flex flex-column flex-lg-row justify-content-lg-end align-content-center">
                                            <li class="current-menu-item"><a href="index.html">Home</a></li>
                                            <li><a href="#">About</a></li>
                                            <li><a href="#">Courses</a></li>
                                            <li><a href="#">blog</a></li>
                                            <li><a href="#">Contact</a></li>
                                        </ul>

                                        <div class="hamburger-menu d-lg-none">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </div><!-- .hamburger-menu -->

                                        <div class="header-bar-cart">
                                            <a href="#" class="flex justify-content-center align-items-center"><span
                                                    aria-hidden="true" class="icon_bag_alt"></span></a>
                                        </div><!-- .header-bar-search -->
                                    </nav><!-- .site-navigation -->
                                </div><!-- .col -->
                            </div><!-- .row -->
                        </div><!-- .container -->
                    </div><!-- .nav-bar -->
                </header><!-- .site-header -->









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








            <ul class="nav justify-content-center grey lighten-4 py-4">
                <li class="nav-item">
                    <a class="nav-link active" id="allEvent">전체</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="continueEvent">진행중</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="endEvent">종료</a>
                </li>
            </ul>



            <!-- 현재날짜 -->
            <c:set var="now" value="<%=new java.util.Date()%>" />
            <c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 

            <c:out value="${today}" />




            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumbs">
                            <ul class="flex flex-wrap align-items-center p-0 m-0">
                                <li><a href="/"><i class="fa fa-home"></i> 홈</a></li>
                                <li>이벤트</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-7col-lg-8">
                       <div id="eventResult">
                            <div class="featured-courses courses-wrap">
                                <div class="row mx-m-25">
                                
                                    <c:forEach items="${list}" var="dto">
                                        <div class="col-3 col-md-3 px-25">
                                            <div class="course-content">
                                                <figure class="course-thumbnail">
                                                    <c:set var="loop_flag" value="false" />
                                                    <c:forEach items="${dto.eventFileDTOs}" var="fileDTO">
                                                        <c:if test="${today > dto.endDate}">
                                                            <c:if test="${not loop_flag }">
                                                                <c:if test="${not empty dto.eventFileDTOs}">
                                                                    <img class="radius grayscale" src="../resources/upload/event/${fileDTO.fileName}">
                                                                    <c:set var="loop_flag" value="true" />
                                                                </c:if>
                                                            </c:if>
                                                        </c:if>                
                                                        
                                                        
                                                            <c:if test="${not loop_flag }">
                                                                <c:if test="${not empty dto.eventFileDTOs}">
                                                                    <img class="radius" src="../resources/upload/event/${fileDTO.fileName}">
                                                                    <c:set var="loop_flag" value="true" />
                                                                </c:if>
                                                            </c:if>
                                                        
                                                   
                                                   
                                                    </c:forEach>
                            
                                                </figure>
                            
                                                <div class="course-content-wrap">
                                                    <header class="entry-header">
                                                        <h2 class="entry-title"><a
                                                                href="./detail?num=${dto.num}">${dto.title}</a>
                            
                                                            <c:set var="loop_flag" value="false" />
                                                            <c:forEach items="${dto.eventFileDTOs}" var="fileDTO">
                                                                <c:if test="${not loop_flag }">
                                                                    <c:if test="${fileDTO.oriName ne null}"><img
                                                                            class="material-symbols-outlined"
                                                                            src="/resources/images/file_icon.gif">
                                                                        <c:set var="loop_flag" value="true" />
                                                                    </c:if>
                                                                </c:if>
                                                            </c:forEach>
                                                            </td>
                                                        </h2>
                            
                            
                            
                                                        <div class="entry-meta flex flex-wrap align-items-center">
                                                            <div class="course-author"><a href="#">${dto.writer} </a>
                                                            </div>
                                                            <div id="startDate" data-start-event="${dto.startDate}" class="course-date">시작일${dto.startDate}</div>
                                                            <div id="endDate" data-end-event="${dto.endDate}" class="course-date">종료일${dto.endDate}</div>
                                                            <div class="course-date">조회수${dto.hit}</div>
                                                        </div>
                                                    </header>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div> 


                        <div class="row">
                            <div class="d-felx justify-content-center">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination d-felx justify-content-center">

                                        <li class="page-item ${pager.before ? 'disabled' : ''}">
                                            <a class="page-link" href="#" aria-label="Previous" data-board-page="1">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>

                                        <li class="page-item ${pager.before ? 'disabled' : ''}">
                                            <a class="page-link" href="#" aria-label="Previous"
                                                data-board-page="${pager.startNum-1}">
                                                <span aria-hidden="true">&lsaquo;</span>
                                            </a>
                                        </li>

                                        <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                                            <li class="page-item"><a class="page-link" href="#"
                                                    data-board-page="${i}">${i}</a></li>
                                        </c:forEach>

                                        <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
                                            <a class="page-link" href="#" aria-label="Next"
                                                data-board-page="${pager.lastNum+1}">
                                                <span aria-hidden="true">&rsaquo;</span>
                                            </a>
                                        </li>

                                        <li class="page-item ${pager.after eq false ? 'disabled' : ''}">
                                            <a class="page-link" href="#" aria-label="Next"
                                                data-board-page="${pager.totalPage}">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div><!-- .col -->


                </div><!-- .row -->
            </div><!-- .container -->
            <a href="./add">글쓰기</a>

            <div class="clients-logo">
                <div class="container">
                    <div class="row">
                        <div
                            class="col-12 flex flex-wrap justify-content-center justify-content-lg-between align-items-center">
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

                            <div class="logo-wrap">
                                <img src="/resources/images/logo-5.png" alt="">
                            </div><!-- .logo-wrap -->
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
                                    <a class="foot-logo" href="#"><img src="/resources/images/foot-logo.png" alt=""></a>

                                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia dese
                                        mollit anim id est laborum. </p>

                                    <p class="footer-copyright">
                                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        Copyright &copy;
                                        <script>document.write(new Date().getFullYear());</script> All rights reserved |
                                        This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by
                                        <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    </p>
                                </div><!-- .foot-about -->
                            </div><!-- .col -->

                            <div class="col-12 col-md-6 col-lg-3 mt-5 mt-md-0">
                                <div class="foot-contact">
                                    <h2>Contact Us</h2>

                                    <ul>
                                        <li>Email: info.deertcreative@gmail.com</li>
                                        <li>Phone: (+88) 111 555 666</li>
                                        <li>Address: 40 Baria Sreet 133/2 NewYork City, US</li>
                                    </ul>
                                </div><!-- .foot-contact -->
                            </div><!-- .col -->

                            <div class="col-12 col-md-6 col-lg-3 mt-5 mt-lg-0">
                                <div class="quick-links flex flex-wrap">
                                    <h2 class="w-100">Quick Links</h2>

                                    <ul class="w-50">
                                        <li><a href="#">About </a></li>
                                        <li><a href="#">Terms of Use </a></li>
                                        <li><a href="#">Privacy Policy </a></li>
                                        <li><a href="#">Contact Us</a></li>
                                    </ul>

                                    <ul class="w-50">
                                        <li><a href="#">Documentation</a></li>
                                        <li><a href="#">Forums</a></li>
                                        <li><a href="#">Language Packs</a></li>
                                        <li><a href="#">Release Status</a></li>
                                    </ul>
                                </div><!-- .quick-links -->
                            </div><!-- .col -->

                            <div class="col-12 col-md-6 col-lg-3 mt-5 mt-lg-0">
                                <div class="follow-us">
                                    <h2>Follow Us</h2>

                                    <ul class="follow-us flex flex-wrap align-items-center">
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    </ul>
                                </div><!-- .quick-links -->
                            </div><!-- .col -->
                        </div><!-- .row -->
                    </div><!-- .container -->
                </div><!-- .footer-widgets -->

                <div class="footer-bar">
                    <div class="container">
                        <div class="row flex-wrap justify-content-center justify-content-lg-between align-items-center">
                            <div class="col-12 col-lg-6">
                                <div
                                    class="download-apps flex flex-wrap justify-content-center justify-content-lg-start align-items-center">
                                    <a href="#"><img src="/resources/images/app-store.png" alt=""></a>
                                    <a href="#"><img src="/resources/images/play-store.png" alt=""></a>
                                </div><!-- .download-apps -->

                            </div>

                            <div class="col-12 col-lg-6 mt-4 mt-lg-0">
                                <div class="footer-bar-nav">
                                    <ul
                                        class="flex flex-wrap justify-content-center justify-content-lg-end align-items-center">
                                        <li><a href="#">DPA</a></li>
                                        <li><a href="#">Terms of Use</a></li>
                                        <li><a href="#">Privacy Policy</a></li>
                                    </ul>
                                </div><!-- .footer-bar-nav -->
                            </div><!-- .col-12 -->
                        </div><!-- .row -->
                    </div><!-- .container -->
                </div><!-- .footer-bar -->
            </footer><!-- .site-footer -->

            <c:import url="../template/common_js.jsp"></c:import>
            <script src="../resources/js/pageing.js"></script>
            <script type='text/javascript' src='/resources/js/jquery.js'></script>
            <script type='text/javascript' src='/resources/js/swiper.min.js'></script>
            <script type='text/javascript' src='/resources/js/masonry.pkgd.min.js'></script>
            <script type='text/javascript' src='/resources/js/jquery.collapsible.min.js'></script>
            <script type='text/javascript' src='/resources/js/custom.js'></script>
            <script type='text/javascript' src='/resources/js/eventDate.js'></script>
        </body>

        </html>