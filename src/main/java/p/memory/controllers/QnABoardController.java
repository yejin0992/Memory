package p.memory.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import p.memory.dto.QnABoardDTO;
import p.memory.services.QnABoardService;

@Controller
@RequestMapping("/qnaBoard/")
public class QnABoardController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private QnABoardService qnaService;
	
	
	// 글쓰기 페이지로
	@RequestMapping("toWritingForm")
	public String toWritingForm () {
		return "/board/writingForm";
	}
	
	// 게시판 전체 출력
	@RequestMapping("boardList")
	public String boardList (QnABoardDTO qa_dto,Model model) {
		System.out.println("게시판 전체출력");
		List<QnABoardDTO> list = qnaService.boardList(qa_dto);
		model.addAttribute("list", list);
		return "/board/qnaBoardForm";
	}
	
	// 조회수
	@RequestMapping("viewCount")
	public String viewCount (int qa_seq) {
		qnaService.viewCount(qa_seq);
		return "redirect:/qnaBoard/selectOnePost?qa_seq="+qa_seq;
	}
	
	// 선택한 게시글 보기 
	@RequestMapping("selectOnePost")
	public String selectOnePost (int qa_seq, Model model) {
		System.out.println("thispost: "+qa_seq);
		QnABoardDTO dto = qnaService.selectOnePost(qa_seq);
		model.addAttribute("post", dto);
		return "/board/pickOnePost";
	}
	
	// 게시글 작성
	@RequestMapping("insertPost")
	public String insert (QnABoardDTO qa_dto) {
		String id = (String) session.getAttribute("loginID");
		qa_dto.setQa_writer(id);
		System.out.println("게시글작성 : "+qa_dto.getQa_seq()+"/"+qa_dto.getQa_writer()+"/"+qa_dto.getQa_title()+"/"+qa_dto.getQa_contents()+"/"+qa_dto.getQa_view_count()+"/"+qa_dto.getQa_write_date());
		qnaService.insert(qa_dto);
		return "redirect:/qnaBoard/boardList";
	}
	
	// 게시글 수정
	@RequestMapping("updatePost")
	public String update (QnABoardDTO qa_dto, RedirectAttributes rttb) {
		String id = (String) session.getAttribute("loginID");
		qa_dto.setQa_writer(id);
		System.out.println("수정수정 : "+qa_dto.getQa_seq()+"/"+qa_dto.getQa_writer()+"/"+qa_dto.getQa_title()+"/"+qa_dto.getQa_contents()+"/"+qa_dto.getQa_view_count()+"/"+qa_dto.getQa_write_date());
		qnaService.update(qa_dto);
		rttb.addFlashAttribute("status","b_u");
		return "redirect:/qnaBoard/selectOnePost";
	}	
	
	// 게시글 삭제
	@RequestMapping("delete")
	public String delete (int qa_seq) {
		qnaService.delete(qa_seq);
		return "redirect:/qnaBoard/boardList";
	}

}
