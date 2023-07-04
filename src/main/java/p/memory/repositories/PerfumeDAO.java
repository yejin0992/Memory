package p.memory.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.PerfumeDTO;
import p.memory.dto.PerfumeFilter;
import p.memory.dto.PerfumeMainDTO;

@Repository
public class PerfumeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 브랜드 종류
	public List<String> selectBrandKind() {
		List<String> result = mybatis.selectList("Perfume.selectBrandKind");
		System.out.println("DAO에 도착한 값은 : " + result);
		return result;
	}

	// 게시글 추가
	public int insert(PerfumeDTO dto) {
		System.out.println("dao도착");
		System.out.println("writer :" + dto.getId());
		mybatis.insert("Perfume.insert", dto);
		return dto.getPer_seq();
	}

	// perfume 목록 리스트
	public List<PerfumeMainDTO> selectList(int start, int end) {
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return mybatis.selectList("Perfume.selectList", param);
	}

	// perfume페이지 전체 글 수
	public int recordTotalCount() {
		return mybatis.selectOne("Perfume.recordTotalCount");
	}

	// 검색된 perfume 페이지 전체 글 수
	public int searchedTotalCount(PerfumeFilter filter) {
		return mybatis.selectOne("Perfume.searchedTotalCount", filter);
	}

	// per_seq로 게시글 select
	public PerfumeDTO selectBySeq(int per_seq) {
		return mybatis.selectOne("Perfume.selectBySeq", per_seq);
	}

	// perfume 업데이트
	public int update(PerfumeDTO dto) {
		System.out.println("perfume update dao 도착");
		return mybatis.update("Perfume.update", dto);
	}

	// perfume 삭제
	public int delete(int per_seq) {
		return mybatis.delete("Perfume.delete", per_seq);
	}

	// 필터, 검색어로 검색
	public List<PerfumeMainDTO> selectBySearch(PerfumeFilter filter) {
		return mybatis.selectList("Perfume.selectBySearch", filter);
	}

	// note 유무 확인
	public int noteIsTrue(String note) {
		return mybatis.selectOne("Perfume.noteIsTrue", note);
	}
	
	// best TOP 10
	public List<PerfumeMainDTO> selectBest(){
		return mybatis.selectList("Perfume.selectBest");
	}
	
	//낮은 가격순
	public List<PerfumeMainDTO> selectLowPrice(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return mybatis.selectList("Perfume.selectLowPrice",param);
	}
	
	//높은 가격순
	public List<PerfumeMainDTO> selectHighPrice(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return mybatis.selectList("Perfume.selectHighPrice",param);
	}
	
}
