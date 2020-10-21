package egovframework.example.test.web;

import java.io.File;
import java.util.HashMap;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.test.domain.Search;
import egovframework.example.test.domain.TestVO;
import egovframework.example.test.service.TestService;

/*
 * 
 * 완전한 RESTAPI는 아니지만 이런식으로 데이터 통신을 하게된다라는 내용
 * 
 * getTestList.do << 게시판 목록을 가져오는 api 
 * insertTest.do << 게시글을 등록하는 api
 * deleteTest.do << 게시글을 삭제하는 api
 * updateTest.do << 게시글을 수정하는 api
 *
 * CRUD의 CDU 를 보면 항상 데이터를 조회 후 반환하고 있는데
 * 서버에서 처리하는 방식은 기존 동기 방식과 크게 다르지 않다
 * 조금 수정될 부분이 있다면 Spring 의 Model을 사용하지 않는다
 * 
 * @RestController << 이 어노테이션은 @ResponseBody를 일일히 메소드에 붙이는 것을 생략하기 위해 사용
 *
 */

@RestController
public class TestAjaxController {

	@Autowired
	private TestService testServiceImpl;
	// ajax url getTestList.do로 받기 (후킹???)
	// produces = "application/json json형태로 response request요청에 따른 response의
	// content-type을 변경

	/*
	 * Spring Framwork에서 제공하는 클래스중 HttpEntity 라는 클래스 이것은 HTTP 요청(Request) 또는
	 * 응답(Response)에 해당하는 HttpHeader 와 HttpBody 를 포함하는 클래스 이 HttpEntity 라는 클래스를 상속받아
	 * 구현한 클래스가 RequestEntity, ResponseEntity ResponseEntity는 당연히 사용자의 HttpRequest에
	 * 대한 응답 데이터를 포함하는 클래스입니다. 따라서 HttpStatus, HttpHeaders, HttpBody를 포함.
	 */

	/*
	 * HashMap은 Map을 구현한다. Key와 value를 묶어 하나의 entry로 저장한다는 특징을 갖는다. 그리고 hashing을
	 * 사용하기 때문에 많은양의 데이터를 검색하는데 뛰어난 성능을 보인다. Map 인터페이스의 한 종류로 ( "Key", value) 로 이뤄져
	 * 있다. key 값을 중복이 불가능 하고 value는 중복이 가능. value에 null값도 사용 가능하다. 멀티쓰레드에서 동시에
	 * HashMap을 건드려 Key - value값을 사용하면 문제가 될 수 있다. 멀티쓰레드에서는 HashTable을 쓴다
	 */

	@RequestMapping(value = "/getTestList.do", produces = "application/json")
	public ResponseEntity<HashMap<String, Object>> testListDo(Search search) throws Exception {

		HashMap<String, Object> result = new HashMap<>();

		// 전체 게시글 개수를 얻어와 listCnt에 저장
		int listCnt = testServiceImpl.getBoardListCnt(search);

		// 검색
		search.pageInfo(listCnt);

		// 페이징
		result.put("pagination", search);

		// 게시글 화면 출력
		result.put("list", testServiceImpl.selectTest(search));

		/*
		 * ResponseEntity의 static 메소드인 ok()는 HttpStatus코드의 OK(200)를 응답데이터에 포함하도록 하고
		 * ResponseEntity의 BodyBuilder를 return
		 */
		return ResponseEntity.ok(result);
	}

	// 글 작성 버튼 구현
	@RequestMapping(value = "/insertTest.do", produces = "application/json")
	public ResponseEntity<TestVO> write(TestVO testVO) throws Exception {
		String fileName = null;
		MultipartFile uploadFile = testVO.getUploadFile();
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			UUID uuid = UUID.randomUUID(); // UUID 구하기
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("C:\\upload\\" + fileName));
		}
		testVO.setFileName(fileName);

		int testId = testServiceImpl.insertTest(testVO);
		testVO.setTestId(testId);
		testVO = testServiceImpl.selectDetail(testVO);
		return ResponseEntity.ok(testVO);
	}

	// 삭제하기
	@RequestMapping(value = "/deleteTest.do", produces = "application/json")
	public ResponseEntity<TestVO> deleteTest(TestVO testVO) throws Exception {
		testVO = testServiceImpl.selectDetail(testVO);
		testServiceImpl.deleteTest(testVO);
		return ResponseEntity.ok(testVO);
	}

	// 수정하기
	@RequestMapping(value = "/updateTest.do", produces = "application/json")
	public ResponseEntity<TestVO> updateTest(TestVO testVO) throws Exception {
		// 파일 업로드 처리
		String fileName = null;
		MultipartFile uploadFile = testVO.getUploadFile();
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			UUID uuid = UUID.randomUUID(); // UUID 구하기
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("C:\\upload\\" + fileName));
		}
		testVO.setFileName(fileName);
		System.out.println(testVO);
		testServiceImpl.updateTest(testVO);
		testVO = testServiceImpl.selectDetail(testVO);
		return ResponseEntity.ok(testVO);
	}
}
