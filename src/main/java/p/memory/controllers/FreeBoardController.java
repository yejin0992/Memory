package p.memory.controllers;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import p.memory.dto.CateDTO;
import p.memory.dto.FrReplyDTO;
import p.memory.dto.FreeBoardDTO;
import p.memory.dto.FreeImageDTO;
import p.memory.services.BookmarkService;
import p.memory.services.CateService;
import p.memory.services.FrReplyService;
import p.memory.services.FreeBoardService;
import p.memory.services.FreeImageService;

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
	// 북마크 서비스
	@Autowired
	private BookmarkService bookmarkService;

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
		String loggedID = (String) session.getAttribute("loginID");
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

	// 글 목록불러오기 + 페이징 + 검색 + 댓글수 출력하기
	@RequestMapping("selectList")
	public String selectList(@RequestParam(defaultValue = "1", name = "cpage") int currentPage,
			@RequestParam(value = "field", required = false, defaultValue = "fr_title") String field,
			@RequestParam(value = "query", required = false, defaultValue = "") String query, Model model)
			throws Exception {
//		List<FreeBoardDTO> list = fBservice.selectList();
//		model.addAttribute("list", list);

		// <페이징 관련 시작>
		// 총 게시물 수
		int recordsTotalCount = fBservice.getPostsCount(field, query);
		// 한페이지에 출력할 게시물 수
		int recordsPerPage = 10;
		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int pageNum = (int) Math.ceil((double) recordsTotalCount / recordsPerPage);
		System.out.println("하단 페이징 번호 : " + pageNum);
		// 출력할 게시물 시작 위치
		int start = (currentPage - 1) * recordsPerPage;
		int end = start + recordsPerPage - 1;
		List<FreeBoardDTO> list = fBservice.selectBoundWithSearch(start, end, field, query);
		// 시간 표기 형식 변경
		for (FreeBoardDTO dto : list) {
			Timestamp writeDate = dto.getFr_write_date();
			System.out.println("dto에서 꺼내온 writeDate: " + writeDate);
			String formattedDate = dto.formatWriteDate();
			dto.setFormattedDate(formattedDate);
			System.out.println("형식 변환된 날짜 : " + dto.getFormattedDate());
		}
		// 각 게시물 댓글 개수 설정
		for (FreeBoardDTO dto : list) {
			int commentCount = replyService.getCommentsCount(dto.getFr_seq());
			System.out.println("각 게시판 별 댓글 개수 : " + commentCount);
			dto.setCommentCount(commentCount);
			System.out.println("게시물 댓글 개수 확인 : " + dto.getCommentCount());
		}

//		FreeBoardDTO dto = new FreeBoardDTO();
//		Timestamp writeDate = dto.getFr_write_date(); 
//		String formattedDate = dto.getFormedDate(); 
//		dto.setFormattedDate(formattedDate); 
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);

		// 한페이지에 표시할 페이징 번호 개수
		int naviCountPerPage = 10;
		// 마지막 페이징 번호
		int endNavi = (int) (Math.ceil((double) currentPage / (double) naviCountPerPage) * naviCountPerPage);
		// 첫번째 페이징 번호
		int startNavi = endNavi - (naviCountPerPage - 1);
		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) recordsTotalCount / (double) naviCountPerPage));

		if (endNavi > endPageNum_tmp) {
			endNavi = endPageNum_tmp;
		}

		boolean prev = startNavi != 1;
		boolean next = endNavi * naviCountPerPage < recordsTotalCount;
		model.addAttribute("startNavi", startNavi);
		model.addAttribute("endNavi", endNavi);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);

		// 검색 조건과 검색어 그대로 jsp에 돌려주기
		model.addAttribute("field", field);
		model.addAttribute("query", query);
		// 댓글 수 출력하기
