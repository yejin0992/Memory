package p.memory.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import p.memory.dto.FrReplyDTO;
import p.memory.services.FrReplyService;

@Controller
@RequestMapping("/frReply/")
public class FrReplyController {

	// 서비스 소환
	@Autowired
	private FrReplyService replyService;

	// 세션가져오기
	@Autowired
	private HttpSession session;

	// 댓글 작성
	@ResponseBody
	@RequestMapping("insertComment")
	public int insertComment(FrReplyDTO dto, int fr_seq) {
		System.out.println("댓글 작성 controller 도착 ");

		String loggedID = (String) session.getAttribute("loginID");
		// 아이디 세션 가져와서 dto writer에서 넣기
		dto.setRe_writer(loggedID);
		// 본문글 시퀀스 설정
		dto.setRe_seq(fr_seq);
		System.out.println("댓글 작성자 : " + dto.getRe_writer());
		System.out.println("댓글 내용 : " + dto.getRe_contents());
		System.out.println("게시판 시퀀스 : " + dto.getRe_seq());
		int result = replyService.insertComment(dto);
		return result;

	}
	
//	// 댓글 출력하기 
//	@ResponseBody
//	@RequestMapping("selectComments")
//	public String selectComments(Model model,int fr_seq){
//		// 테스트용 id 생성
//		String userId = "comment123";
//		session.setAttribute("loggedID", userId);
//		String loggedID = (String) session.getAttribute("loggedID");
//		//
//		List<FrReplyDTO> list = replyService.selectComments(fr_seq);
//		model.addAttribute("list", list);
//		return "freeBoard/freeBoardContent";
//	}
	
	// 댓글 삭제하기
	@RequestMapping("deleteComment")
	public String deleteComment(Integer re_seq, Integer fr_seq)throws Exception{
		// 테스트용 id 생성
		System.out.println("jsp에서 re_seq 받는지 확인 : " + re_seq);
		System.out.println("jsp에서 fr_seq 받는지 확인 : " + fr_seq);
		int result = replyService.deleteComment(re_seq); 
		System.out.println("댓삭결과 : " + result);
		 
		return "redirect:/freeBoard/selectBySeq?fr_seq="+fr_seq; 
	}
	// 댓글 수정하기 
	@RequestMapping("updateComment")
	public String updateComment(FrReplyDTO dto,Integer re_seq, Integer fr_seq)throws Exception {
		String contents = dto.getRe_contents();
		System.out.println("댓글 수정에서 넘어오는 댓글 내용확인 : " + contents);
		String loggedID = (String) session.getAttribute("loginID");
		// 아이디 세션 가져와서 dto writer에서 넣기
		dto.setRe_writer(loggedID);
		int result = replyService.updateComment(dto);
		System.out.println("댓삭 시퀀스 확인 : " + re_seq);
		System.out.println("본문 게시글 시퀀스 확인 : " + fr_seq);
		return "redirect:/freeBoard/selectBySeq?fr_seq="+fr_seq; 
	}


	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}
}
