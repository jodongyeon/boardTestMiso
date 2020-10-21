package egovframework.example.test.domain;

import org.springframework.web.multipart.MultipartFile;

public class TestVO {

	private static final long serialVersionUID = 1L;

	private int testId;
	private String testTitle;
	private String testContent;
	private String testName;
	private String testDate;
	private String fileName;
	private MultipartFile uploadFile;

	//필드에 접근해 값을 가지고 오고, 값을 설정할 Getter와 Setter

	public int getTestId() {
		return testId;
	}

	public void setTestId(int testId) {
		this.testId = testId;
	}

	public String getTestTitle() {
		return testTitle;
	}

	public void setTestTitle(String testTitle) {
		this.testTitle = testTitle;
	}

	public String getTestContent() {
		return testContent;
	}

	public void setTestContent(String testContent) {
		this.testContent = testContent;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public String getTestDate() {
		return testDate;
	}

	public void setTestDate(String testDate) {
		this.testDate = testDate;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "TestVO [testId=" + testId + ", testTitle=" + testTitle + ", testContent=" + testContent + ", testDate="
				+ testDate + "]";
	}

	

}