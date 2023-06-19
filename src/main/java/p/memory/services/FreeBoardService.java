package p.memory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.FreeBoardDTO;
import p.memory.repositories.FreeBoardDAO;

@Service
public class FreeBoardService {
	
	//dao 소환
	@Autowired
	private FreeBoardDAO fBdao;
	// 글 등록하기 
	public int insertBoard(FreeBoardDTO dto) {
		return fBdao.insertBoard(dto); 
	}
	
	// 출력하기 
	public List<FreeBoardDTO> selectList(){
		return fBdao.selectList(); 
	}
	
	// 제목 클릭하면
	public FreeBoardDTO selectBySeq(Integer fr_seq){
		return fBdao.selectBySeq(fr_seq); 
	}
	// 게시판 수정
	public int updateBoard(FreeBoardDTO dto) {
		return fBdao.updateBoard(dto); 
	}
	// 게시판 삭제
	public int deleteBoard(Integer fr_seq) {
		return fBdao.deleteBoard(fr_seq); 
	}
	// 조회수
	public int updateViewCount(Integer fr_seq) {
		return fBdao.updateViewCount(fr_seq); 
	}
	// 검색
	public List<FreeBoardDTO> searchPosts (String field, String query){
		return fBdao.searchPosts(field, query); 
	}
	// 게시물 총 개수  
	public int getPostsCount () {
		return fBdao.getPostsCount(); 
	}
	// 페이징
	public List<FreeBoardDTO> selectBound(int start, int end){
		System.out.println(start);
		System.out.println(end);
		return fBdao.selectBound(start, end); 
	}
	
	
	

}
