package p.memory.controllers;

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

	// 회원가입폼으로
	@RequestMapping("joinForm")
	public String joinForm() {
		System.out.println("조인폼으로");
		return "member/joinMember";
	}

	// 마이페이지폼으로
	@RequestMapping("mypage")
	public String mypage() {
		return "member/myPage";
	}

	// 회원가입
	@RequestMapping("join")
	public String insert(MemberDTO dto, RedirectAttributes rttb) throws Exception {
		System.out.println(dto.getId() + "/" + dto.getPw() + "/" + dto.getName() + "/" + dto.getBirth_date() + "/"
				+ dto.getGender() + "/" + dto.getContact() + "/" + dto.getEmail() + "/" + dto.getZipcode() + "/"
				+ dto.getAddress1() + "/" + dto.getAddress2() + "/" + dto.getJoin_date());
		dto.setPw(EncryptionUtils.sha256(dto.getPw()));
		mService.insert(dto);
		rttb.addFlashAttribute("status", "j_s");
		return "member/loginPage";
	}

	// id 중복확인
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
				+ "/" + dto.getGender() + "/" + dto.getContact() + "/" + dto.getEmail() + "/" + dto.getZipcode() + "/"
				+ dto.getAddress1() + "/" + dto.getAddress2() + "/" + dto.getJoin_date());
		rttb.addFlashAttribute("status", "m_u");
		return "redirect:/member/myInfo";
	}

	// 회원 탈퇴
	@RequestMapping("memberOut")
	public String delete(String id) {
		mService.delete((String) session.getAttribute("loginID"));
		session.invalidate();
		return "home";
	}

	// 로그인
	@RequestMapping("login")
	public String login(String id, String pw, RedirectAttributes rttb) throws Exception {
		System.out.println("로그인컨트롤러: " + id + "/" + pw);
		String encryptionPw = EncryptionUtils.sha256(pw);
		boolean result = mService.login(id, encryptionPw);

		if (result) {
			session.setAttribute("loginID", id);
			rttb.addFlashAttribute("status", "j_s");
			return "member/myPage";
		} else {
			rttb.addFlashAttribute("status", "l_f");
			return "redirect:/member/loginForm";
		}
	}

	// 로그인페이지로
	@RequestMapping("loginForm")
	public String loginForm() {
		System.out.println("로그인폼으로");
		return "member/loginPage";
	}

	// 로그아웃
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return "home";
	}

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/error";
	}
}
