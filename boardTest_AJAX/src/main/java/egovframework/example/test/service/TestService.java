package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.domain.Search;
import egovframework.example.test.domain.TestVO;

public interface TestService {

	public List<TestVO> selectTest(Search search) throws Exception;

	public int insertTest(TestVO testVO) throws Exception;

	public TestVO selectDetail(TestVO testVO) throws Exception;

	public void updateTest(TestVO testVO) throws Exception;

	public void deleteTest(TestVO testVO) throws Exception;

	// 총 게시글 개수 확인
	public int getBoardListCnt(Search search) throws Exception;

}
