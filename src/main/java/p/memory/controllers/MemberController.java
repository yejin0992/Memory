package p.memory.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import p.memory.commons.EncryptionUtils;
import p.memory.dto.MemberDTO;
import p.memory.services.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private HttpSession session;

	// 회원가입 페이지으로 이동
	@RequestMapping("toJoinForm")
	public String joinForm() {
		System.out.println("조인폼으로");
		return "member/joinMember";
	}

	// 마이페이지로 이동
	@RequestMapping("toMypage")
	public String mypage() {
		return "member/myPage";
	}

	// 회원가입
	@RequestMapping("join")
	public String insert(MemberDTO dto, RedirectAttributes rttb) throws Exception {
		dto.setPw(EncryptionUtils.sha256(dto.getPw()));
		mService.insert(dto);

		System.out.println(dto.getId() + "/" + dto.getPw() + "/" + dto.getName() + "/" + dto.getBirth_date() + "/" + "/"
				+ dto.getContact() + "/" + dto.getEmail() + "/" + dto.getZipcode() + "/" + dto.getAddress1() + "/"
				+ dto.getAddress2() + "/" + dto.getJoin_date());

		rttb.addFlashAttribute("status", "insert");
		return "member/loginPage";
	}

	// 회원가입_id 중복확인
	@ResponseBody
	@RequestMapping(value = "idCheck", produces = "text/html;charset=utf-8")
	public String idCheck(String id) {
		System.out.println("아이디중복체크도착 : " + id);
		boolean result = mService.isMember(id);
		return String.valueOf(result);
	}

	// 회원정보 출력
	@RequestMapping("myInfo")
	public String select(Model model) {
		String id = (String) session.getAttribute("loginID");
		System.out.println("회원정보출력 컨트롤러");
		MemberDTO mdto = mService.select(id);
		model.addAttribute("myInfo", mdto);
		return "member/myPageInfo";
	}

	// 회원정보 수정
	@RequestMapping("update")
	public String update(MemberDTO dto, RedirectAttributes rttb) throws Exception {
		dto.setId((String) session.getAttribute("loginID"));
		dto.setPw(EncryptionUtils.sha256(dto.getPw()));
		mService.update(dto);
		System.out.println("업데이트:" + dto.getId() + "/" + dto.getPw() + "/" + dto.getName() + "/" + dto.getBirth_date()
				+ "/" + dto.getContact() + "/" + dto.getEmail() + "/" + dto.getZipcode() + "/" + dto.getAddress1() + "/"
				+ dto.getAddress2() + "/" + dto.getJoin_date());
		rttb.addFlashAttribute("status", "update");
		return "redirect:/member/myInfo?id" + dto.getId();
	}

	// 회원 탈퇴
	@RequestMapping("memberOut")
	public String delete(String id) {
		System.out.println(id);
		mService.delete((String) session.getAttribute("loginID"));
		session.invalidate();
		return "home";
	}

	// 로그인페이지로 이동
	@RequestMapping("loginForm")
	public String loginForm() {
		System.out.println("로그인폼으로");
		return "member/loginPage";
	}

	// 로그인
	@RequestMapping("login")
	public String login(String id, String pw, RedirectAttributes rttb) throws Exception {
		System.out.println("로그인컨트롤러: " + id + "/" + pw);
		String encryptionPw = EncryptionUtils.sha256(pw);
		boolean result = mService.login(id, encryptionPw);

		if (result) {
			session.setAttribute("loginID", id);
			System.out.println("세션이 넣은 아이디 : "+session.getAttribute("loginID"));
			rttb.addFlashAttribute("status", "login");
			return "home";
		} else {
			rttb.addFlashAttribute("status", "unableLogin");
			return "redirect:/member/loginForm";
		}
	}

	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}

	// 아이디 찾기 페이지로 이동
	@RequestMapping("toFindID")
	public String toFindID() {
		return "member/findID";
	}

	// 아이디 찾기
	@RequestMapping("findID")
	public String findID(MemberDTO dto, Model model) {
		System.out.println("아이디찾기: " + dto.getName() + "/" + dto.getEmail());
		MemberDTO id = mService.findID(dto);
		System.out.println(dto.getId());
		if (id == null) {
			model.addAttribute("check", 1); // check속성의 1 : 실패
			return "member/findID";
		} else {
			model.addAttribute("check", 0); // check속성의 0 : 성공
			model.addAttribute("findID", dto.getId());
			return "member/getMyId";
		}

	}

	// 비밀번호 찾기 페이지로 이동
	@RequestMapping("toFindPW")
	public String toFindPW() {
		return "member/findPW";
	}

	// 비밀번호 찾기
	@RequestMapping("findPW")
	public String findPW(MemberDTO dto, Model model) throws Exception {
		System.out.println("pw찾기: " + dto.getId() + "/" + dto.getName() + "/" + dto.getEmail());
		MemberDTO pw = mService.findPW(dto);
		if (pw == null) {
			model.addAttribute("check", 1);
			return "member/findPW";
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("findPw", dto.getId());
			return "member/getMyPw";
		}

	}

	// 비밀번호 번경 페이지로 이동
	@RequestMapping("toGetMyPW")
	public String test() {
		System.out.println("비번페이지로 이동하자");
		return "member/getMyPw";
	}

	// 비밀번호 변경
	@RequestMapping("pwUpdate")
	public String pwUpdate(String id, String pw) throws Exception {
		System.out.println("비번페이지로 도착" + id + "/" + pw);
		String encryptionPw = EncryptionUtils.sha256(pw);
		System.out.println(id + "/" + pw + "/" + encryptionPw);
		mService.pwUpdate(id, encryptionPw);
		return "member/loginPage";
	}

	// 오류처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}
}
