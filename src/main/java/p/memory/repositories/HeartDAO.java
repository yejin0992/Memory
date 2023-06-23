package p.memory.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.HeartDTO;



@Repository
public class HeartDAO {

	@Autowired	
	private SqlSessionTemplate mybatis;
	
	public HeartDTO select(int per_seq) {
		return mybatis.selectOne("Heart.select", per_seq);
	}
	
	// 게시글 작성 시 좋아요 테이블 추가
	public int insert(HeartDTO dto ) {
		return mybatis.insert("Heart.insert", dto);
	}
	
	// 좋아요 누른상태 true
	public int flagTrue(int per_seq) {
		return mybatis.update("Heart.flagTrue", per_seq);
	}
	
	// 좋아요 안누른상태 false
	public int flagFalse(int per_seq) {
		return mybatis.update("Heart.flagFlase", per_seq);
	}
}
