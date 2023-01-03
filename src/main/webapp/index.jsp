<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, java.util.ArrayList, java.net.URLEncoder" %>

<%@ page import="user.*, survey.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
    	.anything{
    		background-color: white;
    		float: right;
    	}
        .some{ 
        	  background-color: F1F1F1;
        	  width:1500px;'
			  color: white;
			  border: 2px solid black;
			  margin: 70px;
			  margin-left:370px;
			  padding: 20px;
			  
			  }
		.titleName{
				width: 450px;
				margin-right:20px;
				font-size:30px;
				font-weight:20px;
		}
		
		.when{
		font-size:20px;
		font-weight:20px;
		}
		.lookanswer{
		float: right;
		margin-bottom:50px;
		position: relative;
	    left: px;
	    top:-43px;
	    margin-right:30px;
		}
		.make-btn {
	    color: #fff;
	    background-color: tomato;
	    border-color: #28a745;
		}
		.bt_col {
	     background-color: #A4B2FF;
         color: white;
		}       
  </style>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name= "viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>설문조사 서비스</title>
<!-- 부트스트랩 추가하기 -->
<link rel= "stylesheet" href = "./css/bootstrap.min.css">
<!-- 커스텀 추가하기 -->
<link rel= "stylesheet" href = "./css/custom.css">
</head>

<body>
<%



	UserDAO userDAO = new UserDAO();
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
		System.out.println(userID);
	}else{
		userID = "Guest";
		System.out.println(userID);
	}
	Survey_answer_DAO surveyO = new Survey_answer_DAO();
	Survey_VO[] survey_data = surveyO.get_usersurvey(userID);	
	

	
	int survey_count = survey_data.length;


%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">설문조사 서비스</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button> 
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" >메인</a>
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
	
	
</div>
</nav>
 <div id="surveylist" name="surveylist" >
	      <input type="hidden" name="total" id="total">
	         <div class="name">
	        </div>
	        <section class="container">
				<div class="d-flex justify-content-center">
					<a class="btn btn-outline-primary" data-toggle="modal" href="#registerModal">내가 만든 설문</a>
					<form method="post" action="./indexed.jsp">
						<button type="submit" class="btn bt_col mx-1 mt-2">응답한 설문</button>
					</form>
				</div>
			</section>
<%
 	 for(int i=0; i<survey_count; i++)
 	 {

%>			
	<div class="some">
				<div class="row">
					<img src="./image/tugas.jpg" alt="이미지" style="width:20;" />
						<div class="titleName">
							<%=survey_data[i].getSurvey_title()%> 
							</div>
								<div class="when">
									<%=survey_data[i].getReg_date() %>
								</div>
							</div>
						
						<div class="lookanswer">
							<form method="post" action="./Survey_result.jsp?survey_num=<%=survey_data[i].getSeq()%>">
								<button type="submit"  class="btn btn-secondary float-right">설문 결과</button>
							</form>
						</div>
						<div class="lookanswer">
							<form method="post" action="./usersurvey.jsp?survey_num=<%=survey_data[i].getSeq()%>">
								<button type="submit"  class="btn btn-secondary float-right">설문 확인</button>
							</form>
						</div>		
			</div>

 
<%
	 }
%>   	
			
			
<script src="http://code.jquery.com/jquery-latest.min.js"></script>	
		
	 
   
   

			       
	         <div class="footer">
	
	         </div>	          
      </div>
      <script>

      
      
   
      
      </script>
      							
	<div class="modal-footer">
	<form method="post" action="./makesurvey.jsp">
	<button type="submit" class="btn make-btn col-10-6 mt-4">설문 만들기</button>
	</form>
	
	</div>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/pooper.js"></script>
	<!-- 부트스츠랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>