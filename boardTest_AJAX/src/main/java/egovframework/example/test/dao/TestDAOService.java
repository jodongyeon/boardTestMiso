package egovframework.example.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.domain.Search;
import egovframework.example.test.domain.TestVO;
import egovframework.example.test.service.TestMapper;

@Service("testDAOService")
public class TestDAOService implements TestDAO {

	@Autowired
	private SqlSession sqlSession;
	/*
	 * SqlSession 객체를 통해 interface TestMappler에 접근, testMapper 에 작성해 놓은 SQL문을 실행 할 수
	 * 있음 DB 접근에 필요한 connection을 관리를 DAO가 처리하게 됨. (DAO에서 간단하게 SqlSession 을 주입받아 처리
	 * 했는데, 이것이 바로 DB Connection을 알아서 관리해 주는 객체 입니다.
	 */

	public List<TestVO> selectTest(Search search) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.selectTest(search);
	}

	public int insertTest(TestVO testVO) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.insertTest(testVO);
	}

	@Override
	public TestVO selectDetail(TestVO testVO) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.selectDetail(testVO);
	}

	public void updateTest(TestVO testVO) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.updateTest(testVO);
	}

	public void deleteTest(TestVO testVO) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.deleteTest(testVO);
	}

	// 총 게시글 개수 확인
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.getBoardListCnt(search);
	}

	// testmapper namespace에서 1번 방식으로 mapper를 지정하지 않았다면 이렇게 namespace의 이름으로
	// 연결해서SQL문을 실행시키겠지
	/*
	 * public List<TestVO> getBoardList(Pagination pagination) throws Exception{ //
	 * return sqlSession.selectList(
	 * "egovframework.sqlmap.mappers.testMapper.getBoardListCnt", pagination);
	 * 
	 * }
	 */

}
