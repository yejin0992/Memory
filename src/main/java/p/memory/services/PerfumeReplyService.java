package p.memory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.PerfumeReplyDTO;
import p.memory.repositories.PerfumeReplyDAO;

@Service
public class PerfumeReplyService {

	@Autowired
	private PerfumeReplyDAO replyDAO;
	
	// 댓글 입력
	public int insert(PerfumeReplyDTO dto) {
		return replyDAO.insert(dto);
	}
	// 댓글 출력
	public List<PerfumeReplyDTO> selectByPerSeq(int per_seq){
		return replyDAO.selectByPerSeq(per_seq);
	}
	// 댓글 수정
	public int update(PerfumeReplyDTO dto) {
		return replyDAO.update(dto);
	}
	// 댓글 삭제
	public int delete(int re_seq) {
		return replyDAO.delete(re_seq);
	}
	
	
}
