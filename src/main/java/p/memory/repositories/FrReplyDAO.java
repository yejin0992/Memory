package p.memory.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.FrReplyDTO;

@Repository
public class FrReplyDAO {

	
	// mybatis 소환 
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertComment(FrReplyDTO dto) {
		System.out.println("댓글 dao insert 확인 ");
		return mybatis.insert("FrReply.insertComment", dto); 
	}
	
	public List<FrReplyDTO> selectComments(int fr_seq) {
		System.out.println("서비스에서 전달받은 시퀀스 : " + fr_seq);
		return mybatis.selectList("FrReply.selectComments", fr_seq); 
	}
	// 댓삭
	public int deleteComment(int re_seq) {
		return mybatis.delete("FrReply.deleteComment",re_seq); 
	}
	
	// 수정
	public int updateComment(FrReplyDTO dto) {
		return mybatis.update("FrReply.updateComment", dto); 
	}
	// 댓글 수 출력
	public int getCommentsCount(int fr_seq) {
		return mybatis.selectOne("FrReply.getCommentsCount",fr_seq); 
	}
}
