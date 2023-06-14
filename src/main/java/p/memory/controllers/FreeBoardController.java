package p.memory.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import p.memory.dto.CateDTO;
import p.memory.dto.FrReplyDTO;
import p.memory.dto.FreeBoardDTO;
import p.memory.services.CateService;
import p.memory.services.FrReplyService;
import p.memory.services.FreeBoardService;

@Controller
@RequestMapping("/freeBoard/")
public class FreeBoardController {

	// 서비스 소환
	@Autowired
	private FreeBoardService fBservice;
	// 세션 가져오기
	@Autowired
	private HttpSession session;
	// 서비스 소환
	@Autowired
	private FrReplyService replyService;
	//카테고리 서비스 
	//service
	@Autowired
	private CateService service;
	
	//글 작성시 말머리 list 가져오기 
	@RequestMapping("toFreeBoardWrite")
	public String toFreeBoardWrite() {
		return "redirect:/cate/selectCate";
	}
	// 글 수정시 말머리 list 가져오기
	@RequestMapping("toFreeBoardUpdate")
	public String toFreeBoardUpdate() {
		return "redirect:/cate/updateCate"; 
	}

	// 글 등록하기
	@RequestMapping("insertBoard")
	public String insertBoard(FreeBoardDTO dto) {
		System.out.println("insert컨트롤러 도착");
		// 테스트용 id 생성
		String userId = "tester123";
		session.setAttribute("loggedID", userId);
		String loggedID = (String) session.getAttribute("loggedID");
		// 아이디 세션 가져와서 dto writer에서 넣기
		dto.setFr_writer(loggedID);
		System.out.println("세션에서 가져온 로그인 확인 : " + loggedID);
		System.out.println("시퀀스 실험 (insert에서 받아오는지): " + dto.getFr_seq());
		int result = fBservice.insertBoard(dto);
		System.out.println("결과값 : " + result);
		return "redirect:/freeBoard/selectList";
	}
	

	// 글 목록불러오기
	@RequestMapping("selectList")
	public String selectList(Model model) {
		List<FreeBoardDTO> list = fBservice.selectList();
		model.addAttribute("list", list);
		return "/freeBoard/freeBoardList";
	}

	// 게시물 상세페이지 조회 (댓글포함) 
	@RequestMapping("selectBySeq")
	public String selectBySeq(Model model, Integer fr_seq) {
		System.out.println("시퀀스는 잘 받아오는지 확인 : " + fr_seq);
		FreeBoardDTO dto = fBservice.selectBySeq(fr_seq);
		System.out.println("작성자 확인 : " + dto.getFr_writer());
		System.out.println("조회수 확인 : " + dto.getFr_view_count());
		System.out.println("작성 날짜 확인 : " + dto.getFr_write_date());
		System.out.println("카테고리 확인 : " + dto.getFr_category());
		// 테스트용 id 세션 생성
		String userId = "tester123";
		session.setAttribute("loggedID", userId);
		String loggedID = (String) session.getAttribute("loggedID");
		// 조회수 증가 조회
		fBservice.updateViewCount(fr_seq); 
		model.addAttribute("conts", dto);
		// 댓글리스트 출력
		List<FrReplyDTO> list = replyService.selectComments(fr_seq);
		System.out.println("댓글리스트 서비스에서 가져오기 : " + list );
		model.addAttribute("list", list);
		return "freeBoard/freeBoardContent";
	}
	// 게시판 수정 페이지로 이동 
	@RequestMapping("toUpdateForm")
	public String toUpdate(Model model, Integer fr_seq) throws Exception {
		System.out.println("업데이트 폼 시퀀스 확인 : " + fr_seq);
		FreeBoardDTO dto = fBservice.selectBySeq(fr_seq);
		model.addAttribute("conts",dto); 
		//카테고리 리스트 가져오기
		List<CateDTO> list = service.selectCate(); 
		System.out.println("업데이트 리스트 확인 : " + list);
		model.addAttribute("category", list); 
		return "freeBoard/freeBoardUpdate"; 
	}
	// 게시판 수정 
	@RequestMapping("updateBoard")
	public String updateBoard(FreeBoardDTO dto) {
		// 테스트용 id 생성
		String userId = "tester123";
		session.setAttribute("loggedID", userId);
		String loggedID = (String) session.getAttribute("loggedID");
		// 아이디 세션 가져와서 dto writer에서 넣기
		dto.setFr_writer(loggedID);
		int result = fBservice.updateBoard(dto);
		int seq = dto.getFr_seq(); 
		System.out.println("게시판 수정 시퀀스 확인 : " + seq);
		return "redirect:/freeBoard/selectBySeq?fr_seq="+seq; 
		
	}

	// 게시판 삭제
	@RequestMapping("deleteBoard")
	public String deleteBoard(Integer fr_seq) {
		System.out.println("삭제 컨트롤러 도착");
		// 테스트용 id 생성
		String userId = "tester123";
		session.setAttribute("loggedID", userId);
		String loggedID = (String) session.getAttribute("loggedID");
		int result = fBservice.deleteBoard(fr_seq); 
		return "redirect:/freeBoard/selectList"; 
	}
	
	

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}

}
