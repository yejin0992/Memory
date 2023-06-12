package p.memory.repositories;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate db;

	// 회원가입
	public int insert(MemberDTO dto) {
		System.out.println("회원가입DAO:" + dto.getId());
		return db.insert("Member.insert", dto);
	}

	// id 중복확인
	public boolean isMember(String id) {
		System.out.println("DAO 아이디체크:" + id);
		return db.selectOne("Member.isMember", id);
	}

	// 회원정보 출력
	public MemberDTO select(String id) {
		System.out.println("출력dao: " + id);
		return db.selectOne("Member.select", id);
	}

	// 회원정보 수정
	public int update(MemberDTO dto) {
		System.out.println("DAO업데이트");
		return db.update("Member.update", dto);
	}

	// 회원 탈퇴
	public int delete(String id) {
		return db.delete("Member.delete", id);
	}

	// 로그인
	public boolean login(String id, String pw) {
		System.out.println("로그인 dao: " + id + "/" + pw);
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return db.selectOne("Member.login", param);
	}

}
