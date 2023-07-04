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
		String writer = (String)session.getAttribute("loginID");
		dto.setId(writer);
		replyService.insert(dto);
		if(dto.getCpage()==0) {
			return "redirect:/perfume/bestSelect?per_seq="+dto.getPer_seq();
		}else {
			return "redirect:/perfume/select?per_seq="+dto.getPer_seq()+"&cpage="+dto.getCpage();
		}
	}	
	
	@RequestMapping("delete")
	public String delete(int re_seq, int per_seq, int cpage) {
		replyService.delete(re_seq);
		if(cpage==0) {
			return "redirect:/perfume/bestSelect?per_seq="+per_seq;
		}else {
			return "redirect:/perfume/select?per_seq="+per_seq+"&cpage="+cpage;
		}
	}
	
	@RequestMapping("update")
	public String update(PerfumeReplyDTO dto) {
		replyService.update(dto);
		if(dto.getCpage()==0) {
			return "redirect:/perfume/bestSelect?per_seq="+dto.getPer_seq();
		}else {
		return "redirect:/perfume/select?per_seq="+dto.getPer_seq()+"&cpage="+dto.getCpage();
		}
	}
	
	
}
