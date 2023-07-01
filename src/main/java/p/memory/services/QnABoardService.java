package p.memory.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.commons.Settings;
import p.memory.dto.QnABoardDTO;
import p.memory.repositories.QnABoardDAO;


@Service
public class QnABoardService {

	@Autowired
	private QnABoardDAO qa_dao;


	// 게시판 출력
	public List<QnABoardDTO> selectAll(int startNavi, int endNavi) {
		return qa_dao.selectAll(startNavi, endNavi);
	}

	// 총 게시글 수
	public int selectTotalPost() {
		return qa_dao.selectTotalPost();
	}

	// 페이징
	public List<String> getPageNavi(int totalPages, int currentPage) {

		int startPostNum = (currentPage - 1) / Settings.BOARD_NAVI_COUNT_PER_PAGE * Settings.BOARD_NAVI_COUNT_PER_PAGE+ 1;
		int endNavi = (startPostNum) + (Settings.BOARD_NAVI_COUNT_PER_PAGE -1);

		boolean beforBtn = true;
		boolean nextBtn = true;
		boolean firstPageBtn = true;
		boolean lastPageBtn = true;

		if (endNavi > totalPages) { 
			endNavi = totalPages; 
		}

		if (startPostNum == 1) {
			beforBtn = false; 
		}
		if (endNavi == totalPages) { 
			nextBtn = false; 
		}
		if (startPostNum == 1) {
			firstPageBtn = false;
		}
		if (endNavi == totalPages) {
			lastPageBtn = false;
		}

		List<String> list = new ArrayList<>();

		// 네비 왼쪽 화살표
		if (firstPageBtn) {
			list.add("<<");
		}
		if (beforBtn) {
			list.add("<");
		}
		// 네비
		for (int i = startPostNum; i <= endNavi; i++) {
			list.add(String.valueOf(i));
		}
		// 네비 오른쪽 화살표
		if (nextBtn) {
			list.add(">");
		}
		if (lastPageBtn) {
			list.add(">>");
		}

		return list;
	}

	// 검색
	public List<QnABoardDTO> searchPost(int startPostNum, int endPostNum, String searchType, String keyword) {
		return qa_dao.searchPost(startPostNum, endPostNum, searchType, keyword);
	}

	// 조회수
	public int viewCount(int qa_seq) {
		return qa_dao.viewCount(qa_seq);
	}

	// 선택한 게시글 출력
	public QnABoardDTO selectOnePost(int qa_seq) {
		return qa_dao.selectOnePost(qa_seq);
	}

	// 게시글 작성
	public int insert(QnABoardDTO qa_dto) {
		qa_dao.insert(qa_dto);
		return qa_dto.getQa_seq();
	}

	// 게시글 수정
	public int update(QnABoardDTO qa_dto) {
		return qa_dao.update(qa_dto);
	}

	// 게시글 삭제
	public int delete(int qa_seq) {
		return qa_dao.delete(qa_seq);
	}
}
