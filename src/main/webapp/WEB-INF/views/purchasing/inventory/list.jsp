<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">

   function getToday() {
      var date = new Date();
      var year = date.getFullYear();
      var month = ("0" + (1 + date.getMonth())).slice(-2);
      var day = ("0" + date.getDate()).slice(-2);
      
      return year + "-" + month + "-" + day;
   }

   $(function() {
      
      //// 글쓰기 ////////////////////////////////////////////////////////////
      
      $('.writeForm').click(function() {
//         let bno = parseInt($('table').find('td#bno:last').text()) + 1;
  //       console.log(bno);
    
         console.log("글쓰기 등록함");
         
         let regdate = getToday();
         console.log(regdate);
         
         if($(this).hasClass('true')) {
         
            let tbl = "<tr>";
            tbl += " <td>";
            tbl += "  <input type='text' name='ma_id' id='ma_id'>";
            tbl += " </td>";       
            tbl += "  <input type='text' name='ma_name' id='ma_name'>";
            tbl += " <td>";
            tbl += "  <input type='text' name='whs_num' id='whs_num'>";
            tbl += " </td>";
            tbl += " <td>";
            tbl += regdate;
            tbl += " </td>";
            tbl += "</tr>";
            
            $('table').append(tbl);
            
            
            $(this).removeClass('writeForm').addClass('write');
            $(this).removeClass('true');
            $(this).text("등록");
         
         }
         
         
         
         $('.write').click(function() {
//             e.stopPropagation();
            console.log("글쓰기 등록함");
            
            let ma_id = $('#ma_id').val();
            let ma_name = $('#ma_name').val();
            
            console.log(ma_id==="" || ma_name==="");
            
            if(ma_id==="" || ma_name==="") {
               alert("빈칸을 입력하세요");
//                return false;
//                continue;
//                break;
            } else {
               
               $.ajax({
                  url: "./list",
                  type: "post",
                  data: {ma_id:ma_id, ma_name:ma_name},
                  success: function() {
                     alert("등록완료");
                     location.reload();
                  },
                  error: function() {
                     alert("error");
                  }
               }); //ajax
            } //if-else
            
         }); //write click
      
//          return false;
      }); //writeForm click
      
     // }); delete click
      
   }); //jQuery
   
</script>

</head>
<body>
		
		   <h1> board_list.jsp </h1>
   <button class="writeForm true">글쓰기</button>
   
   <table border="1">
      <tr>
         <th> 품목명 </th>
         <th> 품목코드 </th>
         <th> 창고번호 </th>
      </tr>
      
      <c:forEach var="in" items="${inventoryList }">
         <tr>
          <%--   <td><input type="checkbox" name="selected" value="${dto.bno }"></td> --%>
          <%--   <td id="bno"> ${dto.bno } </td>
            <td><a href="./BoardContent.bo?bno=${dto.bno }"> ${dto.subject } </a></td> --%>
            <td> ${in.ma_name } </td>
            <td> ${in.ma_id } </td>
            <td> ${in.whs_num } </td>
         </tr>
      </c:forEach>
   </table>
			
</body>
</html>