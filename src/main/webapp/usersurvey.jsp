<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"  %>
<%@ page import="user.*, survey.*" %>
<%@ page import='java.io.PrintWriter' %>


<%@ page import='user.UserDAO' %>
<%@ page import='java.lang.reflect.Method' %>
<!DOCTYPE html>
<html>
<head>
<style>
      .titleName{
            margin-top:30px;
             margin-left: 700px;
            width:900px;
            float :center;
            border:none;
            font-size:70px;
            font-weight:bold;
            text-align:center;
      }
      .description{
            display: block;
             width: 100%;
             padding: .375rem .75rem;
             font-size: 1rem;
             line-height: 1.5;
             color: #e9ecef;
             background-color: #dee2e6;
             background-clip: padding-box;
             border: 1px solid #ced4da;
             border-radius: .25rem;
             transition: 
      
      }
      .btn-colr{
              margin-top: 60px;
            background-color: #1ABC9C;
      }
      .delbtn{
            margin-top: 60px;
      }
      .subbtn{
            background-color: #212529;
            float:right;
            margin-top: 60px;
      }
      .tester{
            height:10px;
            float:right;
      }
	 .profileImg{
         width: 100px;
         float: right;
         margin-left: -30px;
      }
      .createBtn{
      	 bottom: 60px;
      	 left:100px;
         width: 200px;
         position: fixed;
         right:30px;
         background-color: #A4B2FF;
         color: white;
         border: none;
       
         font-weight: bold;
         font-size: 25px;
         
         padding: 17px 30px 15px 30px;
         box-shadow: 3px 3px 5px grey;
      }
      .formNameSection{
         width:800px;
         margin:0 auto;
         font-size:30px;
      }
      .formName{
         font-size: 30px;
         padding-left: 10px;
         background-color: #EEEEEE;
         width: 480px;
         height: 55px;
         border: none;
      }
      ::placeholder {
          color: #A0A0A0;
      }
      
      .questionDiv{
         background-color: white;
         width: 80%;
         margin: auto;
         margin-top: 90px;
         padding: 20px;
         border-radius: 15px;
         border: 2px solid #E3E3E3;
      }
      .firstSet{
       
         width: 100%;
         text-align: left;
      }
      .questionDelete{
         display: inline;
         background-color: #6c757d;
         padding: 15px 18px 15px 18px;
         color: white;
         margin-left: 10px;
         font-weight: bold;
      }
      .questionContent{
  
         background-color: #E3E5F3;
         width: 400px;
         font-size: 24px;
         border: none;
         border-radius: 10px;
         padding: 10px;

      }
      .questionOpt{
         float: right;
         background-color: #dee2e6;
         height: 50px;
         width: 150px;
         
         padding: 10px;
         text-align: center;
      
         font-size: 20px;
         appearance: none;
      }
      .arrow{
         float: right;
         margin-top: -38px;
      }
      .questionText{
         font-size: 24px;
         width: 98%;
         height: 40px;
        
         margin-top: 20px;
         border: none;
         border-bottom: 2px solid lightgrey;
      }
      
      .questionRadio{
         margin-top: 20px;
         text-align: left;
      }
      .optionBox{
         border: none;
         font-size: 23px;
         width: 300px;
      }
      .radioCircle{
         width: 17px;
         height: 17px;
      }
      .optionDelete{
         display: inline;
         background-color: #6c757d;
         padding: 3px 8px 3px 8px;         
         color: white;
         margin-left: 2px;
         font-weight: bold;
      }
      .addOption{
         color: #6c757d;
         font-size: 20px;
         margin-left: -2px;
      }
      
      .submitBtn{
         width:200px;
        
         right:47px;
         position: fixed;
         bottom: 60px;
         color: white;
         
         
         margin-right: 25px;
         margin-top: 120px;
         background-color: #212529;
         color: white;
         border: none;

         font-weight: bold;
         font-size: 25px;
         
         padding: 17px 30px 15px 30px;
         box-shadow: 3px 3px 5px grey;
      }
      .footer{
         width: 100%;
         position: fixed;
         bottom: 30px;
      }
</style>
	<meta http-equiv="Content-Tyep" content="text/html" charset="UTF-8">
	<!-- meta data add  -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"> 
	
	<title>Survey Service</title>
	<!-- Bootstrap insert -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<!-- custom CSS insert -->
	<link rel="stylesheet" href="../css/custom.css?ver=1">
	<style type="text/css">
		a, a:hover{
			color: #000000;
			text-decoration: none;
		}
	</style>
