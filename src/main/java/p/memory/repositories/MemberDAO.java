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
	public int insert (MemberDTO dto) {
		System.out.println("회원가입DAO:"+dto.getId());
		return db.insert("Member.insert", dto);
	}
	
	//id 중복확인
	public boolean isMember (String id) {
		System.out.println("DAO 아이디체크:"+id);
		return db.selectOne("Member.isMember", id);
	}

	// 회원정보 출력
	public MemberDTO select (String id) {
		System.out.println("출력dao: "+id);
		return db.selectOne("Member.select",id);
	}
	
	// 회원정보 수정
	public int update (MemberDTO dto) {
		System.out.println("DAO업데이트");
		return db.update("Member.update",dto);
	}
	
	// 회원 탈퇴
	public int delete (String id) {
		return db.delete("Member.delete",id);
	}
	
	// 로그인
	public boolean login (String id, String pw) {
		System.out.println("로그인 dao: "+id+"/"+pw);
		Map<String,String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return db.selectOne("Member.login",param);
	}
	
	// 아이디찾기
	public MemberDTO findID (MemberDTO dto) {
		MemberDTO result = db.selectOne("Member.findID",dto);
		if (result != null) {
			dto.setId(result.getId()); //쿼리를 실행하고 반환되는 dto에는 id를 설정하는 부분이 없기 때문에 id값을 넣어줘야 null값으로 반환 되지 않음
		}
		return result; 
	}
	
	// 비밀번호 찾기
	public MemberDTO findPW (MemberDTO dto) {
		MemberDTO result = db.selectOne("Member.findPW",dto);
		if (result != null) {
			dto.setPw(result.getPw()); 
		}
		 return result;
	}
	
	// 비밀번호 번경
	public int pwUpdate (String id, String pw) {

		System.out.println("비번 dao: "+id+"/"+pw);
		Map<String,String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return db.update("Member.pwUdate",param);
	}
	
}
