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
						<td><input name="testId" type="text" value="${result.testId}"
							class="form-control" readonly /></td>

					</tr>
					<tr>
						<th>제목:</th>
						<td><input type="text" value="${result.testTitle}"
							name="testTitle" class="form-control" /></td>
					</tr>
					<tr>
						<th>내용:</th>
						<td><textarea name="testContent" class="form-control"
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
						<td><input type="file" name="uploadFile"></td>
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
	$(document).on('click', '#btn_modify', function(e) {
		if (confirm("정말 수정하시겠습니까 ?") == true) {
			$("#viewForm").submit();
		} else {
			return;
		}

	});
	$(document).on('click', '#btn_delete', function(e) {
		if (confirm("정말 삭제하시겠습니까 ?") == true) {
			$("#viewForm").attr("action", "deleteTest.do");
			$("#viewForm").submit();
		} else {
			return;
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