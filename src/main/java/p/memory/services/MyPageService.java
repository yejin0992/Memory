package p.memory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.FreeBoardDTO;
import p.memory.dto.PerfumeMainDTO;
import p.memory.dto.QnABoardDTO;
import p.memory.repositories.MyPageDAO;

@Service
public class MyPageService {

	
	@Autowired
	private MyPageDAO myDAO; 
	
	public List<FreeBoardDTO> selectMyPost(String fr_writer, int start, int end) {
		System.out.println("컨트롤러에서 전달받은 작성자 : " + fr_writer);
		return myDAO.selectMyPost(fr_writer, start, end); 
	}
	
	public int getMyPostsCount(String fr_writer) {
		return myDAO.getMyPostsCount(fr_writer); 
	}
	
	// 북마크 
	public List<FreeBoardDTO> selectBookmarkedPosts(String loggedID, int start, int end){
		return myDAO.selectBookmarkedPosts(loggedID, start, end); 
	}
	
	// 북마크 개수 
	public int getBookmarkedPostsCount(String loggedID) {
		return myDAO.getBookmarkedPostsCount(loggedID); 
	}
	
	// 좋아요한 향수 
	public List<PerfumeMainDTO> selectLikedPerfume(String loggedID){
		return myDAO.selectLikedPerfume(loggedID); 
	}
	// 좋아요한 향수 개수
	public int getLikedPerfumeCount(String loggedID) {
		return myDAO.getLikedPerfumeCount(loggedID);
	}
	// 내가 등록한 qna
	public List<QnABoardDTO> selectMyQna(String loggedID){
		return myDAO.selectMyQna(loggedID); 
	}

}
