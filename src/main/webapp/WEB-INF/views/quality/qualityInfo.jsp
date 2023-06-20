<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<title>검수 상세보기</title>
</head>
<body>
	<h1>검수 상세 보기</h1>
<%-- 	${vo } --%>
	<div class="qualityInfo">
	<table border="1">
		<tbody>
			<tr>
				<th>검수번호</th>
				<td>${vo.qc_num }</td>
				<th>상품명</th>
				<td>${vo.product_name }</td>
				<th>검수량</th>
				<td>${vo.qc_qty }</td>
				<th>불량코드</th>
				<td>${vo.def_code }</td>
			</tr>
			<tr>
				<th>작업지시번호</th>
				<td>${vo.production_id }</td>
				<th>상품코드</th>
				<td>${vo.product_id }</td>
				<th>검수자</th>
				<td>${vo.qc_emp }</td>
				<th>불량수량</th>
				<td>${vo.def_qty }</td>
			</tr>
			<tr>
				<th>생산라인</th>
				<td>${vo.production_line }</td>
				<th>생산량</th>
				<td>${vo.production_qty }</td>
				<th>검수완료일시</th>
				<td>${vo.qc_date }</td>
				<th>불량률</th>
				<td><fmt:formatNumber value="${(vo.def_qty /vo.qc_qty*100) }" pattern="#.###"/></td>
			</tr>
		
	</tbody>
	</table>
	</div>
</body>
</html>