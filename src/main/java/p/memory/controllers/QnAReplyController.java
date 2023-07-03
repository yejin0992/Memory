package p.memory.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import p.memory.dto.QnAReplyDTO;
import p.memory.services.QnAReplyService;

@Controller
@RequestMapping("/reply/")
public class QnAReplyController {

	
	@Autowired
	private QnAReplyService rService;
	@Autowired
	private HttpSession session;

	// 댓글 입력
	@RequestMapping("replyInsert")
	public String insert(QnAReplyDTO rdto,int qnaCpage) {
		System.out.println(rdto.getRe_seq()+"/"+rdto.getRe_writer()+"/"+rdto.getRe_contents()+"/"+rdto.getRe_write_date()+"/"+rdto.getQa_seq());
		rService.insert(rdto);
		return "redirect:/qnaBoard/selectOnePost?qa_seq="+rdto.getQa_seq()+"&qnaCpage="+qnaCpage;
	}
	
	// 댓글 수정
	@RequestMapping("replyUpdate")
	public String update (QnAReplyDTO rdto,int qnaCpage) {
		String id = (String) session.getAttribute("loginID");
		rdto.setRe_writer(id);
		System.out.println(rdto.getRe_seq()+"/"+rdto.getRe_writer()+"/"+rdto.getRe_contents()+"/"+rdto.getRe_write_date()+"/"+rdto.getQa_seq());

		rService.update(rdto);
		return "redirect:/qnaBoard/selectOnePost?qa_seq="+rdto.getQa_seq()+"&qnaCpage="+qnaCpage;
	}
	
	// 댓글 삭제
	@RequestMapping("replyDelete")
	public String delete (int re_seq, int qa_seq, int qnaCpage) {
		rService.delete(re_seq, qa_seq);
		return "redirect:/qnaBoard/selectOnePost?qa_seq="+qa_seq+"&qnaCpage="+qnaCpage;
		
	}
}
