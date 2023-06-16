package p.memory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.QnAReplyDTO;
import p.memory.repositories.QnAReplyDAO;

@Service
public class QnAReplyService {

	@Autowired
	private QnAReplyDAO rdao;

	// 댓글 출력
	public List<QnAReplyDTO> select (int qa_seq) {
		return rdao.select(qa_seq);
	}
	
	// 댓글 입력
	public int insert (QnAReplyDTO rdto) {
		return rdao.insert(rdto);
	}

	// 댓글 수정
	public int update (QnAReplyDTO rdto) {
		return rdao.update(rdto);
	}
	
	// 댓글 삭제
	public int delete (int re_seq, int qa_seq) {
		return rdao.delete(re_seq, qa_seq);
	}
}
