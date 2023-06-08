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
		System.out.println("server:" + pw);
		return mdao.login(id, pw);
	}

}
