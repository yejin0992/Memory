package p.memory.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import p.memory.commons.Settings;
import p.memory.dto.QnABoardDTO;
import p.memory.dto.QnAFileDTO;
import p.memory.dto.QnAReplyDTO;
import p.memory.services.QnABoardService;
import p.memory.services.QnAFileService;
import p.memory.services.QnAReplyService;


@Controller
@RequestMapping("/qnaBoard/")
public class QnABoardController {

	@Autowired
	private HttpSession session;
	@Autowired
	private QnABoardService qnaService;
	@Autowired
	private QnAReplyService rService;
	@Autowired
	private QnAFileService fService;

	// 글쓰기 페이지로
	@RequestMapping("toWritingForm")
	public String toWritingForm() {
		return "/qnaBoard/writingForm";
	}

	// 게시판 출력 + 페이징 + 총게시글수
	@RequestMapping("boardList")
	public String boardList(QnABoardDTO qa_dto, Model model,
			@RequestParam(value = "cpage", required = false, defaultValue = "1") int currentPage) {
		System.out.println("게시판 전체출력");

		// 총게시글수
		int totalPosts = qnaService.selectTotalPost();
		int postPerPage = Settings.BOARD_POST_COUNT_PER_PAGE; 
		int naviesPerPage = Settings.BOARD_NAVI_COUNT_PER_PAGE; 
		int totalPages = (int) Math.ceil(qnaService.selectTotalPost() / (double) Settings.BOARD_POST_COUNT_PER_PAGE); 
		int startPostNum = (currentPage - 1) * naviesPerPage + 1;
		int endPostNum = currentPage * naviesPerPage; //
		int firstNavi = 1;

		if (totalPosts % postPerPage > 0) { 
			totalPages = totalPosts / postPerPage + 1;
		} else {
			totalPages = totalPosts / postPerPage; 
		}

		if (currentPage < 1) { 
			currentPage = 1; 
		} else if (currentPage > totalPages) { 
			currentPage = totalPages; 
		}

        // 게시판글전체출력
		List<QnABoardDTO> list = qnaService.selectAll(startPostNum, endPostNum);
		System.out.println(startPostNum + "/" + endPostNum);
		// 페이징
		List<String> pageNavi = qnaService.getPageNavi(totalPages, currentPage);

		model.addAttribute("list", list);
		model.addAttribute("firstNavi", firstNavi);
		model.addAttribute("lastNavi", totalPages);
		model.addAttribute("cpage", currentPage);
		model.addAttribute("pageNavi", pageNavi);

		return "/qnaBoard/qnaBoardForm";
	}

	// 검색
	@RequestMapping("searchPost")
	public String searchPost(Model model,
			@RequestParam(value = "cpage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		System.out.println("검색에도착: " + searchType + "/" + keyword);
		int postPerPage = Settings.BOARD_POST_COUNT_PER_PAGE; 
		int naviesPerPage = Settings.BOARD_NAVI_COUNT_PER_PAGE; 
		int startPostNum = (currentPage - 1) * naviesPerPage + 1;
		int endPostNum = currentPage * naviesPerPage;
		int totalPages = (int) Math.ceil(qnaService.selectTotalPost() / (double) Settings.BOARD_POST_COUNT_PER_PAGE);

		List<QnABoardDTO> list = qnaService.searchPost(startPostNum, endPostNum, searchType, keyword);
		System.out.println(postPerPage + "/" + startPostNum + "/" + searchType + "/" + keyword);

		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("cpage", currentPage);

		return "/qnaBoard/qnaBoardForm";
	}

	// 조회수
	@RequestMapping("viewCount")
	public String viewCount(int qa_seq) {
		qnaService.viewCount(qa_seq);
		return "redirect:/qnaBoard/selectOnePost?qa_seq=" + qa_seq;
	}

	// 선택한 게시글 출력
	@RequestMapping("selectOnePost")
	public String selectOnePost(int qa_seq, Model model) {
		System.out.println("thispost: " + qa_seq);
		QnABoardDTO dto = qnaService.selectOnePost(qa_seq);
		model.addAttribute("post", dto);
		// 댓글출력
		List<QnAReplyDTO> rlist = rService.select(qa_seq);
		model.addAttribute("reply", rlist);
		// 파일 리스트 출력
		List<QnAFileDTO> flist = fService.selectAll(qa_seq);
		model.addAttribute("file", flist);
		return "/qnaBoard/pickOnePost";
	}

	// 게시글 작성
	@RequestMapping("insertPost")
	public String insert(QnABoardDTO qa_dto, MultipartFile[] files) throws Exception {
		String id = (String) session.getAttribute("loginID");
		qa_dto.setQa_writer(id);
		System.out.println("파일이름" + files);

		int qa_seq = qnaService.insert(qa_dto);

		System.out.println("게시글작성 : " + qa_dto.getQa_seq() + "/" + qa_dto.getQa_writer() + "/" + qa_dto.getQa_title()
				+ "/" + qa_dto.getQa_contents() + "/" + qa_dto.getQa_view_count() + "/" + qa_dto.getQa_write_date());

		System.out.println("페런트시ㄴ퀀스 : " + qa_seq);

		String realPath = session.getServletContext().getRealPath("qnaUpload");
		System.out.println(realPath);
		fService.insert(realPath, files, qa_seq);

		return "redirect:/qnaBoard/boardList";
	}

	// 게시글 수정
	@RequestMapping("updatePost")
	public String update(QnABoardDTO qa_dto, RedirectAttributes rttb) {
		String id = (String) session.getAttribute("loginID");
		qa_dto.setQa_writer(id);
		System.out.println("수정수정 : " + qa_dto.getQa_seq() + "/" + qa_dto.getQa_writer() + "/" + qa_dto.getQa_title()
				+ "/" + qa_dto.getQa_contents() + "/" + qa_dto.getQa_view_count() + "/" + qa_dto.getQa_write_date());
		qnaService.update(qa_dto);
		rttb.addFlashAttribute("status", "update");
		System.out.println("update완료");
		return "redirect:/qnaBoard/selectOnePost?qa_seq="+qa_dto.getQa_seq()+ "&status=update";
	}

	// 게시글 삭제
	@RequestMapping("delete")
	public String delete(int qa_seq) {
		qnaService.delete(qa_seq);
		return "redirect:/qnaBoard/boardList";
	}

}
