<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
							name="testTitle" id="testTitle" class="form-control" /></td>
					</tr>
					<tr>
						<th>내용:</th>
						<td><textarea placeholder="내용을 입력하세요 . " id="testContent"
								name="testContent" class="form-control" style="height: 200px;"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일:</th>
						<td><input type="file" id="uploadFile" name="uploadFile"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button id="btn_register" type="button" class="btn btn_register">등록</button>
							<button id="btn_previous" type="button" class="btn btn_previous">이전</button>
					</tr>
				</form>
			</tbody>
		</table>
	</div>

</body>
<script type="text/javascript">
	//글쓰기
	$(document).on('click', '#btn_register', function(e) {

		//데이터를 담아내는 부분 상수 const로
		//jquery val() : Form Element 의 값을 받아오는데 쓰인다. (주로 input 이나 textarea 정도?)- 주의해야할 점은 Form Element 이외의 값은 받아오질 못한다는 점.
		//문자열 좌우에서 공백을 제거하는 함수가 trim() 함수 입니다.
		const testTitle = $("#testTitle").val().trim();
		const testContent = $("#testContent").val().trim();
		const uploadFile = $("#uploadFile")[0].files[0];

		//'==' 연산자를 이용하여 서로 다른 유형의 두 변수의 [값] 비교
		//'==='는 엄격한 비교를 하는 것으로 알려져 있다 ([값 & 자료형] -> true). 변수를 비교하거나 어떤 비교를 위해 항상 '===' 연산자를 사용 할 것을 권장한다.
		if (testTitle === '') {
			alert('제목을 입력해주세요.');
			return;
		}

		if (testContent === '') {
			alert('내용을 입력해주세요.');
			return;
		}

		//ajax 통신을 사용해 서버에 데이터를 전송하기 위해 
		//폼데이터 객체를 생성함
		//jquery의 append를 통해서 프로퍼티에 바인딩이 가능하도록 세팅한다..append()선택된 요소의 마지막에 새로운 요소나 콘텐츠를 추가한다.
		var formData = new FormData();
		formData.append("testTitle", testTitle);
		formData.append("testContent", testContent);

		//만약 uploadFile이 undifined거나 null일 경우 폼데이터에 보내지 않도록 한다.
		//이부분 체크하지 않을 경우 undifined가 데이터로 보내지기 때문에 서버에서 에러가 발생한다.
		if (uploadFile)
			formData.append("uploadFile", uploadFile);

		//ajax로 파일전송 폼데이터를 보내기위해
		//enctype, processData, contentType 이 세가지를 반드시 세팅해야한다.
		$.ajax({
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			cache : false,
			url : "./insertTest.do",
			data : formData,
			type : "POST",
			success : function(res) {
				alert('게시글 등록 완료');
				location.href = "./testList.do";
			}
		});
	});

	//이전 클릭 시 testList로 이동
	$("#btn_previous").click(function javascript_onclikc() {
		$(location).attr('href', 'testList.do');
	});
</script>
</html>


