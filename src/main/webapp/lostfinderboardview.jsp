<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lostfinder</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <style>
        *{
			font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
        }
        *{box-sizing:border-box;}
		#boardtable { 
            width: 700px;
            height: 500px;
            background: rgba(240,240,240,0.5);
            table-layout:fixed;
		}
        #title{
       		width:100%;
            height:10%;
            overflow-y:visible;
            table-layout:fixed;
        }
        #contents{
        	width:100%;
            height:75%;
            overflow-y:visible;
            table-layout:fixed;
        }
        #footer{
        	width:100%;
            height:10%;
        }
		table #meta {
        	width:100%;
            height:5%;
			font-size: 8px;
		}
		table textarea{
			width:100%;
			height:100%;
		}
		#title{border:none;}
        [contenteditable="true"]:empty:before {
		   content: attr(placeholder);
		}
		#subtitle{
			border:none;
			witdh:100%;
			height:10%;
		}
			
    </style>
</head>
<body>
    <header>
	    <nav class="navbar navbar-expand-lg bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="/LostFinder">LostFinder</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
	       	      <form class="d-flex" role="search">
			        <input class="form-control me-2" type="search" placeholder="검색어를 입력해주세요." aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">search</button>
			      </form>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	</header>
	<section>
	<table id="boardtable" border=1 align=center>
		<tr>
			<th id="title" class="classtitle">${lostfinderboardData.board_title }</th>
		</tr>
		<tr>
			<td>
				<select id="location" disabled>
					<c:forEach var="j" items="${locationData}" begin="0" end="${fn:length(locationData)}">
						<c:choose>
							<c:when test="${lostfinderboardData.location_no==j.location_no}" >
								<option value="${j.location_no}" selected="selected">${j.location_str}</option>
							</c:when>
							<c:otherwise>
								<option value="${j.location_no}">${j.location_str}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>	
			<td id ="subtitle" class="classsubtitle">${lostfinderboardData.board_no } ${lostfinderboardData.board_tag } ${lostfinderboardData.board_viewcount }</td>
		</tr>
		<tr>
			<td id="meta" class="meta">${lostfinderboardData.member_id } ${lostfinderboardData.board_createdate } ${lostfinderboardData.board_viewcount}</td>
		</tr>
		<tr>
			<td id="contents" class="contents">${lostfinderboardData.board_content }</td>
		</tr>
		<tr id=footer>
			<td align=right>
			<c:if test="${lostfinderboardData.board_no == lostfinderfileData[0].board_no}">
				<c:forEach var="i" items="${lostfinderfileData}" begin="0" end="${fn:length(lostfinderfileData)}" step="1">
					<form action="download.lostfinderboard" method="get">
						<input type="hidden" class="boardfile_uuid" name="boardfile_uuid" value="${i.boardfile_uuid}">
						<input type="hidden" class="boardfile_name" name="boardfile_name" value="${i.boardfile_name}">${i.boardfile_name} 
						<input type="submit" class="download-btn" value="다운로드">
					</form>
				</c:forEach>
			</c:if>
			<c:if test="${lostfinderboardData.member_id == member_id}">
				<button type=button id="delete-btn" name = "board_no" value="${i.board_no}">삭제</button>
				<button type=button id="edit-btn" name = "board_no" value="${i.board_no}">수정</button>
			</c:if>
				<button type=button id="back-btn">목록으로</button>
			</td>
		</tr>
			
	</table>
	</section>
	<footer>
		<div class="d-none d-sm-flex justify-content-center">
			<div class="d-flex">
				<div id="siteinfo">사이트 이용안네</div><label>│</label><div id="privacy">개인정보 처리방침</div><label>│</label><div id="khhome">KH정보교육원</div><label>│</label><div id="khphone">02-1544-9970</div>
			</div>
		</div>
		<div class="d-none d-xxl-flex justify-content-center">
			<div class="d-flex">
				<div>강남1관 : 서울특별시 강남구 태헤란로14길 6 남도빌딩</div><label>│</label><div>종로지원 : 서울특별시 중구 남대문로1가 18 대일빌딩</div><label>│</label><div>당산지원 : 서울특별시 영등포구 선유동2로 57 이례빌딩</div>
			</div>
		</div>
		<div class="d-none d-lg-flex justify-content-center">
			<div class="d-flex">
				<div>홈페이지에 게시된 이메일주소가 자동수집되는 것을 거부하며, 이를 위반 시 처벌될 수 있음을 양지하여 주시기 바랍니다.</div>
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<div class="d-flex">
				<div>Copyright ⓒ2022 LostFinder All Right Reserved</div>
			</div>
		</div>
	</footer>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 	<script src="lostfinderboardview.js"></script> 
</body>
</html>