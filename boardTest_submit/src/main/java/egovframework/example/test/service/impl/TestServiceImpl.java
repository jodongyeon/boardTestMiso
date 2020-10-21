package egovframework.example.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.dao.TestDAO;
import egovframework.example.test.domain.Pagination;
import egovframework.example.test.domain.Search;
import egovframework.example.test.domain.TestVO;
import egovframework.example.test.service.TestService;

@Service("testServiceImpl")
public class TestServiceImpl implements TestService {

/*	extends
	부모에서 선언 / 정의를 모두하며 자식은 메소드 / 변수를 그대로 사용할 수 있음
 *  implements (interface 구현)
	부모 객체는 선언만 하며 정의(내용)은 자식에서 오버라이딩 (재정의) 해서 사용해야함*/
	
	@Autowired
	private TestDAO testDAOService;
	/*@Autowired가 적용된 의존 주입 대상에 대해서는
	<property> 태그나 <constructor-arg> 태그를 사용하지 않아도 스프링이 알맞게 의존 객체를 주입해준다.*/

	@Override
	public List<TestVO> selectTest(Search search) throws Exception {		
		return testDAOService.selectTest(search);
	}

	@Override
	public void insertTest(TestVO testVO) throws Exception {
		testDAOService.insertTest(testVO);
	}

	@Override
	public TestVO selectDetail(TestVO testVO) throws Exception {
		TestVO resultVO = testDAOService.selectDetail(testVO);
		return resultVO;
	}

	@Override
	public void updateTest(TestVO testVO) throws Exception {
		testDAOService.updateTest(testVO);
	}

	@Override
	public void deleteTest(TestVO testVO) throws Exception {
		testDAOService.deleteTest(testVO);
	}
	
	
	//총 게시글 개수 확인
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return testDAOService.getBoardListCnt(search);

		}

	/*@Override
	public List<TestVO> getBoardList(Pagination pagination) throws Exception {
		return testDAOService.getBoardList(pagination);

	}*/

}
