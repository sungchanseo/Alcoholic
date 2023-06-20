<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	
	
	<!-- (수정중) 생산 목록 중 ‘생산량 >= 수주량’ => 작업상태가 완료인 작업지시만 나타남 -->
	<script>
	$(function(){
		var production_state = $('#production_state').val();
		var state0 = "대기";
		var state1 = "진행중";
		console.log(production_state);
		
		if( production_state == state0 || production_state == state1){
			$(".qualityListResult").hide();
		}
		});
	</script>
	
	<!-- 등록 버튼 보이기 제어 -->
	<script>
// 		$(function(){
// 			var emp_id = $('#emp_id').val();
// 			console.log(emp_id);
			
// 			if(emp_id != "2023001"){
// 				$("#qualityInsertBT").hide();
// 			}
// 			});
	</script>
	
	
<title>품질 관리 목록</title>
</head>
<body>
	<h2>품질 관리 현황</h2>
	<input type="hidden" id="emp_id" name="emp_id" value=" ${sessionScope.emp_id}">
	
<%-- 	${productionList } --%>
	
	<!-- 검색 -->
	<div class="Qusearch">
	<form name="QuCategory" action="" method="post">
	<select class="Qusearch_select" name="searchType">
		<option value="검수번호">검수번호</option>
		<option value="작업지시번호">작업지시번호</option>
		<option value="생산라인">생산라인</option>
		<option value="검수자">검수자</option>
		<option value="검수완료일">검수완료일</option>
	</select>
	<input type="text" class="Qusearch_input" name="searchName">	
	<button type="submit">검색</button>
	</form>
	</div>
	
	<!-- 관리자에게만 보이는 검수등록 버튼 -->
	<input type="button" id="qualityInsertBT" value="검수 등록"
		onclick="window.open('/quality/qualityInsert', '_blank', 'width=600, height=500, left=2000');">
	
	<!-- 품질관리현황표 출력 -->
	<div class="qualityList">
	<table border='1'>
		<thead>
			<tr>
				<th>검수번호</th>
				<th>작업지시번호</th>
				<th>생산라인</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>생산량</th>
				<th>검수량</th>
				<th>불량수량</th>
				<th>불량률</th>
				<th>검수자</th>
				<th>검수완료일시</th>
				<th>검수상태</th>
			</tr>
		</thead>
		<tbody>	            
			<c:forEach var="vo" items="${productionList }">
				<!-- 나중에 불필요한거 정리할 예정 -->
				<input type="hidden" id="production_qty" name="production_qty" value=" ${vo.production_qty}">
				<input type="hidden" id="plan_qty" name="plan_qty" value=" ${vo.plan_qty}">
				<input type="hidden" id="production_state" name="production_state" value=" ${vo.production_state}">
			<tr class="qualityListResult">
				<td><a href="/quality/qualityInfo?qc_num=${vo.qc_num }" onclick="window.open(this.href, '_blank', 'width=800, height=500, left=2000'); return false;">${vo.qc_num  }</a></td>
				<td><a href="/production/info?production_id=${vo.production_id }">${vo.production_id }</a></td>
				<td>${vo.production_line }</td>
				<td>${vo.product_id }</td>
				<td>${vo.product_name }</td>
				<td>${vo.production_qty }</td>
				<td>${vo.qc_qty }</td>
				<td>${vo.def_qty }</td>
				<td><fmt:formatNumber value="${(vo.def_qty /vo.qc_qty*100) }" pattern="#.###"/></td>
				<td>${vo.qc_emp }</td>
				<td>${vo.qc_date }</td>
				<td>${vo.qc_state }</td>
			</tr>
			</c:forEach>
	</tbody>
	</table>
	</div>
</body>
</html>