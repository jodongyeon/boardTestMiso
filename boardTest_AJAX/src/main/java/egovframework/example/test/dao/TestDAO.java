package egovframework.example.test.dao;

import java.util.List;

import egovframework.example.test.domain.Search;
import egovframework.example.test.domain.TestVO;
//Data Access Object의 약어로 실질적으로 DB에 접근하여 데이터를 조회하거나 조작하는 기능을 전담하는 객체를 말한다.
//DAO의 사용 이유는 효율적인 커넥션 관리와 보안성 때문이다. 
//DAO는 저수준의 Logic과 고급 비즈니스 Logic을 분리하고 domain logic으로부터 DB관련 mechanism을 숨기기 위해 사용한다.

public interface TestDAO {

	List<TestVO> selectTest(Search search) throws Exception;

	int insertTest(TestVO testVO) throws Exception;

	TestVO selectDetail(TestVO testVO) throws Exception;

	void updateTest(TestVO testVO) throws Exception;

	void deleteTest(TestVO testVO) throws Exception;

	// 총 게시글 개수 확인
	public int getBoardListCnt(Search search) throws Exception;

}
