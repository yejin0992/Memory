package p.memory.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import p.memory.dto.FileDTO;
import p.memory.dto.HeartDTO;
import p.memory.dto.PerfumeDTO;
import p.memory.dto.PerfumeFilter;
import p.memory.dto.PerfumeHeartDTO;
import p.memory.dto.PerfumeMainDTO;
import p.memory.dto.PerfumeReplyDTO;
import p.memory.services.FileService;
import p.memory.services.HeartService;
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
	@Autowired
	private HeartService heartService;
	
	// perfume 목록 출력
	@RequestMapping("perfumeList")
	public String PerfumeList(Model model, HttpServletRequest request) {
		String loginID = (String) session.getAttribute("loginID");
		int currentPage = request.getParameter("cpage") == null ? 1 : Integer.parseInt(request.getParameter("cpage"));
		System.out.println("cpage : " + currentPage);
		currentPage = pageService.getCurrentPage(currentPage);
		int[] num = pageService.getPageNum(currentPage);
		int startRecord = num[0];
		System.out.println("게시글 시작 seq : " + startRecord);
		int endRecord = num[1];
		System.out.println("게시글 마지막 seq : " + endRecord);
		int startNavi = num[2];
		System.out.println("페이지 시작 번호 : " + startNavi);
		int lastNavi = num[3];
		System.out.println("페이지 마지막 번호 : " + lastNavi);
		// 페이지 네비 처음부터 끝까지 구하는 함수
		int recordTotalCount = pageService.recordTotalCount();
		List<String> pageNavi = pageService.getPageNavi(currentPage, recordTotalCount);
		// 해당 페이지당 목록으로 나오는 게시글
		List<PerfumeMainDTO> list = perfumeService.selectList(startRecord, endRecord);
		System.out.println("게시글 리스트 사이즈 : " + list.size());
		// brand 목록 가져오기
		List<String> brand = perfumeService.selectBrandKind();
		// 좋아요 목록 가져오기
		System.out.println("loginID : "+loginID);
		List<HeartDTO> heart = heartService.selectList(loginID);
		System.out.println("하트 리스트 사이즈 : "+heart.size());

		List<PerfumeHeartDTO> PHdto = new ArrayList<>();
		for(PerfumeMainDTO dto : list) {
			boolean found = false;
			for(HeartDTO hDto : heart) {
				if(dto.getPer_seq()==hDto.getPer_seq()) {
					PerfumeHeartDTO result = new PerfumeHeartDTO(dto.getPer_seq(), dto.getId(), dto.getPer_brand(), dto.getPer_name(),dto.getPer_price(),dto.getSysName(),1);
					PHdto.add(result);
					found = true;
					break;
				}
			}
			if (!found) {
				PerfumeHeartDTO result = new PerfumeHeartDTO(dto.getPer_seq(), dto.getId(), dto.getPer_brand(), dto.getPer_name(), dto.getPer_price(), dto.getSysName(), 0); 
				PHdto.add(result);
			}
		}
		System.out.println("PHdto 사이즈 : "+PHdto.size());
		model.addAttribute("brand", brand);
		model.addAttribute("list", PHdto);
		model.addAttribute("pagination", pageNavi);
		model.addAttribute("cpage", currentPage);
		model.addAttribute("start", startNavi);
		model.addAttribute("last", lastNavi);
		return "perfume/perfumeList";
	}
	
	// insert 페이지로 이동
	@RequestMapping("toInsert")
	public String toInsert() throws Exception {
		return "perfume/perfumeInsert";
	}
	
	// 게시글 작성
	@RequestMapping("insert")
	public String perInsert(PerfumeDTO dto,  MultipartFile[] files, Model model) throws Exception {
		dto.setId((String) session.getAttribute("loginID"));
		int parent_seq = perfumeService.insert(dto);
		// 파일을 저장
		String realPath = session.getServletContext().getRealPath("/perfumeImage/");
		System.out.println("저장 장소 : " + realPath);
		fileService.insert(realPath, parent_seq, files, 0);
		return "redirect:/perfume/perfumeList";
	}
	
	// 게시글 상세페이지
	@RequestMapping("select")
	public String pefumeselect(int per_seq, int cpage, Model model) throws Exception {
		System.out.println("넘어온 cpage : "+cpage);
		System.out.println("Perfume.select 넘어온 시퀀스 : " + per_seq);
		PerfumeDTO perfume = perfumeService.selectBySeq(per_seq);
		FileDTO file = fileService.selectByPerSeq(per_seq);
		List<PerfumeReplyDTO> reply = replyService.selectByPerSeq(per_seq);
		HeartDTO hDto = new HeartDTO();
		hDto.setPer_seq(per_seq);
		hDto.setId((String)session.getAttribute("loginID"));
		int heart = heartService.selectHeart(hDto);
		System.out.println("좋아요있는지 없는지 : " + heart);
		model.addAttribute("cpage", cpage);
		model.addAttribute("perfume", perfume);
		model.addAttribute("file", file);
		model.addAttribute("reply", reply);
		model.addAttribute("heart", heart);
		System.out.println("댓글 불러오기 성공");
		return "perfume/perfumeSelect";
	}

	// perfumeBest 게시글 상세페이지
	@RequestMapping("bestSelect")
	public String bestSelect(int per_seq, Model model) throws Exception {
		System.out.println("Perfume.select 넘어온 시퀀스 : " + per_seq);
		PerfumeDTO perfume = perfumeService.selectBySeq(per_seq);
		FileDTO file = fileService.selectByPerSeq(per_seq);
		List<PerfumeReplyDTO> reply = replyService.selectByPerSeq(per_seq);
		HeartDTO hDto = new HeartDTO();
		hDto.setPer_seq(per_seq);
		System.out.println((String)session.getAttribute("loginID"));
		hDto.setId((String)session.getAttribute("loginID"));
		int heart = heartService.selectHeart(hDto);
		System.out.println("좋아요있는지 없는지 : " + heart);
		model.addAttribute("perfume", perfume);
		model.addAttribute("file", file);
		model.addAttribute("reply", reply);
		model.addAttribute("heart", heart);
		System.out.println("댓글 불러오기 성공");
		return "perfume/perfumeBestSelect";
	}
	
	// 게시글 업데이트 페이지로 이동
	@RequestMapping("toUpdate")
	public String toUpdate(int per_seq, Model model) throws Exception {
		System.out.println("update 도착");
		PerfumeDTO perfume = perfumeService.selectBySeq(per_seq);
		FileDTO file = fileService.selectByPerSeq(per_seq);
		model.addAttribute("perfume", perfume);
		model.addAttribute("file", file);
		return "perfume/perfumeUpdate";
	}

	// 게시글 업데이트
	@RequestMapping("perfumeUpdate")
	public String perfumeUpdate(PerfumeDTO pDTO, int file_seq, MultipartFile[] files) throws Exception {
		pDTO.setId((String)session.getAttribute("loginID"));
		System.out.println(pDTO.getBase3() + pDTO.getPer_kind());
		int perResult = perfumeService.update(pDTO);
		System.out.println("파일 시퀀스 : " + file_seq);
		String realPath = session.getServletContext().getRealPath("/perfumeImage/");
		fileService.insert(realPath, 0, files, file_seq);
		int per_seq = pDTO.getPer_seq();
		return "redirect:/perfume/select?per_seq=" + per_seq+"&cpage=1";
	}

	// 게시글 삭제
	@RequestMapping("delete")
	public String delete(int per_seq, int cpage) throws Exception {
		perfumeService.delete(per_seq);
		return "redirect:/perfume/perfumeList?cpage="+cpage;
	}
	
	// 좋아요 체크
	@ResponseBody
	@RequestMapping("heartChange")
	public void heartFlagChange(HeartDTO dto,  boolean isTrue) {
		System.out.println("시퀀스 : " + dto.getPer_seq());
		System.out.println("불린값 : " + isTrue);
		System.out.println("로그인한 아이디 : " + dto.getId());
		if (isTrue == true) {
			heartService.insert(dto);
			System.out.println("true에 도착");
		} else if (isTrue == false) {
			heartService.delete(dto);
			System.out.println("false에 도착");
		}
	}
	
	// 실시간 통합검색
	@ResponseBody
	@PostMapping(value = "/entireSearch", consumes = MediaType.APPLICATION_JSON_VALUE	)
	public List<PerfumeMainDTO> brandSelect( @RequestBody PerfumeFilter filter)throws Exception{
		System.out.println("브랜드 "+filter.getCheckedValue());
		System.out.println("시작가격 "+filter.getStartPrice());
		System.out.println("끝가격 "+filter.getEndPrice());
		System.out.println("검색어 "+filter.getSearchText());
		int searchedTotalCount = pageService.searchedTotalCount(filter);
		System.out.println("선택된 count : "+searchedTotalCount);
		List<PerfumeMainDTO> list= perfumeService.selectBySearch(filter);
		return list;
	}
	
	// 노트 찾기
	@ResponseBody
	@RequestMapping("noteIsTrue")
	public int noteIsTrue(String note) throws Exception {
		int result = perfumeService.noteIsTrue(note);
		System.out.println("결과는 : " + result);
		System.out.println("넘어온 노트는 : " + note);
		return result;
	}
	
	// perfumeBest 목록 페이지
	@RequestMapping("perfumeBest")
	public String perfumeBest(Model model ,HttpServletRequest request,@RequestParam(defaultValue = "1", name = "choice") int choice) throws Exception{
		List<PerfumeMainDTO> best = perfumeService.selectBest();
		model.addAttribute("best", best);
		// 낮은가격, 높은가격
		String loginID = (String) session.getAttribute("loginID");
		int currentPage = request.getParameter("cpage") == null ? 1 : Integer.parseInt(request.getParameter("cpage"));
		System.out.println("cpage : " + currentPage);
		currentPage = pageService.getCurrentPage(currentPage);
		System.out.println("서비스 다녀온 cpage : "+currentPage);
		int[] num = pageService.getPageNum(currentPage);
		int startRecord = num[0];
		System.out.println("게시글 시작 seq : " + startRecord);
		int endRecord = num[1];
		System.out.println("게시글 마지막 seq : " + endRecord);
		int startNavi = num[2];
		System.out.println("페이지 시작 번호 : " + startNavi);
		int lastNavi = num[3];
		System.out.println("페이지 마지막 번호 : " + lastNavi);
		// 페이지 네비 처음부터 끝까지 구하는 함수
		int recordTotalCount = pageService.recordTotalCount();
		List<String> pageNavi = pageService.getPageNavi(currentPage, recordTotalCount);
		for(String a : pageNavi) {
			System.out.print(a+" , ");
		}
		//낮은가격순
		if(choice == 1) {
			System.out.println("if문 안으로 들어옴");
			// 해당 페이지당 목록으로 나오는 게시글
			List<PerfumeMainDTO> list = perfumeService.selectLowPrice(startRecord, endRecord); 
			model.addAttribute("pagination", pageNavi);
			model.addAttribute("cpage", currentPage);
			model.addAttribute("start", startNavi);
			model.addAttribute("last", lastNavi);
			model.addAttribute("list", list);
		}// 높은가격순
		else if(choice==0) {
			System.out.println("else if문 안으로 들어옴");
			List<PerfumeMainDTO> list = perfumeService.selectHighPrice(startRecord, endRecord); 
			model.addAttribute("pagination", pageNavi);
			model.addAttribute("cpage", currentPage);
			model.addAttribute("start", startNavi);
			model.addAttribute("last", lastNavi);
			model.addAttribute("list", list);
		}
		return "perfume/perfumeBest";
	}

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}

}
