<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<title>애플리케이션</title>
</head>
<body>
<c:set var="menu" value="employee" />
<c:set var="side" value="" />
<%@ include file="../common/navbar.jsp" %>
<div class="container">
<div class="row">
	<div class="col-2 bg-dark mr-3">
		<%@ include file="../common/sidebar.jsp" %>
	</div>
	<div class="col-10">
		<form>
			<div class="fs-4 border p-2 bg-light">
				<select>
				
					<option>성명</option>
					<option>직책</option>
					<option>부서</option>
				</select>
				<input type="text"><button class="btn btn-primary float-end">검색</button>
			</div>
			<div class="row">
				<div class="col-3 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>기본정보</strong>
					</p>
				</div>
			</div>
		</form>
		<table class="table">
			<colgroup>
				<col width=""/>
				<col width=""/>
				<col width=""/>
				<col width=""/>
				<col width=""/>
				<col width=""/>
				<col width=""/>
				<col width=""/>
			</colgroup>
			<thead>
				<tr>
					<th  class="table-primary">사원번호</th>
					<th>성명</th>
					<th>직책</th>
					<th>부서</th>
					<th>입사일자</th>
					<th>퇴사일자</th>
					<th>핸드폰</th>
					<th>회사이메일</th>
					<th>주소</th>
					<th>메모</th>
				</tr>
			</thead>
			<tbody>
				<td>1000</td>
				<td>홍길동</td>
				<td>사원</td>
				<td>개발팀</td>
				<td>20220101</td>
				<td>20220102</td>
				<td>010-1234-1234</td>
				<td>hong@gmail.com</td>
				<td>서울시 종로구</td>
				<td>안녕하세요</td>
			</tbody>
		</table>
		
		<div class="row">
				<div class="col-3 text-left mb-1">
					<p>
						<i class="bi bi-arrow-right-square-fill text-danger"></i>
						<strong>상세정보</strong>
					</p>
				</div>
			</div>
			
			<div class="col-12 mb-2">
					<div class="btn-group" >
						<a href="register" class="btn active btn-light px-4">인적사항</a>
						<a href="#" class="btn btn-light px-4">가족사항</a>
						<a href="#" class="btn btn-light px-4">학력정보</a>
						<a href="#" class="btn btn-light px-4">발령정보</a>
					</div>
				</div>
				
   </div>
</div>    
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>