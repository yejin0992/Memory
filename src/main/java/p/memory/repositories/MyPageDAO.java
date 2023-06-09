package p.memory.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.FreeBoardDTO;
import p.memory.dto.PerfumeMainDTO;
import p.memory.dto.QnABoardDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis; 
	
	// 내가 쓴 글 목록 + 페이징 
	public List<FreeBoardDTO> selectMyPost(String fr_writer, int start, int end) {
		System.out.println("서비스에서 전달받은 작성자 : " + fr_writer);
		Map<String, Object> params = new HashMap<>();
		params.put("fr_writer",fr_writer); 
		params.put("start", start); 
		params.put("end", end); 
		return mybatis.selectList("MyPage.selectMyPost", params); 
	}
	// 내가 쓴 글 총개수 
	public int getMyPostsCount(String fr_writer) {
		return mybatis.selectOne("MyPage.getMyPostsCount", fr_writer); 
	}
	// 북마크한 글 불러오기 + 페이징
	public List<FreeBoardDTO> selectBookmarkedPosts(String loggedID, int start, int end){
		Map<String, Object> params = new HashMap<>();
		params.put("id",loggedID); 
		params.put("start", start);
		params.put("end", end); 
		return mybatis.selectList("MyPage.selectBookmarkedPosts", params); 
	}
	// 북마크한 개수 
	public int getBookmarkedPostsCount(String loggedID) {
		return mybatis.selectOne("MyPage.getBookmarkedPostsCount",loggedID); 
	}
	// 좋아요한 향수 불러오기 
	public List<PerfumeMainDTO> selectLikedPerfume(String loggedID) {
		return mybatis.selectList("MyPage.selectLikedPerfume", loggedID); 
	}
	// 좋아요한 향수 개수 
	public int getLikedPerfumeCount (String loggedID) {
		System.out.println("좋아요 향수 개수 dao 도착");
		return mybatis.selectOne("MyPage.getLikedPerfumeCount",loggedID); 
	}
	// 내가 등록한 qna 불러오기 
	public List<QnABoardDTO> selectMyQna(String loggedID){
		return mybatis.selectList("MyPage.selectMyQna", loggedID); 
	}

	

}
