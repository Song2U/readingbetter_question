package kr.ac.readingbetter.vo;

public class AnswerVo {
	private Long quizNo;
	private String answer;
	
	public Long getQuizNo() {
		return quizNo;
	}
	public void setQuizNo(Long quizNo) {
		this.quizNo = quizNo;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	@Override
	public String toString() {
		return "AnswerVo [quizNo=" + quizNo + ", answer=" + answer + "]";
	}
}
