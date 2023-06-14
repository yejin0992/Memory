package p.memory.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.FreeBoardDTO;

@Repository
public class FreeBoardDAO {
	
	// mybatis 소환
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 글 등록
	public int insertBoard(FreeBoardDTO dto) {
		return mybatis.insert("FreeBoard.insertBoard", dto); 
	}
	
	// 글 목록 불러오기
	public List<FreeBoardDTO> selectList() {
		return mybatis.selectList("FreeBoard.selectList"); 
	}
	// 제목 클릭하면 ㄲ 
	public FreeBoardDTO selectBySeq(Integer fr_seq) {
		return mybatis.selectOne("FreeBoard.selectBySeq", fr_seq); 
	}
	// 수정
	public int updateBoard(FreeBoardDTO dto) {
		return mybatis.update("FreeBoard.updateBoard", dto); 
	}
	// 삭제
	public int deleteBoard(Integer fr_seq) {
		return mybatis.delete("FreeBoard.deleteBoard", fr_seq); 
	}
	// 조회수 
	public int updateViewCount(Integer fr_seq) {
		return mybatis.update("FreeBoard.updateViewCount", fr_seq);  
	}
	

}
