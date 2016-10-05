package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.BookDao;
import kr.ac.readingbetter.dao.QuizDao;
import kr.ac.readingbetter.vo.AnswerVo;
import kr.ac.readingbetter.vo.BookVo;
import kr.ac.readingbetter.vo.QuizVo;

@Service
public class BookService {

	@Autowired
	private BookDao bookDao;

	@Autowired
	private QuizDao quizDao;
	
	public List<BookVo> getList() {
		List<BookVo> list = bookDao.getList();
		return list;
	}

	public List<BookVo> getListKwd(BookVo vo) {
		List<BookVo> list = bookDao.getListKwd(vo);
		return list;
	}

	public BookVo getByNo(Long no) {
		BookVo vo = bookDao.getByNo(no);
		return vo;
	}

	public List<BookVo> findBook(BookVo vo) {
		List<BookVo> list = bookDao.findBook(vo);
		return list;
	}

	public List<BookVo> getListService(BookVo vo) {
		List<BookVo> list = bookDao.getListService(vo);
		return list;
	}
	
	public String getAnswer(Long no){
		return quizDao.selectAnswer(no);
	}
	
	// 정답 개수 구하기
	public Integer getCount(List<AnswerVo> list){
		Integer len = list.size();
		Integer count = 0;
		
		for (int i = 0; i < len; i++) {
			String oAnswer = quizDao.selectAnswer(list.get(i).getQuizNo());
			if (oAnswer.equals(list.get(i).getAnswer())) {
				count++;
			}
		}
		
		return count;
	}
	
	public List<QuizVo> selectQuiz(Long no) {
		List<QuizVo> list = quizDao.selectQuiz(no);
		return list;
	}
	/////////////////////////////////////////////////////////////////////////////

	// 퀴즈내기

	// 퀴즈 추가 - 사용자는 무조건 대기상태여야 한다
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

		vo.setAccept("0");
		quizDao.quizAdd(vo);
	}
	
	public void insert(BookVo vo) {
		bookDao.insert(vo);
	}
	
	// 사용자 페이징 리스트
	public List<BookVo> getAdminListPage(BookVo vo) {
		List<BookVo> list = bookDao.getAdminListPage(vo);
		return list;
	}
}