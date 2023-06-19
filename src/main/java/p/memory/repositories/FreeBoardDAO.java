package p.memory.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		mybatis.insert("FreeBoard.insertBoard", dto);
		return dto.getFr_seq();  
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
	// 검색
	public List<FreeBoardDTO> searchPosts(String field, String query){
		Map<String, Object> params = new HashMap<>();
		params.put("field", field);
		params.put("query", query);
		return mybatis.selectList("FreeBoard.searchPosts", params); 
	}
	//게시물 총개수 
	public int getPostsCount() {
		return mybatis.selectOne("FreeBoard.getPostsCount"); 
	}
	//페이징 
	public List<FreeBoardDTO> selectBound(int start, int end) {
		System.out.println(start);
		System.out.println(end);
		Map<String, Object> params = new HashMap<>(); 
		params.put("start", start);
		params.put("end", end);
		return mybatis.selectList("FreeBoard.selectBound", params); 
	}

	
	

}
