package p.memory.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.QnABoardDTO;

@Repository
public class QnABoardDAO {

	@Autowired
	private SqlSessionTemplate db;
	
	// 게시판 전체 출력
	public List<QnABoardDTO> boardList(QnABoardDTO qa_dto) { 
		return db.selectList("QnABoard.boardList",qa_dto);
	}
	
	// 조회수
	public int viewCount (int qa_seq) {
		int qa_view_count = db.selectOne("QnABoard.selectViewCount",qa_seq);
		qa_view_count++;
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("qa_seq", qa_seq);
		map.put("qa_view_count", qa_view_count);
		
		return db.update("QnABoard.updateViewCount",map);
	}
	
	// 선택한 게시글 보기
	public QnABoardDTO selectOnePost (int qa_seq) {
		return db.selectOne("QnABoard.selectOnePost",qa_seq);
	}
	
	// 게시글 작성
	public int insert (QnABoardDTO qa_dto) {
		return db.insert("QnABoard.insertPost",qa_dto);
	}
	
	// 게시글 수정
	public int update (QnABoardDTO qa_dto) {
		return db.update("QnABoard.update",qa_dto);
	}
	
	// 게시글 삭제
	public int delete (int qa_seq) {
		return db.delete("QnABoard.delete",qa_seq);
	}

}
