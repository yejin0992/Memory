package p.memory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.FrReplyDTO;
import p.memory.repositories.FrReplyDAO;

@Service
public class FrReplyService {
	
	//dao 소환
	@Autowired
	private FrReplyDAO FRdao;
	
	// 댓글달기
	public int insertComment(FrReplyDTO dto) {
		System.out.println("댓글 insert 서비스 확인");
		return FRdao.insertComment(dto); 
	}
	// 댓글 출력하기 
	public List<FrReplyDTO> selectComments(int fr_seq) {
		System.out.println("댓글 출력하기 서비스 도착");
		System.out.println("컨트롤러에서 전달받은 시퀀스 : " + fr_seq);
		return FRdao.selectComments(fr_seq); 
	}
	
	//댓삭
	public int deleteComment(int re_seq) {
		return FRdao.deleteComment(re_seq); 
	}
	//댓수정
	public int updateComment(FrReplyDTO dto) {
		return FRdao.updateComment(dto); 
	}

}
