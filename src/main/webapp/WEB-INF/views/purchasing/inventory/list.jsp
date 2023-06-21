<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">

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
         let bno = parseInt($('table').find('td#bno:last').text()) + 1;
         console.log(bno);
         
         let regdate = getToday();
         console.log(regdate);
         
         if($(this).hasClass('true')) {
         
            let tbl = "<tr>";
            tbl += " <td>";
            tbl += " </td>";
            tbl += " <td>";
            tbl += bno;
            tbl += " </td>";
            tbl += " <td>";
            tbl += "  <input type='text' name='subject' id='subject'>";
            tbl += " </td>";
            tbl += " <td>";
            tbl += "  <textarea name='content' id='content'></textarea>";
            tbl += " </td>";
            tbl += " <td>";
            tbl += regdate;
            tbl += " </td>";
            tbl += " <td>";
            tbl += 0;
            tbl += " </td>";
            tbl += "</tr>";
            
            $('table').append(tbl);
            
            
            $(this).removeClass('writeForm').addClass('write');
            $(this).removeClass('true');
            $(this).text("등록");
         
         }
         
         
         
         $('.write').click(function() {
//             e.stopPropagation();
            
            let subject = $('#subject').val();
            let content = $('#content').val();
            
            console.log(subject==="" || content==="");
            
            if(subject==="" || content==="") {
               alert("제목과 내용을 입력하세요");
//                return false;
//                continue;
//                break;
            } else {
               
               $.ajax({
                  url: "./list",
                  type: "post",
                  data: {subject:subject, content:content},
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
      
      
      
      //// 삭제 ////////////////////////////////////////////////////////////
      //delete click
      
   }); //jQuery
   
</script>

</head>
<body>
   <h1> board_list.jsp </h1>
   <button class="writeForm true">글쓰기</button>
   <button id="delete">삭제</button>
   
   <table border="1">
      <tr>
         <th> 선택 </th>
         <th> 글번호 </th>
         <th> 제목 </th>
         <th> 내용 </th>
         <th> 등록일 </th>
         <th> 조회수 </th>
      </tr>
      
      <c:forEach var="dto" items="${boardList }">
         <tr>
            <td><input type="checkbox" name="selected" value="${dto.bno }"></td>
            <td id="bno"> ${dto.bno } </td>
            <td><a href="./BoardContent.bo?bno=${dto.bno }"> ${dto.subject } </a></td>
            <td> ${dto.content } </td>
            <td> ${dto.date } </td>
            <td> ${dto.readcount } </td>
         </tr>
      </c:forEach>
      
   </table>
   

</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

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
            tbl += "<input type='text' name='ma_name' id='ma_name'>";
            tbl += "</td>"; 
            tbl += " <td>";
            tbl += "<input type='text' name='ma_id' id='ma_id'>";
            tbl += "</td>";
            tbl += " <td>";
            tbl += "<input type='text' name='whs_num' id='whs_num'>";
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
//                return false;
//                continue;
//                break;
            } else {
               
               $.ajax({
                  url: "list",
                  type: "post",
                  data: {ma_id:ma_id, ma_name:ma_name, whs_num:whs_num},
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
         <th> 날짜 </th>
      </tr>
      
      <c:forEach var="in" items="${inventoryList }">
         <tr>
            <td> ${in.ma_name } </td>
            <td> ${in.ma_id } </td>
            <td> ${in.whs_num } </td>	
         </tr>
      </c:forEach>
   </table>
			
</body>
</html>