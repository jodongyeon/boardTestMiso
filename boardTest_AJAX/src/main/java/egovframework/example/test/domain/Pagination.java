package egovframework.example.test.domain;

public class Pagination {

	private final int showBlockCount = 5;

	private int listSize = 10; // 초기값으로 목록개수를 10으로 셋팅 한 페이지당 보여질 리스트의 개수

	private int page = 0; // 현재목록의 페이지 번호

	private int listCnt; // 전체 개시물의 개수

	private int pageCnt; // 전체 페이지 범위의 개수

	private int startPage; // 각 페이지 범위 시작 번호

	private int endPage; // 각 페이지 범위 끝 번호

	private boolean prev; // 이전 페이지

	private boolean next; // 다음 페이지

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStartPage() {

		return startPage;

	}

	public void setStartPage(int startPage) {

		this.startPage = startPage;

	}

	public int getEndPage() {

		return endPage;

	}

	public void setEndPage(int endPage) {

		this.endPage = endPage;

	}

	public boolean isPrev() {

		return prev;

	}

	public void setPrev(boolean prev) {

		this.prev = prev;

	}

	public boolean isNext() {

		return next;

	}

	public void setNext(boolean next) {

		this.next = next;

	}

	public int getListSize() {

		return listSize;

	}

	public void setListSize(int listSize) {

		this.listSize = listSize;

	}

	public int getListCnt() {

		return listCnt;

	}

	public void setListCnt(int listCnt) {

		this.listCnt = listCnt;

	}

	// 첫번째 인자 page 는 현재 페이지 정보 두번째 인자 range 는 현재 페이지 범위 정보 세번째 인자 listCnt는 게시물의 총 개수
	public void pageInfo(int listCnt) {
		this.listCnt = listCnt;

		// 전체 페이지수
		this.pageCnt = (int) Math.ceil((double) listCnt / listSize);

		// 시작 페이지
		this.startPage = page / showBlockCount * showBlockCount;

		// 끝 페이지
		this.endPage = this.startPage + showBlockCount;

		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
		}

		// 이전 버튼 상태
		this.prev = this.startPage == 0 ? false : true;

		// 다음 버튼 상태
		this.next = endPage == pageCnt ? false : true;
	}
}
