package p.memory.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.QnAReplyDTO;

@Repository
public class QnAReplyDAO {

	@Autowired
	private SqlSessionTemplate db;

	// 댓글 출력
	public List<QnAReplyDTO> select(int qa_seq) {
		return db.selectList("QnAReply.select", qa_seq);
	}

	// 댓글 입력
	public int insert (QnAReplyDTO rdto) {
		return db.insert("QnAReply.insert", rdto);
	}

	// 댓글 수정
	public int update (QnAReplyDTO rdto) {
		return db.update("QnAReply.update", rdto);
	}

	// 댓글 삭제
	public int delete(int re_seq, int qa_seq) {
		Map<String, Object> map = new HashMap<>();
		map.put("re_seq", re_seq);
		map.put("qa_seq", qa_seq);
		
		return db.delete("QnAReply.delete", map);
	}

}
