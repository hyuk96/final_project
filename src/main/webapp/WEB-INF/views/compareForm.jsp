<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <style>        
            table{
                width: 500px;
                height: 100px;
                border: 1px solid black;
                margin-left: auto;
                margin-right: auto;
                margin-top: 100px;
                text-align: left;
                padding: 10px;
            }      
            #compare{
            	position: relative;
            	float: right;
            }
      </style>
      <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   </head>
   <body>
        <table>  
            <tr>
                <th>비교하기</th>
                <td colspan="2">
	               A <select id="first" onclick="fdel()">
                        <c:forEach items="${compare}" var="hname">
							<option value="${hname.idx}">${hname.h_name}</option>
				        </c:forEach>
	                 </select>
                
	                B <select id="second" onclick="sdel()">
                        <c:forEach items="${compare}" var="hname">
							<option value="${hname.idx}">${hname.h_name}</option>
				        </c:forEach>
	                  </select>
               <button onclick="apply()" >비교하기</button>    
            </tr>
        </table><!--성별, 선호도 name, value 값 변경. 현재는 임시-->  
	        
<%--         <c:forEach items="${compare}" var="hname">
        	${hname.idx}
        	${hname.h_name}
        </c:forEach> --%>
        
        <table>
			<tr id="ab"></tr>		
		</table>
		

		
   </body>
   <script>
   
      function fdel(){
         var sel = document.getElementById("first");
         var val = sel.options[sel.selectedIndex].value;
         console.log(val);
         if(val !=""){
            $('#second').empty();
            reop();
            $("#second option[value="+val+"]").remove();
         }
      }
      
      function sdel(){
          var sel = document.getElementById("second");
          var val = sel.options[sel.selectedIndex].value;
          console.log(val);
          if(val !=""){
             $('#first').empty();
             seop();
             $("#first option[value="+val+"]").remove();
          }
       }
      
      //A 버튼 눌렀을 때 B쪽에서 값 빼기
      function reop(){
/*     	  var comparelenth = ${comparelenth};
          console.log("확인용"+comparelenth);
          console.log("확인용"+compare); */
         $('#second').append('<c:forEach items="${compare}" var="hname"><option value="${hname.idx}">${hname.h_name}</option></c:forEach>');
    	  
	    /*  $('#second').append("<option></option>");
         $('#second').append("<option value='지하철'>지하철</option>");
         $('#second').append("<option value='공원'>공원</option>");
         $('#second').append("<option value='병원'>병원</option>"); */
      }
      
      //B 버튼 눌렀을 때 A쪽에서 값 빼기
      function seop(){
    	  $('#first').append('<c:forEach items="${compare}" var="hname"><option value="${hname.idx}">${hname.h_name}</option></c:forEach>');
      }
      
     function apply(){
    	  
    	  var first = $('#first').val();
    	  var second = $('#second').val();
    	  
    	  console.log(first);
    	  console.log(second);
    	  
	      $.ajax({
	    	  url:'compareAjax',
	    	  type:'GET',
	    	  dataType:'JSON',
	    	  data:{"first":first,
	    		  "second":second},
	    	  success:function(d){
	    		  console.log(d);
	    		  //console.log(d.compare);
	    		  //console.log(d.compare.length);
	    		  console.log("아작스 됨");  
	    		 var str = "<tr>";
	    		 for(var i=0; i< d.compare.length; i++){
	    			  console.log(d.compare[0].H_NAME);
	    			  str += '<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+d.compare[i].H_NAME+'</td>';
	    		  }
	    		 str +='</tr>';
	    		 $('#ab').empty();
	             $('#ab').append(str);
	             str = "";
	    	  },error:function(e){
	    		  console.log(e);
	    		  console.log("실패");
	    	  }
	      });
      } 
   </script>
</html>
