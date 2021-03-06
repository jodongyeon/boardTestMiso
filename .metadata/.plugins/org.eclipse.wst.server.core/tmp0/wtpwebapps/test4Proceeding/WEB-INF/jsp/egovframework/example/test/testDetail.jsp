<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link href="/css/test/test.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<h1>글 상세보기 Detail</h1>
			</thead>
			<tbody>
				<form action="updateTest.do" id="viewForm" method="post"
					encType="multipart/form-data">
					<tr>
						<th>글번호:</th>
						<td><input name="testId" id="testId" type="text"
							value="${result.testId}" class="form-control" readonly /></td>

					</tr>
					<tr>
						<th>제목:</th>
						<td><input type="text" value="${result.testTitle}"
							id="testTitle" class="form-control" /></td>
					</tr>
					<tr>
						<th>내용:</th>
						<td><textarea id="testContent" class="form-control"
								style="height: 200px;">${result.testContent}</textarea></td>

					</tr>
					<tr>
						<c:if test="${result.fileName ne null}">
							<tr>
								<td>다운로드</td>

								<td><a href="fileDownload.do?fileName=${result.fileName}">
										<input type="text" id="asd" value="${result.fileName}"
										name="fileName" class="form-control" readonly />
								</a>
									<button id="asdasd" type="button" class="btn_previous">파일지우기</button>
							</tr>
						</c:if>
					</tr>


					<tr>
						<th>첨부파일:</th>
						<td><input type="file" id="uploadFile"></td>
					</tr>
					<tr>

						<td colspan="2">
							<button id="btn_previous" type="button" class="btn_previous">이전</button>
							<button id="btn_delete" type="button" class="btn_previous">삭제</button>
							<button id="btn_modify" type="button" class="btn_register">수정</button>
					</tr>
				</form>
			</tbody>
		</table>
	</div>


</body>
<script type="text/javascript">
	const testId = $("#testId").val();
	
	$(document).on('click', '#btn_modify', function(e) {
		if (confirm("정말 수정하시겠습니까 ?") == true) {
			
			//데이터를 담아내는 부분
			const testTitle = $("#testTitle").val().trim();
			const testContent = $("#testContent").val().trim();
			const uploadFile = $("#uploadFile")[0].files[0];

			if(testTitle === ''){
				alert('제목을 입력해주세요.');
				return;
			}
			
			if(testContent === ''){
				alert('내용을 입력해주세요.');
				return;
			}

			//ajax 통신을 사용해 서버에 데이터를 전송하기 위해 
			//폼데이터 객체를 생성함
			//append를 통해서 프로퍼티에 바인딩이 가능하도록 세팅한다.
			var formData = new FormData();
			formData.append("testId",testId);
			formData.append("testTitle",testTitle);
			formData.append("testContent",testContent);

			//만약 uploadFile이 undifined거나 null일 경우 폼데이터에 보내지 않도록 한다.
			//이부분 체크하지 않을 경우 undifined가 데이터로 보내지기 때문에 서버에서 에러가 발생한다.
			if(uploadFile)
				formData.append("uploadFile",uploadFile);
			
			//ajax로 파일전송 폼데이터를 보내기위해
			//enctype, processData, contentType 이 세가지를 반드시 세팅해야한다.
			$.ajax({
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false,
				url : "./updateTest.do",
				data : formData,
				type : "POST",
				success : function(res){
					alert('수정 완료');
					location.href='./testList.do';
				}
			})			
		} 
	});

	$(document).on('click', '#btn_delete', function(e) {
		//const testId = $("#testId").val();

		if (confirm("정말 삭제하시겠습니까 ?")) {
			$.ajax({
				url : "./deleteTest.do",
				type : "POST",
				data : {
					testId : testId
				},
				success : function(res) {
					alert('삭제 완료');
					location.href = './testList.do';
				}
			})
		}
	});

	//이전 클릭 시 testList로 이동
	$("#btn_previous").click(function javascript_onclikc() {
		$(location).attr('href', 'testList.do');
	});
	$("#asdasd").click(function javascript_onclikc() {
		$('#asd').val(null);
	});
</script>
</html>