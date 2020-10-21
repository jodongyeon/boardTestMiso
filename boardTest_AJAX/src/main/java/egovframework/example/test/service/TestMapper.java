package egovframework.example.test.service;

//매퍼의 namespace와는 경로를 맞추어야 한다. 
import java.util.List;

import egovframework.example.test.domain.Search;
import egovframework.example.test.domain.TestVO;

//query 적힌 xml 위치 
//	<property name="mapperLocations"
//	value="classpath:/egovframework/sqlmap/mappers/**/*Mapper.xml" />
//</bean>
//Mapper namespace 와 ID를 연결할 Interface 를 두어서 interface를 호출하는 방법.
//Mybatis 매핑XML에 기재된 SQL을 호출하기 위한 인터페이스이다. Mybatis3.0부터 생겼다.
//SQL id는 인터페이스에 정의된 메서드명과 동일하게 작성한다
public interface TestMapper {

	// 게시물 리스트 조회
	public List<TestVO> selectTest(Search search) throws Exception;

	// 게시물 등록
	public int insertTest(TestVO testVO) throws Exception;

	// 게시물 조회
	public TestVO selectDetail(TestVO testVO) throws Exception;

	// 게시물 수정
	public void updateTest(TestVO testVO) throws Exception;

	// 게시물 삭제
	public void deleteTest(TestVO testVO) throws Exception;

	// 총 게시글 개수 확인
	public int getBoardListCnt(Search search) throws Exception;

}