</head>
<body>
<% 
	Survey_answer_DAO surveyO = new Survey_answer_DAO();
	int survey_sid = Integer.parseInt(request.getParameter("survey_num"));
	
	System.out.println(survey_sid+"123");
	Survey_VO[] survey_list = surveyO.question_list_data(survey_sid);
	Survey_question_VO[] question_list = surveyO.question_data(survey_sid);

	int question_num = question_list.length;
	
	
		
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.jsp">설문조사 서비스</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
         <span class="navbar-toggler-icon"></span>
      </button> 
      <div id="navbar" class="collapse navbar-collapse">
         <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
               <a class="nav-link" href="index.jsp">메인</a>
            </li>
         <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
                  회원관리
               </a>
         <div class="dropdown-menu"  aria-labelledby="dropdown">
            <a class="dropdown-item" href="userLogin.jsp">로그인</a>
            <a class="dropdown-item" href="userJoin.jsp">회원가입</a>
            <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
         </div>
      </li>
   </ul>
        
</div>ㅇ

</nav>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<div class="middle">
     
      
      <form id="surveyfm" nmae="surveyfm" method="POST" action="./createSurveyAction.jsp">
      <input type="hidden" name="total" id="total">
         <div class="name">
          <div class ="titleName"><%=survey_list[0].getSurvey_title()%><div>
         </div>
                  <!-- <div class="questionDiv">
            <div class="firstSet">
               <input type="text" class="questionContent" placeholder="질문 내용" name="questionName">
               <div class="questionDelete">
                  -
               </div>
               <select onchange="selectionFunctoin(value)" class="questionOpt" name="questionKind" id="questionKind">
                  <option value="Text">단답형</option>
                  <option value="Radio">라디오</option>
                        <option value="Selection">체크박스</option>
                        
               </select>
               
            </div>
            <img class="arrow" src="images/pencil.png" width="27px">
         </div> -->
         
         <div class="footer">
            <button type="submit" class="submitBtn">설문제출</button>
         </div>
          
      </form>
    
     <script>
     var template='';

     <%
     for(int i=0; i<question_num;i++){
   	System.out.println(question_list[i].getSurvey_type());
   	if(question_list[i].getSurvey_type().equals("Text")){
    	%>
    template="";
    template += "<div class='questionDiv'>";
    template += "<div class='firstSet'>";
    template += "<div></div>";
    template +=	"<div>";
    template +=	'<%=question_list[i].getSurvey_content()%>';
    template +=	"</div>";
    template +=	"<input type='text' class='questionText' name='qs' placeholder='답변을 입력하세요'>"
	template +=	"</div>";
    template += "</div>";
    template += "</div>";
    
    $('#surveyfm').append(
    		template
         );
    
<%
   	}
   	else if(question_list[i].getSurvey_type().equals("Radio")){
%>
   	 template="";
     template += "<div class='questionDiv'>";
     template += "<div class='firstSet'>";
     template += "<div></div>";
     template += "<div>";
     template += '<%=question_list[i].getSurvey_content()%>';
     template += "</div>";
 	 template +=	"<div class='questionRadio1'>"                 
	 template +=	"<div id='survey_option1_1'>"
	 template +=	"<input type='radio' class='radioCircle' name='radioGroup1' id='radio1_1'>"
	 template +=	"<label for='radio1_2'>"
	 template +=    '<%=question_list[i].getQs_1()%>'
	 template +=	"</label>"

	 template +=	"</div> "                
	 template +=	"<div id='survey_option1_2'>"
	 template +=	"<input type='radio' class='radioCircle' name='radioGroup1' id='radio1_2'>"                
	 template +=	"<label for='radio1_2'>"
	 template +=    '<%=question_list[i].getQs_2()%>'
	 template +=	"</label>"
	 template +=	"</div>"    

<%
     if(question_list[i].getQs_3()!=null){
%>	 
	 template +=	"</div> "                
	 template +=	"<div id='survey_option1_2'>"
	 template +=	"<input type='radio' class='radioCircle' name='radioGroup1' id='radio1_2'>"                
	 template +=	"<label for='radio1_2'>"
	 template +=    '<%=question_list[i].getQs_3()%>'
	 template +=	"</label> "
  
<%	 
  	 } 
%>
<%
	if(question_list[i].getQs_4()!=null){
%>	 
	template +=	"</div> "                
	template +=	"<div id='survey_option1_2'>"
	template +=	"<input type='radio' class='radioCircle' name='radioGroup1' id='radio1_2'>"                
	template +=	"<label for='radio1_2'>"
	template +=    '<%=question_list[i].getQs_4()%>'
	template +=	"</label> "
	template +=	"</div>"   
<%	 
	 } 
%>	
<%
	if(question_list[i].getQs_5()!=null){
%>	 
	template +=	"</div> "                
	template +=	"<div id='survey_option1_2'>"
	template +=	"<input type='radio' class='radioCircle' name='radioGroup1' id='radio1_2'>"                
	template +=	"<label for='radio1_2'>"
	template +=    '<%=question_list[i].getQs_5()%>'
	template +=	"</label> "

<%	 
	 } 
%>	
<%
	if(question_list[i].getQs_6()!=null){
%>	 
               
	template +=	"<div id='survey_option1_2'>"
	template +=	"<input type='radio' class='radioCircle' name='radioGroup1' id='radio1_2'>"                
	template +=	"<label for='radio1_2'>"
	template +=    '<%=question_list[i].getQs_6()%>'
	template +=	"</label>"
	template +=	"</div>"   
<%	 
	 } 
%>	
<%
	if(question_list[i].getQs_7()!=null){
%>	 
	             
	template +=	"<div id='survey_option1_2'>"
	template +=	"<input type='radio' class='radioCircle' name='radioGroup1' id='radio1_2'>"                
	template +=	"<label for='radio1_2'>"
	template +=    '<%=question_list[i].getQs_7()%>'
	template +=	"</label> "

<%	 
	 } 
%>	
<%
if(question_list[i].getQs_8()!=null){
%>	 
	              
	template +=	"<div id='survey_option1_2'>"
	template +=	"<input type='radio' class='radioCircle' name='radioGroup1' id='radio1_2'>"                
	template +=	"<label for='radio1_2'>"
	template +=    '<%=question_list[i].getQs_8()%>'
	template +=	"</label> "
	template +=	"</div>"   
<%	 
	 } 
%>
<%
	if(question_list[i].getQs_9()!=null){
%>	 
             
	template +=	"<div id='survey_option1_2'>"
	template +=	"<input type='radio' class='radioCircle' name='radioGroup1' id='radio1_2'>"                
	template +=	"<label for='radio1_2'>"
	template +=    '<%=question_list[i].getQs_9()%>'
	template +=	"</label> "
	template +=	"</div>"   
<%	 
	 } 
%>	
<%
if(question_list[i].getQs_10()!=null){
%>	 
	template +=	"</div> "                
	template +=	"<div id='survey_option1_2'>"
	template +=	"<input type='radio' class='radioCircle' name='radioGroup1' id='radio1_2'>"                
	template +=	"<label for='radio1_2'>"
	template +=    '<%=question_list[i].getQs_10()%>'
	template +=	"</label> "
	template +=	"</div>"   
<%	 
	 } 
%>	
	template += "</div>";
	template += "</div>";
	template += "</div>";     
	template +=	"</div>" 	
$('#surveyfm').append(
 		template
    );
   		
<%	
   	}
   	else if(question_list[i].getSurvey_type().equals("Selection")){
%>
   	
   		
   	 template="";
     template += "<div class='questionDiv'>";
     template += "<div class='firstSet'>";
     template += "<div></div>";
     template +=	"<div>";
     template +=	'<%=question_list[i].getSurvey_content()%>';
     template +=	"</div>";
     template +=	"<input type='text' class='questionText' name='qs' placeholder='체크박스'>"
  
     template += "<div class='questioncheckbox'>"
   	 template += "<div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup' id='checkbox' >" 
	 template +=                  "<label for='checkbox'><input class='optionBox' type='text' placeholder='선택지1' name='qs_'></label>"
	 template +=                     "<div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup' id='checkbox'>"
	 template += "<label for='checkbox'><input class='optionBox' type='text' placeholder='선택지2' name='qs_'></label>"
 	 template +="</div>"
                     
              	 
     
     
     template += "</div>";
     template += "</div>";
     template += "</div>";
     
     $('#surveyfm').append(
     		template
          );
     
   		
   		<%
    }
   	}
   	%> 
  
   	
	
   
   </script>

	
	
</body>
</html>

