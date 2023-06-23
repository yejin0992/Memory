package p.memory.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.PerfumeReplyDTO;

@Repository
public class PerfumeReplyDAO {

	@Autowired	
	private SqlSessionTemplate mybatis;
	// 댓글 입력
	public int insert(PerfumeReplyDTO dto) {
		return mybatis.insert("Reply.insert", dto);
	}
	// 댓글 출력
	public List<PerfumeReplyDTO> selectByPerSeq(int per_seq){
		return mybatis.selectList("Reply.select", per_seq);
	}
	// 댓글 수정
	public int update (PerfumeReplyDTO dto) {
		return mybatis.update("Reply.update", dto);
	}
	// 댓글 삭제
	public int delete(int re_seq) {
		return mybatis.delete("Reply.delete", re_seq);
	}

}
