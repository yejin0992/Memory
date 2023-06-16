package p.memory.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import p.memory.dto.FileDTO;
import p.memory.dto.PerfumeDTO;
import p.memory.dto.PerfumeMainDTO;
import p.memory.dto.PerfumeReplyDTO;
import p.memory.services.FileService;
import p.memory.services.PageService;
import p.memory.services.PerfumeReplyService;
import p.memory.services.PerfumeService;

@Controller
@RequestMapping("/perfume/")
public class PerfumeController {
	@Autowired
	HttpSession session;
	
	@Autowired
	private PerfumeService perfumeService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private PageService pageService;
	
	@Autowired
	private PerfumeReplyService replyService;
	
	
	@RequestMapping("perfumeList")
	public String PerfumeList(Model model, HttpServletRequest request) {
		System.out.println("도착");
		int currentPage = request.getParameter("cpage") == null ? 1 
				: Integer.parseInt(request.getParameter("cpage"));
		System.out.println("cpage : "+currentPage);
		currentPage = pageService.getCurrentPage(currentPage);
		System.out.println("currentPage 로직 완료");
		int[] num = pageService.getPageNum(currentPage);
		int startRecord = num[0];
		System.out.println("게시글 시작 seq"+startRecord);
		int endRecord = num[1];
		System.out.println("게시글 마지막 seq"+endRecord);
		int startNavi = num[2];
		System.out.println("페이지 시작 번호"+startNavi);
		int lastNavi = num[3];
		System.out.println("페이지 마지막 번호"+lastNavi);
		
		// 페이지 네비 처음부터 끝까지 구하는 함수
		List<String> pageNavi = pageService.getPageNavi(currentPage);
		System.out.println("페이지네비 구하는고 완료");
		// 해당 페이지당 목록으로 나오는 게시글
		List<PerfumeMainDTO> list = perfumeService.selectList(startRecord, endRecord);
		// brand 목록 가져오기
		List<String> brand = perfumeService.selectBrandKind();
		model.addAttribute("brand",brand);
		model.addAttribute("list",list);
		model.addAttribute("pagination", pageNavi);
		model.addAttribute("cpage",currentPage);
		model.addAttribute("start",startNavi);
		model.addAttribute("last",lastNavi);
		return "perfume/perfumeList";
	}
	
	@RequestMapping("toInsert")
	public String toInsert() throws Exception {
		System.out.println("글쓰기 도착");
		session.setAttribute("writer", "아무개");
		return "perfume/perfumeInsert2";
	}
	
	@RequestMapping("insert")
	public String perInsert(PerfumeDTO dto, MultipartFile[] files, Model model) throws Exception{
		System.out.println("insert controller 도착");
		dto.setWriter((String)session.getAttribute("writer"));
		int parent_seq = perfumeService.insert(dto);
		//파일을 저장할 장소
		String realPath = session.getServletContext().getRealPath("/perfumeImage/");
		System.out.println("저장 장소 : "+realPath);
		fileService.insert(realPath, parent_seq, files, 0);
		return "redirect:/perfume/perfumeList";
	}
	
	@RequestMapping("select")
	public String pefumeselect(int per_seq,Model model) throws Exception{
	
		System.out.println("Perfume.select 넘어온 시퀀스 : "+ per_seq);
		PerfumeDTO perfume = perfumeService.selectBySeq(per_seq);
		FileDTO file = fileService.selectByPerSeq(per_seq);
		List<PerfumeReplyDTO> reply = replyService.selectByPerSeq(per_seq);
		model.addAttribute("perfume",perfume);
		model.addAttribute("file",file);
		model.addAttribute("reply", reply);
		System.out.println("댓글 불러오기 성공");
		return "perfume/perfumeSelect";
	}
	
	@RequestMapping("toUpdate")
	public String toUpdate (int per_seq, Model model) throws Exception{
		System.out.println("update 도착");
		PerfumeDTO perfume = perfumeService.selectBySeq(per_seq);
		FileDTO file = fileService.selectByPerSeq(per_seq);
		model.addAttribute("perfume",perfume);
		model.addAttribute("file",file);
	return "perfume/perfumeUpdate";
	}

	@RequestMapping("perfumeUpdate")
	public String perfumeUpdate(PerfumeDTO pDTO, int file_seq, MultipartFile[] files) throws Exception{
//		pDTO.setWriter((String)session.getAttribute("writer"));
		pDTO.setWriter("아무개");
		System.out.println(pDTO.getBase3()+ pDTO.getPer_kind());
		int perResult = perfumeService.update(pDTO);
		System.out.println("파일 시퀀스 : "+file_seq);
		String realPath = session.getServletContext().getRealPath("/perfumeImage/");
		fileService.insert(realPath, 0, files, file_seq);
		int per_seq = pDTO.getPer_seq();
		return "redirect:/perfume/select?per_seq="+per_seq;
	}
	
	@RequestMapping("delete")
	public String delete(int per_seq) throws Exception{
		perfumeService.delete(per_seq);
		return "redirect:/perfume/perfumeList";
	}
	
}
