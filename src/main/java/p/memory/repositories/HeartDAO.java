package p.memory.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.HeartDTO;



@Repository
public class HeartDAO {

	@Autowired	
	private SqlSessionTemplate mybatis;
	
//	public List<HeartDTO> select(String writer) {
//		System.out.println("heart DAO 도착");
//		return mybatis.selectList("Heart.select", writer);
//	}
	
	// 내가 누른 좋아요 불러오기
	public List<HeartDTO> selectList(String id) {
		System.out.println("heart DAO 도착");
		return mybatis.selectList("Heart.selectList", id);
	}
	
	// 게시글 작성 시 좋아요 테이블 추가
	public int insert(HeartDTO dto ) {
		return mybatis.insert("Heart.insert", dto);
	}
	
	// 좋아요 삭제
	public int delete(HeartDTO dto) {
		return mybatis.delete("Heart.delete", dto);
	}
	// 게시글 세부페이지 좋아요
	public int selectHeart(HeartDTO dto) {
		System.out.println("좋아요 select dao 도착");
		return mybatis.selectOne("Heart.selectHeart", dto);
	}
}
