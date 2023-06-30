<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<h1>수주 등록하기</h1>
	<form role="form" action="" method="post">
		<table border="1">
			<tr>
				<th>수주처이름</th>
				<td><input type="text" name="cust_name"></td>
				<th>상품명</th>
				<td><input type="text" name="product_name"></td>
				<th>담당자</th>
				<td><input type="text" name="cont_emp"></td>
			</tr>
			<tr>
				<th>수주처코드</th>
				<td><input type="text" name="cust_id"></td>
				<th>상품코드</th>
				<td><input type="text" name="product_id"></td>
				<th>수주일자</th>
				<td><input type="date" name="cont_date"></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
				<th></th>
				<td></td>
				<th>납품일자</th>
				<td><input type="date" name="due_date" onchange="limitDate();"></td>
			</tr>
		</table>
		<input type="button" class="btn btn-success" value="작성완료" onclick="sendForm();">
		<input type="reset" class="btn btn-success" value="초기화">
		<input type="button" class="btn btn-light" value="창닫기" onclick="window.close();">
	</form>
<!-- 	http://localhost:8088/contract/list -->
<!-- 	제이쿼리 -->
	<script>
		function sendForm() {
			//상단의 폼태그를 변수에 저장한다. 
			var formObject = $("form[role='form']").serializeArray();
			var status = true;
			consol.log(formObject);

			
			//작성완료 버튼을 눌렀을 때 ajax를 실행하도록 한다.
			$.ajax({
				url : '/contract/insert',
				type : 'POST',
				data : formObject,
				success : function(json) {
					alert("수주등록이 완료되었습니다.");
					status = true;
					window.opener.location.reload();
					window.close();
				}
			});
		}// sendForm()메소드 끝
		
		
		//납품날짜가 수주날짜보다 늦게 설정하는 메소드 
		function limitDate(){
			
			var contDateInput = document.querySelector('input[name="cont_date"]');
			var dueDateInput = document.querySelector('input[name="due_date"]');
			var contDate = new Date(contDateInput.value);
			var dueDate = new Date(dueDateInput.value);

			if (dueDate > contDate) {
				dueDateInput.value = contDateInput.value;
			}else {
			    contDateInput.value = dueDateInput.value;
		  }

		}//limitDate(); 메소드 끝
	</script>	
</body>
</html>