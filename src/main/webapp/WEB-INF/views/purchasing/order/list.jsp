<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

   function getToday() {
      var date = new Date();
      
      var year = date.getFullYear();
      console.log(year);
      var month = ("0" + (1 + date.getMonth())).slice(-2);
      console.log(month);
      var day = ("0" + date.getDate()).slice(-2);
      console.log(day);
      return year + "-" + month + "-" + day;
   }
   
   function getOrderToday() {
	      var date = new Date();
	      var year = date.getFullYear();
	      console.log(year);
	      var month = ("0" + (1 + date.getMonth())).slice(-2);
	      console.log(month);
	      var day = ("0" + date.getDate()).slice(-2);
	      console.log(day);
	      return year + "-" + month + "-" + day;
	   }
   function getYesterday(){
		var today = new Date();
		var date = new Date(today.setDate(today.getDate()-1));
		var year = date.getFullYear();
		var year = String(year);
		var yy = year.substring(2,4);
		var mon = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);
		var yesterday = yy + mon + day;
		return yesterday;
	}
// DB에 있는 입고번호 최대값 + 1
   function addNumber(){	
		
		// maxNumber가 없을 때 (입고번호 첫 등록)
		var maxNumber = "${maxNumber }";
		if(maxNumber == ""){
			maxNumber = getToday() + "000";
			console.log("************ (if)전달받은 maxNumber =  " + maxNumber); // 230620001
		}else{	// 있을 때
			maxNumber = "${maxNumber}";
			console.log("************ (else)전달받은 maxNumber =  " + maxNumber);
		}
		
		// 다음 번호 생성
		var nextNumber = Number(maxNumber) + 1;  			
		console.log("************ nextNumber =  " + nextNumber); // 230620002
		console.log("************ nextNumber타입 =  " + typeof nextNumber); // number
		
		return nextNumber;
	}
// 입고번호 자동넘버링
   $(document).ready(function(){
   		
   		// 날짜 정보 저장
   		var today = getToday();
   		var yesterday = getYesterday();
   		
   		
   		// order_id 정보 저장       
   		var order_id = "${param.order_id }";
   		console.log("************ order_id = " + order_id); // OK

   		
   		// maxDate 정보 저장
   		// maxDate가 없을 때 -> 입고번호 첫 등록
   		var maxDate = "${maxDate }";
   		if(maxDate ==  null){
   			maxDate = today;
   			console.log("******************* (if)maxDate = " + maxDate); // 230620
   		}else{	// 있을 때
   	        maxDate = "${maxDate }";
   			console.log("******************* (else)maxDate = " + maxDate);
   		}

   		
   		
   		// nextNumber 정보 저장
   		// DB 날짜와 어제 날짜가 같을 때 초기화
   		// 다르면 입고번호 + 1
   		if(maxDate == yesterday){ // 230619 230619
   			var nextNumber = today + "001"; // 230620001
   			console.log("******************* (초기화)nextNumber = " + nextNumber);
   		}else{
   			var nextNumber = addNumber();
   		}
   		
   		
   		// endNumber 정보 저장
   		// 끝에 3자리 출력
   		var endNumber = String(nextNumber).substr(6);			  
   		console.log("******************* endNumber = " + endNumber);	// 002
   		console.log("******************* endNumber 타입 = " + typeof endNumber);  // string
   			
   			
   		// 입고번호 조합 & 생성
   		var in_id = "OR" + today + endNumber;
   		alert(in_id + ", 입고처리가 완료되었습니다.");
   		
   		
   		// ajax 사용 controller에 정보 전달
   		$.ajax({
   				url: "inid",
   				type: 'post',
   				data: {
   					in_id:in_id,
   					order_id:order_id
   				},
   				success: function(data){
   					location.href = "/purchasing/order/list";
   				},
   				error: function(){
   					alert("error");	
   				}
   		}); // ajax
   	
   }); // JQuery


   $(function() {
      
      //// 글쓰기 ////////////////////////////////////////////////////////////
      
      $('.writeForm').click(function() {
    
         console.log("글쓰기 등록함");
         
         let regdate = getToday();
         console.log(regdate);
         if($(this).hasClass('true')) {
        
            let tbl = "<tr>";
            tbl += " <td>";
            tbl += "";
            tbl += "</td>"; 
            tbl += " <td>";
            tbl += "<input type='text' name='ma_id' id='ma_id'>";
            tbl += "</td>";
            tbl += " <td>";
            tbl += "<input type='text' name='ma_name' id='ma_name'>";
            tbl += "</td>";
            tbl += " <td>";
            tbl += "<input type='text' name='ma_qty' id='ma_qty'>";
            tbl += "</td>";
            tbl += "<td>";
            tbl += "";
            tbl += "</td>";
            tbl += "<td>";
            tbl += regdate;
            tbl += "</td>";
            tbl += "</tr>";
            
            $('table').append(tbl);
            
            
            $(this).removeClass('writeForm').addClass('write');
            $(this).removeClass('true');
            $(this).text("등록");
         
         }
         
         
         
         $('.write').click(function() {
//             e.stopPropagation();
            console.log("글쓰기 등록함");
            
            var ma_id = $('#ma_id').val();
            var ma_name = $('#ma_name').val();
            var whs_num = $('#whs_num').val();
            console.log(ma_id);
            console.log(ma_name);
            console.log(whs_num);
            console.log(ma_id==="" || ma_name==="");

            
            if(ma_id==="" || ma_name==="") {
               alert("빈칸을 입력하세요");
            } else {
               $.ajax({
                  url: "list",
                  type: "post",
                  data: {ma_id:ma_id, ma_name:ma_name, whs_num:whs_num},
                 success: function() {
                	 location.href="/purchasing/inventory/list"
                     alert("등록완료");
                  },
                  error: function() {
                     alert("error");
                  }
               }); //ajax
            } //if-else
            
         }); //write click
      
      }); //writeForm click

   }); //jQuery
</script>
<body>
<button class="writeForm true">행추가</button>
<table border="1">
			<tr>
				<th>발주번호</th>
				<th>품번</th>
				<th>품명</th>
				<th>수량</th>
				<th>부가세</th>
				<th>발주일자</th>
				<th>납기일자</th>
				<th>입고일자</th>
				<th>입고창고</th>
				<th>단가</th>
				<th>총액</th>
				<th>담당직원</th>
			</tr>
			<c:forEach var="order" items="${orderList}">
				<tr>
				    <td>${order.order_id}</td>
					<td>${order.ma_id}</td>
					<td>${order.order_maName}</td>
					<td>${order.order_qty}</td>
					<td>${order.order_vat}</td>
					<td>${order.order_date}</td>
					<td>${order.due_date}</td>
					<td>${order.in_date}</td>		
					<td>${order.whs_num}</td>
					<td>${order.order_unitCost}</td>
					<td>${order.order_sum}</td>
					<td>${order.order_emp}</td>
				</tr>
			</c:forEach>
		</table>
		<a href="/purchasing/order/insert">발주등록</a>

</body>
</html>