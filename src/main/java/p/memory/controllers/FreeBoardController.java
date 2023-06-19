package p.memory.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import p.memory.commons.Settings;
import p.memory.dto.CateDTO;
import p.memory.dto.FrReplyDTO;
import p.memory.dto.FreeBoardDTO;
import p.memory.dto.FreeImageDTO;
import p.memory.services.CateService;
import p.memory.services.FrReplyService;
import p.memory.services.FreeBoardService;
import p.memory.services.FreeImageService;
import p.memory.statics.FreeBoardSettings;

@Controller
@RequestMapping("/freeBoard/")
public class FreeBoardController {

	// 서비스 소환
	@Autowired
	private FreeBoardService fBservice;
	// 세션 가져오기
	@Autowired
	private HttpSession session;
	// 댓글 서비스 소환
	@Autowired
	private FrReplyService replyService;
	// 카테고리 서비스
	// service
	@Autowired
	private CateService service;
	// 자유게시판 이미지(첨부파일) 서비스
	@Autowired
	private FreeImageService imageService;

	// 글 작성시 말머리 list 가져오기
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
	public String insertBoard(FreeBoardDTO dto, MultipartFile[] files) throws Exception {
		System.out.println("insert컨트롤러 도착");
		// 테스트용 id 생성
		String userId = "tester123";
		session.setAttribute("loggedID", userId);
		String loggedID = (String) session.getAttribute("loggedID");
		// 아이디 세션 가져와서 dto writer에서 넣기
		dto.setFr_writer(loggedID);
		System.out.println("세션에서 가져온 로그인 확인 : " + loggedID);
		int fr_seq = fBservice.insertBoard(dto);
		System.out.println("시퀀스(insert에서 받아오는지): " + fr_seq);
		// 첨부파일
		String realPath = session.getServletContext().getRealPath("upload");
		System.out.println("realPath : " + realPath);
		imageService.insertImage(realPath, fr_seq, files);
		return "redirect:/freeBoard/selectList";
	}

	// 글 목록불러오기 + 페이징
	@RequestMapping("selectList")
	public String selectList(@RequestParam(defaultValue = "1", name = "cpage") int currentPage, Model model) {
//		List<FreeBoardDTO> list = fBservice.selectList();
//		model.addAttribute("list", list);
		// <페이징 관련 시작>
		// 총 게시물 수 
		int recordsTotalCount = fBservice.getPostsCount(); // 1. 총 게시물수
		// 한페이지에 출력할 게시물 수
		int recordsPerPage = 10;
		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int pageNum = (int) Math.ceil((double) recordsTotalCount / recordsPerPage);
		System.out.println("하단 페이징 번호 : " + pageNum);
		// 출력할 게시물 시작 위치 
		int start = (currentPage - 1) * recordsPerPage;
		int end = start + recordsPerPage -1 ; 
		fBservice.selectBound(start, end); 
		List<FreeBoardDTO> list = fBservice.selectBound(start, end);
		model.addAttribute("list",list); 
		model.addAttribute("pageNum", pageNum); 
		// 한페이지에 표시할 페이징 번호 개수 
		int naviCountPerPage = 10;
		// 마지막 페이징 번호 
		int endNavi = (int)(Math.ceil((double)currentPage / (double)naviCountPerPage) * naviCountPerPage);
		// 첫번째 페이징 번호
		int startNavi = endNavi - (naviCountPerPage-1); 
		// 마지막 번호 재계산
		int endPageNum_tmp = (int)(Math.ceil((double)recordsTotalCount / (double)naviCountPerPage));
		 
		if(endNavi > endPageNum_tmp) {
		 endNavi = endPageNum_tmp;
		}
		
		boolean prev = startNavi != 1;
		boolean next = endNavi * naviCountPerPage < recordsTotalCount;
		model.addAttribute("startNavi", startNavi);
		model.addAttribute("endNavi",endNavi);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next); 
	
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
		System.out.println("댓글리스트 서비스에서 가져오기 : " + list);
		model.addAttribute("list", list);
		// 이미지 출력
		try {
			List<FreeImageDTO> imageList = imageService.selectImagesByFr_seq(fr_seq);
			model.addAttribute("imageList", imageList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "freeBoard/freeBoardContent";
	}

	// 조회수
	/*
	 * @RequestMapping("viewCount") public String viewCount(int fr_seq) { fBservice.
	 * }
	 */
	// 게시판 수정 페이지로 이동
	@RequestMapping("toUpdateForm")
	public String toUpdate(Model model, Integer fr_seq) throws Exception {
		System.out.println("업데이트 폼 시퀀스 확인 : " + fr_seq);
		FreeBoardDTO dto = fBservice.selectBySeq(fr_seq);
		model.addAttribute("conts", dto);
		// 카테고리 리스트 가져오기
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
		// 1) 글만 있는데 사진을 추가해서 게시글을 수정할 경우
		// 2) 글이랑 사진 둘다있고 사진을 삭제해서 게시글을 수정할 경우
		// 3) 글이랑 사진 둘 다 있고 사진을 수정해서 게시글을 수정할 경우
		return "redirect:/freeBoard/selectBySeq?fr_seq=" + seq;

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
		try {
			imageService.deleteImages(fr_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/freeBoard/selectList";
	}

	// 검색
	@RequestMapping("searchPosts")
	public String searchPosts(@RequestParam(value = "field", required = false, defaultValue = "") String field,
			@RequestParam(value = "query", required = false, defaultValue = "") String query, Model model) {

		List<FreeBoardDTO> searchResults = fBservice.searchPosts(field, query);
		model.addAttribute("searchResults", searchResults);

		return "freeBoard/searchResult";
	}

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}

}
