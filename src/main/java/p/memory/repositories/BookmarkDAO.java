package p.memory.repositories;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.BookmarkDTO;

@Repository
public class BookmarkDAO {
	
	//
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertBookmark(BookmarkDTO dto) {
		return mybatis.insert("Bookmark.insertBookmark",dto); 
	}
	
	public int deleteBookmark(int fr_seq, String user_id) {
		Map<String, Object> params = new HashMap<>();
		params.put("fr_seq", fr_seq);
		params.put("user_id", user_id); 
		return mybatis.delete("Bookmark.deleteBookmark", params); 
	}
	
	public int selectBookmark (int fr_seq, String user_id) {
		Map<String, Object > params = new HashMap<>(); 
		params.put("fr_seq", fr_seq);
		params.put("user_id", user_id); 
		return mybatis.selectOne("Bookmark.selectBookmark", params); 
	}
	
	

}
