package p.memory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.PerfumeDTO;
import p.memory.dto.PerfumeFilter;
import p.memory.dto.PerfumeMainDTO;
import p.memory.repositories.PerfumeDAO;

@Service
public class PerfumeService {

	@Autowired
	private PerfumeDAO perfumeDAO;

	// 브랜드 종류
	public List<String> selectBrandKind(){
		List<String> result = perfumeDAO.selectBrandKind();
		System.out.println("서비스에 넘어온 값은 : "+result);
		return result;
	}

	// perfume 게시글 추가
	public int insert(PerfumeDTO dto) {
		System.out.println("서비스도착");
		perfumeDAO.insert(dto);
		return dto.getPer_seq();
	}

	// perfume 목록 리스트
	public List<PerfumeMainDTO> selectList(int start, int end){
		return perfumeDAO.selectList(start, end);
	}

	// perfume 전체 게시글 수
	public int recordTotalCount() {
		return perfumeDAO.recordTotalCount();
	}

	// per_seq로 게시글 select
	public PerfumeDTO selectBySeq(int per_seq) {
		return perfumeDAO.selectBySeq(per_seq);
	}

	// perfume 업데이트
	public int update(PerfumeDTO dto) {
		return perfumeDAO.update(dto);
	}

	// perfume 삭제
	public int delete(int per_seq) {
		return perfumeDAO.delete(per_seq);
	}

	// 필터, 검색어로 검색
	public List<PerfumeMainDTO> selectBySearch(PerfumeFilter filter){
		return perfumeDAO.selectBySearch(filter);
	} 

	// note 유무 확인
	public int noteIsTrue(String note) {
		return perfumeDAO.noteIsTrue(note);
	}
	
	// best TOP 10
	public List<PerfumeMainDTO> selectBest(){
		return perfumeDAO.selectBest();
	} 
}
