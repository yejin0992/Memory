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

	// 게시판 출력 + 페이징
	public List<QnABoardDTO> selectAll(int startNavi,int endNavi) {

		Map<String, Object> map = new HashMap<>();
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		
		return db.selectList("QnABoard.selectNavi", map);
	}

	// 페이징 - 총 게시글 수
	public int selectTotalPost(){
	    return db.selectOne("QnABoard.selectTotalPost");
	}
	
	// 검색
	public List<QnABoardDTO> searchPost(int startPostNum, int endPostNum, String searchType, String keyword){
		Map<String, Object> map = new HashMap<>();
		map.put("startPostNum", startPostNum);
		map.put("endPostNum", endPostNum);
		map.put("searchType", searchType);
		map.put("keyword", keyword);
	    return db.selectList("QnABoard.searchPost",map);
	}
	

	// 조회수
	public int viewCount(int qa_seq) {
		int qa_view_count = db.selectOne("QnABoard.selectViewCount", qa_seq);
		qa_view_count++;

		Map<String, Object> map = new HashMap<>();

		map.put("qa_seq", qa_seq);
		map.put("qa_view_count", qa_view_count);

		return db.update("QnABoard.updateViewCount", map);
	}

	// 선택한 게시글 출력
	public QnABoardDTO selectOnePost(int qa_seq) {
		return db.selectOne("QnABoard.selectOnePost", qa_seq);
	}

	// 게시글 작성
	public int insert(QnABoardDTO qa_dto) {
		return db.insert("QnABoard.insert",qa_dto);
	}

	// 게시글 수정
	public int update(QnABoardDTO qa_dto) {
		return db.update("QnABoard.update", qa_dto);
	}

	// 게시글 삭제
	public int delete(int qa_seq) {
		return db.delete("QnABoard.delete", qa_seq);
	}

}
