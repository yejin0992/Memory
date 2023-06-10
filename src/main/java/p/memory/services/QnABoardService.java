package p.memory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.QnABoardDTO;
import p.memory.repositories.QnABoardDAO;

@Service
public class QnABoardService {

	@Autowired
	private QnABoardDAO qa_dao;
	
	// 게시판 전체 출력
	public List<QnABoardDTO> boardList (QnABoardDTO qa_dto) {
		return qa_dao.boardList(qa_dto);
	}
	
	// 조회수
	public int viewCount (int qa_seq) {
		return qa_dao.viewCount(qa_seq);
	}
	
	// 선택한 게시글 보기
	public QnABoardDTO selectOnePost (int qa_seq) {
		return qa_dao.selectOnePost(qa_seq);
	}

	// 게시글 작성
	public int insert (QnABoardDTO qa_dto) {
		return qa_dao.insert(qa_dto);
	}

	// 게시글 수정
	public int update (QnABoardDTO qa_dto) {
		return qa_dao.update(qa_dto);
	}
	
	// 게시글 삭제
	public int delete (int qa_seq) {
		return qa_dao.delete(qa_seq);
	}
}
