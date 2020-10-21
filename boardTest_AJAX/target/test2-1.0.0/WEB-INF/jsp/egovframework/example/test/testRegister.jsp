<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<h1>글쓰기</h1>
			</thead>
			<tbody>
				<!-- enctype="multipart/form-data" 이 부분을 사용해 줘야지만 파일을 전송할 수 있다. -->
				<form id="form_test" action="insertTest.do" method="post"
					encType="multipart/form-data">
					<tr>
						<th>제목:</th>
						<td><input type="text" placeholder="제목을 입력하세요. "
							name="testTitle" class="form-control" /></td>
					</tr>
					<tr>
						<th>내용:</th>
						<td><textarea placeholder="내용을 입력하세요 . " name="testContent"
								class="form-control" style="height: 200px;"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일:</th>
						<td><input type="file" name="uploadFile"></td>
					</tr>
				<tr>
					<td colspan="2">
						<button id="btn_register" type="button" class="btn_register">등록</button>
						<button id="btn_previous" type="button" class="btn_previous">이전</button>
				</tr>

				</form>
			</tbody>
		</table>
	</div>


</body>
<script type="text/javascript">
	//글쓰기

	$(document).on('click', '#btn_register', function(e) {

		$("#form_test").submit();

	});

	//이전 클릭 시 testList로 이동
	$("#btn_previous").click(function javascript_onclikc() {

		$(location).attr('href', 'testList.do');

	});
</script>
</html>


