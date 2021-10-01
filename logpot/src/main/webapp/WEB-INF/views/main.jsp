<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.util.Calendar"%>
<%
Calendar cal = Calendar.getInstance();
int y = cal.get(Calendar.YEAR); // 현재 연도
int m = cal.get(Calendar.MONTH); // 현재 월 

cal.set(Calendar.MONTH, -1); // 현재 월 - 1
int prevLastDay = cal.getActualMaximum(Calendar.DATE); // 이전 달 마지막 날짜 

cal.set(y, m, 1); // 현재 연, 월의 1일로 세팅
int onedayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 현재 월의 1일의 요일 (현재 9월의 1일 값: 수요일, 4)
int lastDay = cal.getActualMaximum(Calendar.DATE); // 현재 월의 마지막 날

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/546b6cf0a8.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type=text/css
	href="/logpot/resources/style_calendar.css" />
<title>Main</title>
</head>
<body>

	<div class="leftBox">
		<div class="logo">로고영역</div>

		<!-- 현재 연/월 -->
		<div class="year-month">
			<%=y%>&nbsp;<%=m%>
		</div>

		<!-- 연간 이벤트 d-day-->
		<div class="box-dDay">d-day 영역</div>
		<input type="date">
		<!-- 검색창 -->
		<div class="box-search">
			<i class="fas fa-search" style="overflow: visible;"></i>
			<form action="#" name="frm-search">

				<!-- autocompleate: 자동완성 허용 -->
				<input type="search" name="search" autocomplete="on">
			</form>
		</div>

		<!-- 위젯 창 -->
		<div class="box-widget">위젯 영역</div>

	</div>

	<div class="calendarBox">
		<div class="week">
			<!-- 달력 요일 -->
			<div class="dayOfWeek">일</div>
			<div class="dayOfWeek">월</div>
			<div class="dayOfWeek">화</div>
			<div class="dayOfWeek">수</div>
			<div class="dayOfWeek">목</div>
			<div class="dayOfWeek">금</div>
			<div class="dayOfWeek">토</div>
		</div>

		<!-- 달력 숫자 -->
		<div class="date">
			<!-- 이전 월 날짜 출력 -->
			<c:set var="cnt" value="0" />
			<c:set var="prevLastDay" value="<%=prevLastDay%>" />
			<c:set var="j" value="<%=onedayOfWeek - 1%>" />
			<c:forEach var="i" begin="1" end="${j }">
				<c:set var="j" value="${j - 1 }" />
				<div class="wrapDateBtn">
					<button type="button" class="dateBtn">
						<div class="prevDate">${prevLastDay - j}</div>
						<c:set var="cnt" value="${cnt + 1 }" />
					</button>
				</div>
			</c:forEach>

			<!-- 현재 월 날짜 출력  -->
			<c:forEach var="date" begin="1" end="<%=lastDay%>">
				<c:set var="dateCnt" value="${dateCnt + 1}" />
				<div class="wrapDateBtn">
					<button type="button" class="dateBtn">
						<div class="currentDate">${date }</div>
					</button>
				</div>
			</c:forEach>

			<!-- 다음 월 날짜 출력 -->
			<c:set var="lastdayOfWeek" value="${(cnt + dateCnt) % 7}" />
			<!-- 현재 월 마지막 날짜의 요일 (0 ~ 6) -->
			<c:forEach var="date" begin="1" end="${7 - lastdayOfWeek }">
				<div class="wrapDateBtn">
					<button type="button" class="dateBtn">
						<div class="nextDate">${date }</div>
					</button>
				</div>
			</c:forEach>
		</div>
		<!-- date -->
	</div>
	<!-- calendarBox -->



	<div class="rightBox">
		<!-- 세팅 버튼 -->
		<div class="emptyBox"></div>
		<div class="wrapRightBtn">
		<button class="btn-setting">
			<i class="fas fa-cog"></i>
		</button>
		<!-- 전 월 이동 -->
		<button class="btn-prevMonth">
			<i class="fas fa-angle-up"></i>
		</button>
		<!-- 현재 날짜 이동 -->
		<button class="btn-thisMonth">
			<i class="far fa-calendar-minus"></i>
		</button>
		<!-- 다음 월 이동 -->
		<button class="btn-nextMonth">
			<i class="fas fa-angle-down"></i>
		</button>
		</div>
	</div>

</body>
</html>