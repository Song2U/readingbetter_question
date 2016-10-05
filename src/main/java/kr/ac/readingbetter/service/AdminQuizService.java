package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.QuizDao;
import kr.ac.readingbetter.vo.QuizVo;

@Service
public class AdminQuizService {

	@Autowired
	private QuizDao quizDao;

	// 퀴즈리스트
	public List<QuizVo> getList() {
		List<QuizVo> list = quizDao.getList();
		return list;
	}

	// 퀴즈 상세보기
	public QuizVo quizView(Long no) {
		QuizVo vo = quizDao.quizView(no);
		return vo;
	}

	// 퀴즈 업데이트
	public void quizUpdate(QuizVo vo) {
		// 퀴즈의 답에 따른 저장
		String answer = vo.getAnswer();

		switch (answer) {
		case "1":
			vo.setAnswer(vo.getEx1());
			break;
		case "2":
			vo.setAnswer(vo.getEx2());
			break;
		case "3":
			vo.setAnswer(vo.getEx3());
			break;
		case "4":
			vo.setAnswer(vo.getEx4());
			break;
		}

		quizDao.quizUpdate(vo);
	}

	// 퀴즈 추가 - 관리자는 무조건 승인상태여야 한다
	public void quizAdd(QuizVo vo) {
		// 퀴즈의 답에 따른 저장
		String answer = vo.getAnswer();

		switch (answer) {
		case "1":
			vo.setAnswer(vo.getEx1());
			break;
		case "2":
			vo.setAnswer(vo.getEx2());
			break;
		case "3":
			vo.setAnswer(vo.getEx3());
			break;
		case "4":
			vo.setAnswer(vo.getEx4());
			break;
		}
		vo.setAccept("1");
		quizDao.quizAdd(vo);
	}
}