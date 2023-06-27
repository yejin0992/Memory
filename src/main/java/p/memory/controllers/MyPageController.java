package p.memory.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import p.memory.dto.FreeBoardDTO;
import p.memory.dto.PerfumeMainDTO;
import p.memory.services.MyPageService;

@Controller
@RequestMapping("/myPage/")
public class MyPageController {

	// 세션 가져오기
	@Autowired
	private HttpSession session;

	@Autowired
	private MyPageService myPageService;

	// 마이페이지로 가서 좋아요한 향수 불러오기 + 로그인한 아이디 불러오기 
	@RequestMapping("toMyPageMain")
	public String toMyPgae(Model model) {
		System.out.println("좋아요한 향수 불러오기 컨트롤러 도착");
		String loggedID = (String) session.getAttribute("loginID");
		System.out.println("현재 로그인한 아이디 : " + loggedID);
		List<PerfumeMainDTO> likedPerfume = myPageService.selectLikedPerfume(loggedID);
		System.out.println("좋아요한 향수 : " + likedPerfume);
		model.addAttribute("likedPerfume", likedPerfume);
		model.addAttribute("loggedID", loggedID);
		return "/myPage/myPageMain";
	}

	// 내가 쓴 글 불러오기 + 페이징
	@RequestMapping("selectMyPost")
	public String selectMyPage(@RequestParam(defaultValue = "1", name = "cpage") int currentPage, Model model)
			throws Exception {

		String loggedID = (String) session.getAttribute("loginID");
		FreeBoardDTO dto = new FreeBoardDTO();
		dto.setFr_writer(loggedID);
		String fr_writer = dto.getFr_writer();
//		List<FreeBoardDTO> myPosts = myPageService.selectMyPost(fr_writer); 
//		model.addAttribute("myPosts",myPosts);
		// <페이징 관련 시작>
		// 총 게시물 수
		int recordsTotalCount = myPageService.getMyPostsCount(fr_writer);
		// 한페이지에 출력할 게시물 수
		int recordsPerPage = 10;
		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int pageNum = (int) Math.ceil((double) recordsTotalCount / recordsPerPage);
		System.out.println("하단 페이징 번호 : " + pageNum);
		// 출력할 게시물 시작 위치
		int start = (currentPage - 1) * recordsPerPage;
		int end = start + recordsPerPage - 1;
		List<FreeBoardDTO> myPostsList = myPageService.selectMyPost(fr_writer, start, end);
		System.out.println("내가 쓴 글 출력 : " + myPostsList);
		model.addAttribute("myPosts", myPostsList);
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
		return "/myPage/myPost";
	}

	// 내가 쓴 글 총 개수
	@RequestMapping("getMyPostsCount")
	public String getMyPostsCount(Model model) throws Exception {
		String loggedID = (String) session.getAttribute("loggedID");
		FreeBoardDTO dto = new FreeBoardDTO();
		// 로그인한 세션 넣어주기
		dto.setFr_writer(loggedID);
		String fr_writer = dto.getFr_writer();

		int myPostsCount = myPageService.getMyPostsCount(fr_writer);
		System.out.println("내가 쓴 글 총 개수 : " + myPostsCount);
		model.addAttribute("myPostsCount", myPostsCount);

		return "/myPage/myPageMain";
	}

	// 북마크한 글 불러오기 + 페이징
	@RequestMapping("selectBookmarkedPosts")
	public String selectBookmarkedPosts(@RequestParam(defaultValue = "1", name = "cpage") int currentPage, Model model)
			throws Exception {
		String loggedID = (String) session.getAttribute("loginID");
//		List<FreeBoardDTO> bookmarked = myPageService.selectBookmarkedPosts(loggedID);
//		model.addAttribute("bookmarked", bookmarked); 
		// <페이징 관련 시작>
		// 총 게시물 수
		int recordsTotalCount = myPageService.getBookmarkedPostsCount(loggedID);
		// 한페이지에 출력할 게시물 수
		int recordsPerPage = 10;
		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int pageNum = (int) Math.ceil((double) recordsTotalCount / recordsPerPage);
		System.out.println("하단 페이징 번호 : " + pageNum);
		// 출력할 게시물 시작 위치
		int start = (currentPage - 1) * recordsPerPage;
		int end = start + recordsPerPage - 1;
		List<FreeBoardDTO> bookmarkedPostsList = myPageService.selectBookmarkedPosts(loggedID, start, end);
		System.out.println("북마크한 글 출력 : " + bookmarkedPostsList);
		model.addAttribute("bookmarked", bookmarkedPostsList);
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

		return "/myPage/bookmarkedPosts";
	}

	// 북마크한 글 개수
	@RequestMapping("getBookmarkedPostsCount")
	public String getBookmarkedPostsCount(Model model) throws Exception {
		String loggedID = (String) session.getAttribute("loginID");
		int bookmarkedPostsCount = myPageService.getBookmarkedPostsCount(loggedID);
		System.out.println("북마크한 글 개수 : " + bookmarkedPostsCount);
		model.addAttribute("bookmarkedPostsCount", bookmarkedPostsCount);
		return "/myPage/bookmarkedPosts";
	}

	// 좋아요한 향수 불러오기
//	@RequestMapping("selectLikedPerfume")
//	public String selectLikedPerfume(Model model) throws Exception {
//		System.out.println("좋아요한 향수 불러오기 컨트롤러 도착");
//		String loggedID = (String) session.getAttribute("loginID");
//		List<PerfumeMainDTO> likedPerfume = myPageService.selectLikedPerfume(loggedID);
//		System.out.println("좋아요한 향수 : " + likedPerfume);
//		model.addAttribute("likedPerfume", likedPerfume);
//		return "/myPage/myPageMain";
//	}
	
	// 회원정보 수정하기 
	@RequestMapping("toUpdateMyInfo")
	public String toUpdateMyInfo () throws Exception {
		return "/member/myPageInfo"; 
	}



}
