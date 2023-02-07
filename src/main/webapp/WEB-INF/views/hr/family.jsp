<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/tags.jsp" %>
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
			<div class="row mb-3">
				<div class="col-12">
					<h2><p class="fw-bold">가족사항</p></h2>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-3">
					<i class="bi bi-arrow-right-square-fill text-danger"></i> <strong>상세정보</strong>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-12">
					<div class="btn-group" >
						<a href="register" class="btn btn-light px-4">인적사항</a>
						<a href="family" class="btn active btn-light px-4">가족사항</a>
						<a href="education" class="btn btn-light px-4">학력정보</a>
						<a href="order" class="btn btn-light px-4">발령정보</a>
					</div>
				</div>
			</div>
			
			<div class="row" >
					<div class="col text-end mb-3">
						<button type="button" class="btn btn-outline-dark btn-sm" id="btn-del">행삭제</button>
						<button type="button" class="btn btn-outline-dark btn-sm" id="btn-add">행추가</button>
					</div>
				<div class="row">
					<table class="table table-bordered table-hover table-striped table-sm">
						<colgroup>
							<col width="5%">
							<col width="7%">
							<col width="7%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th><input type="checkbox" id="checkbox-all-toggle" onchange="toggleAllCheckUncheck()" ></th>
								<th>성명</th>
								<th>가족관계</th>
								<th>최종학력</th>
								<th>직업</th>
								<th>회사명</th>
								<th>동거여부</th>
								<th>부양가족</th>
								<th>장애인</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-center" id="box-career">
								<td><input type="checkbox" name="skill" ></td>
								<td>홍길동</td>
								<td>배우자</td>
								<td>학사</td>
								<td>회사원</td>
								<td>삼성</td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
								<td><input type="checkbox"></td>
							</tr>												
						</tbody>
					</table>
				</div>
					<div class="row">
						<div class="col text-end">
							<button type="submit" class="btn btn-dark" style="float:right;" id="">저장</button>
						</div>
					</div>		
				</div>
			</div>
		</div>
	</div>
</div>
			
		
				
				
				
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

function toggleAllCheckUncheck() {
	// 전체 선택/해제 체크박스의 체크상태를 조회하다.
	var el = document.querySelector("#checkbox-all-toggle");
	var currentChecked = el.checked;
	
	// 모든 보유기술 체크박스의 체크상태를 위에서 조회한 전체 선택/해제 체크박스의 체크상태와 같은 상태로 만든다.
	var collection = document.querySelectorAll('[name=skill]');
	for (var index = 0; index < collection.length; index++) {
		var el = collection[index];
		el.checked = currentChecked;
	}
}
function checkAll() {
	// 체크박스 전체 선택하기
	var collection = document.querySelectorAll('[name=skill]');
	for (var index = 0; index < collection.length; index++) {
		var el = collection[index];
		el.checked = true;
	}
}
function uncheckAll() {
	// 체크박스 전체 선택하기
	var collection = document.querySelectorAll('[name=skill]');
	for (var index = 0; index < collection.length; index++) {
		var el = collection[index];
		el.checked = false;
	}
}

$(function() {
	$("#btn-add").click(function() {
		
		var skillFieldLength = $("#box-career :input[name=skill]").length;
		if (skillFieldLength >= 5) {
			alert("경력사항 입력필드는 최대 4개까지만 추가 가능합니다.");
			return;
		}
		
		var htmlContent = `
			<div class="row">
				<div class="col-10">
					<input type="text" class="form-control mb-2" name="skill">
				</div>
				<div class="col-2 text-end pt-1">
					<button type="button" class="btn btn-danger btn-xs">삭제</button>
				</div>
			</div>
		`;
		$("#box-career").append(htmlContent);
	});
	
	// <div id="box-career"> 내부에 미래에 추가된 삭제버튼을 클릭했을 실행될 이벤트 핸들러 등록하기
	$("#box-career").on("click", '.btn-danger', function() {
		// this는 클릭이벤트가 발생할 엘리먼트다.
		// $(this) 함수의 실행결과는 this를 포함하는 jQuery객체다.
		
		// .closest('선택자')는 조상 엘리먼트 중에서 지정한 선택자에 해당하는 가장 가까운 조상엘리먼트가 포함된 jQuery객체를 반환한다.
		$(this).closest('.row').remove();
	});
})
</script>
</body>
</html>