//		FreeBoardDTO dto = new FreeBoard(); 
//		replyService.selectCommentsCount(fr_seq); 

		return "/freeBoard/freeBoardList";
	}

	// 게시물 상세페이지 조회 (댓글포함)
	@RequestMapping("selectBySeq")
	public String selectBySeq(HttpServletRequest request, HttpServletResponse response, Model model, Integer fr_seq) {
		System.out.println("시퀀스는 잘 받아오는지 확인 : " + fr_seq);
		String loggedID = (String) session.getAttribute("loginID");
		// 조회수 증가 조회
		// 쿠키 이름 설정
		String cookieName = "free_board_viewed" + fr_seq;
		System.out.println("쿠키 이름 : " + cookieName);
		// 쿠키 값 가져오기
		Cookie[] cookies = request.getCookies();
		System.out.println("쿠키값 가져오는지 확인 : " + cookies);
		boolean isViewed = false;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(cookieName)) {
					isViewed = true;
					break;
				}
			}
		}
		if (!isViewed) {
			fBservice.updateViewCount(fr_seq);
			// 조회수 증가 로직 수행
			Cookie viewedCookie = new Cookie(cookieName, "true");
			// 헤당 게시물을 이미 조회하는 것을 나타냄
			viewedCookie.setMaxAge(2 * 60 * 60); // 쿠키 유효 기간 설정 (사이트 전역에서 사용)
			viewedCookie.setPath("/"); // 쿠키의 유효 경로 설정
			response.addCookie(viewedCookie);
		}
		// 게시물 조회 및 뷰 페이지로 출력
		FreeBoardDTO dto = fBservice.selectBySeq(fr_seq);
		// 시간 표기 형식 변경
		Timestamp writeDate = dto.getFr_write_date();
		System.out.println("dto에서 꺼내온 writeDate: " + writeDate);
		String formattedDate = dto.formatWriteDate();
		dto.setFormattedDate(formattedDate);
		//
		System.out.println("형식 변환된 날짜 : " + dto.getFormattedDate());
		System.out.println("작성자 확인 : " + dto.getFr_writer());
		// 댓글 수 불러오기
		int commentCount = replyService.getCommentsCount(fr_seq);
		System.out.println("각 게시판 별 댓글 개수 : " + commentCount);
		dto.setCommentCount(commentCount);
		System.out.println("게시물 댓글 개수 확인 : " + dto.getCommentCount());
		model.addAttribute("conts", dto);
		// 댓글
		// 댓글리스트 출력
		List<FrReplyDTO> list = replyService.selectComments(fr_seq);
		// 댓글 시간 표기 형식 변경
		for (FrReplyDTO frdto : list) {
			Timestamp reWriteDate = frdto.getRe_write_date();
			System.out.println("dto에서 꺼내온 writeDate: " + writeDate);
			String formattedReDate = frdto.formatWriteDate();
			frdto.setFormattedDate(formattedReDate);
			System.out.println("형식 변환된 날짜 : " + frdto.getFormattedDate());
		}
		System.out.println("댓글리스트 서비스에서 가져오기 : " + list);
		model.addAttribute("list", list);
		// 이미지 출력
		try {
			List<FreeImageDTO> imageList = imageService.selectImagesByFr_seq(fr_seq);
			model.addAttribute("imageList", imageList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 북마크 결과 출력
		int isBookmarked = bookmarkService.selectBookmark(fr_seq, loggedID);
		System.out.println("result 결과 : " + isBookmarked);
		model.addAttribute("isBookmarked", isBookmarked);
		return "freeBoard/freeBoardContent";
	}

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
		// 이미지 출력
		try {
			List<FreeImageDTO> imageList = imageService.selectImagesByFr_seq(fr_seq);
			model.addAttribute("imageList", imageList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "freeBoard/freeBoardUpdate";
	}

	// 게시판 수정
	@RequestMapping("updateBoard")
	public String updateBoard(FreeBoardDTO dto) {
		String loggedID = (String) session.getAttribute("loginID");
		// 아이디 세션 가져와서 dto writer에서 넣기
		dto.setFr_writer(loggedID);
		int result = fBservice.updateBoard(dto);
		int seq = dto.getFr_seq();
		System.out.println("게시판 수정 시퀀스 확인 : " + seq);
		return "redirect:/freeBoard/selectBySeq?fr_seq=" + seq;

	}

	// 게시판 삭제
	@RequestMapping("deleteBoard")
	public String deleteBoard(Integer fr_seq) {
		System.out.println("삭제 컨트롤러 도착");
		int result = fBservice.deleteBoard(fr_seq);
		try {
			imageService.deleteImages(fr_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/freeBoard/selectList";
	}

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}

}
