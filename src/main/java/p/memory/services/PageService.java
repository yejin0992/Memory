package p.memory.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.commons.Settings;
import p.memory.repositories.PerfumeDAO;

@Service
public class PageService {

	@Autowired
	private PerfumeDAO perfumeDAO;
		
	public int[] getPageNum(int currentPage) {
		int[] num = new int[4];
		//startRecord
		num[0] = (currentPage * Settings.PER_BOARD_RECORD_COUNT_PER_PAGE) - 
				(Settings.PER_BOARD_RECORD_COUNT_PER_PAGE - 1);
		// endRecord
		num[1] = currentPage * Settings.PER_BOARD_RECORD_COUNT_PER_PAGE;
		// startNavi
		num[2] = (currentPage-1)/Settings.PER_BOARD_NAVI_COUNT_PER_PAGE*Settings.PER_BOARD_NAVI_COUNT_PER_PAGE+1;
		// lastNavi
		num[3] = num[2] + (Settings.PER_BOARD_NAVI_COUNT_PER_PAGE -1);

		return num;
	}
	
	public int getCurrentPage(int currentPage) {
		int pageTotalCount = (int)Math.ceil(perfumeDAO.recordTotalCount()/(double)Settings.PER_BOARD_RECORD_COUNT_PER_PAGE);
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			 currentPage = pageTotalCount;
		}
		return currentPage;
	}
	
	
	
	public List<String> getPageNavi(int currentPage) {
	
	int recordTotalCount = perfumeDAO.recordTotalCount();
	// 한 페이지에 표시되는 게시글 수
	int recordCountPerPage = Settings.PER_BOARD_RECORD_COUNT_PER_PAGE;
	// 한 페이지에 표시되는 하단 네비 수
	int naviCountPerPage = Settings.PER_BOARD_NAVI_COUNT_PER_PAGE;
	
	// 토탈 페이지 구하기
	int pageTotalCount = (int)Math.ceil(recordTotalCount/(double)recordCountPerPage);
	//방어코드

	int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
	int endNavi = startNavi + (naviCountPerPage-1);
	if(endNavi > pageTotalCount) {
		endNavi = pageTotalCount;
	}
	boolean needPagePrev = true;
	boolean needPageNext = true;
	boolean needPrev = true;
	boolean needNext = true;
	if(startNavi == 1) {
		needPagePrev = false;
	}
	if(endNavi == pageTotalCount) {
		needPageNext = false;
	}
	if(currentPage == pageTotalCount) {
		needNext = false;
	}
	if(currentPage == 1) {
		needPrev = false;
	}
	List<String> list = new ArrayList<>();
	if(needPagePrev) {
		list.add("<<");
	}
	if(needPrev) {
		list.add("<");
	}
	for(int i = startNavi;i<=endNavi;i++) {
		list.add(String.valueOf(i));
	}
	if(needNext) {
		list.add(">");
	}
	if(needPageNext) {
		list.add(">>");
	}

	return list;
	
	

	}
	
}
