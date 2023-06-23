package p.memory.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import p.memory.dto.PerfumeReplyDTO;
import p.memory.services.PerfumeReplyService;

@Controller
@RequestMapping("perfumeReply")
public class PerfumeReplyController {

	@Autowired
	HttpSession session;
	
	@Autowired
	private PerfumeReplyService replyService;
	
	@RequestMapping("insert")
	public String insert(PerfumeReplyDTO dto) {
		String writer = (String)session.getAttribute("writer");
		dto.setWriter(writer);
		System.out.println("댓글 시퀀스 : " +dto.getRe_seq()+"작성자 : "+dto.getWriter()+"내용 : "+dto.getContents()+"퍼퓸시퀀스 : "+dto.getPer_seq());
		replyService.insert(dto);
		return "redirect:/perfume/select?per_seq="+dto.getPer_seq();
	}
	
	@RequestMapping("delete")
	public String delete(int re_seq, int per_seq) {
		System.out.println("넘어온 댓글 시퀀스 : "+re_seq);
		replyService.delete(re_seq);
		return "redirect:/perfume/select?per_seq="+per_seq;
	}
	
	@RequestMapping("update")
	public String update(PerfumeReplyDTO dto) {
		System.out.println("댓글 업데이트 도착");
		replyService.update(dto);
		return "redirect:/perfume/select?per_seq="+dto.getPer_seq();
	}
	
	
}
