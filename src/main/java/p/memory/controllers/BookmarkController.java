package p.memory.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import p.memory.dto.BookmarkDTO;
import p.memory.services.BookmarkService;

@RequestMapping("/bookmark/")
@Controller
public class BookmarkController {
	
	@Autowired
	private BookmarkService bookmarkService;
	
	@Autowired
	private HttpSession session; 
	
	@ResponseBody
	@RequestMapping("insertBookmark")
	public void insertBookmark(BookmarkDTO dto) {
		int fr_seq = dto.getFr_seq(); 
		System.out.println("ajax에서 fr_seq 잘 받아왔는지 확인 : " + fr_seq);
		// 테스트용 id 생성
		String userId = "tester123";
		session.setAttribute("loggedID", userId);
		String loggedID = (String) session.getAttribute("loggedID");
		dto.setUser_id(loggedID);
		System.out.println("세션에서 가져온 아이디 dto에 넣기 : " + dto.getUser_id());
		bookmarkService.insertBookmark(dto); 
	}
	
	@ResponseBody
	@RequestMapping("deleteBookmark")
	public void deleteBookmark(int fr_seq) {
	System.out. println("ajax에서 받은 fr_seq : " + fr_seq);
	// 테스트용 id 생성
	String userId = "tester123";
	session.setAttribute("loggedID", userId);
	String loggedID = (String) session.getAttribute("loggedID");
	bookmarkService.deleteBookmark(fr_seq, userId); 
	}
	
	
}
