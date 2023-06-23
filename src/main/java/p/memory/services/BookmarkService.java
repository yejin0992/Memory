package p.memory.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.BookmarkDTO;
import p.memory.repositories.BookmarkDAO;

@Service
public class BookmarkService {
	
	@Autowired
	private BookmarkDAO bookmarkDAO; 
	
	public int insertBookmark(BookmarkDTO dto) {
		return bookmarkDAO.insertBookmark(dto); 
	}
	
	public int deleteBookmark(int fr_seq, String user_id) {
		return bookmarkDAO.deleteBookmark(fr_seq, user_id); 
	}
	
	public int selectBookmark (int fr_seq, String user_id) {
		return bookmarkDAO.selectBookmark(fr_seq, user_id); 
	}

}
