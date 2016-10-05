package kr.ac.readingbetter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.readingbetter.dao.BoardDao;
import kr.ac.readingbetter.vo.BoardVo;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;

	public List<BoardVo> getList() {
		List<BoardVo> list = boardDao.getList();
		return list;
	}

	public BoardVo getContent(Long no) {
		BoardVo content = boardDao.getContent(no);
		return content;
	}

	public void insertQuestion(BoardVo vo) {
		boardDao.insertQuestion(vo);		
	}

	public void insertComment(BoardVo vo) {
		boardDao.insertComment(vo);
	}

	public void updateAccept(Long no) {
		boardDao.updateAccept(no);
	}

	public void updateViewCount(Long no) {
		boardDao.updateViewCount(no);
	}
}