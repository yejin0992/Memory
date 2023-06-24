package p.memory.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.MemberDTO;
import p.memory.repositories.MemberDAO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mdao;

	// 회원가입
	public int insert(MemberDTO dto) {
		return mdao.insert(dto);
	}

	// id 중복확인
	public boolean isMember(String id) {
		return mdao.isMember(id);
	}

	// 회원정보 출력
	public MemberDTO select(String id) {
		return mdao.select(id);
	}

	// 회원정보 수정
	public int update(MemberDTO dto) {
		return mdao.update(dto);
	}

	// 회원 탈퇴
	public int delete(String id) {
		return mdao.delete(id);
	}

	// 로그인
	public boolean login(String id, String pw) {
		return mdao.login(id, pw);
	}
	
	// 아이디 찾기
	public MemberDTO findID (MemberDTO dto) {
		return mdao.findID(dto);
	}
	
	// 비밀번호 찾기
	public MemberDTO findPW (MemberDTO dto) {
		return mdao.findPW(dto);
	}
	
	// 비밀번호 변경
	public int pwUpdate (String id, String pw) {
		return mdao.pwUpdate(id,pw);
	}

}
