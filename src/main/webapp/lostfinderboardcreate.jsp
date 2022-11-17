<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>분실물 게시글 작성</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <style>
        *{
            font-family: 'Dongle', sans-serif;
            font-size: 20px;
            color:black;
        }
        #filelist-span{
        	font-size: 8px
        }
        #board-item{
            width: 700px;
            height: 600px;
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
            height:80%;
            overflow-y:visible;
            table-layout:fixed;
        }
        #footer{
        	width:100%;
            height:10%;
        }
        .board-input{
            
        }
        div{
        	border:1px solid black;
        }
        [contenteditable="true"]:empty:before {
		   content: attr(placeholder);
		}
    </style>
</head>
<body>
<span>
	${member_id}님 환영합니다.
</span>
	<table id="board-item" border=1 align=center>
		<tr>
			<th id="title" contenteditable=true placeholder="글 제목"></th>
		</tr>
		<tr>
			<td>
				<select id="location_option">
					<option id="location_no-option" value="" selected="selected">지원을 선택하세요.</option>
				</select>
				<select id ="board_tag">
					<option id="board_tag-option" value="" selected="selected">습득 유형을 선택하세요.</option>
						<option value="lost">분실물</option>
						<option value="find">습득물</option>
				</select>
			</td>
		</tr>
		<tr>
			<td id="contents" contenteditable=true placeholder="내용을 입력해주세요."></td>
		</tr>
		<tr>
			<td id="footer" align=right>
				<form action="create.lostfinderboard" method="post" enctype="multipart/form-data" id="data-form">
					<input type="hidden" id="lostfinderboard_title-hidden" name="board_title">
					<input type="hidden" id="lostfinderboard_board_tag-hidden" name="board_tag">
					<input type="hidden" id="lostfinderboard_location_no-hidden" name="location_no">
					<input type="hidden" id="lostfinderboard_content-hidden" name="board_content">
					<input type="file" id="files-input"class="btn file-btn" name="file" multiple>
					<span id="filelist-span"></span>
					<input type="button" id="create-btn" value="작성">
					<button type="button" id="back-btn">목록으로</button>
				</form>
			</td>
		</tr>
	</table>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="lostfinderboardcreate.js"></script>
</body>
</html>