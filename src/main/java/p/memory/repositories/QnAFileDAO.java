package p.memory.repositories;
 
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.QnAFileDTO;

@Repository
public class QnAFileDAO {

	@Autowired
	private SqlSessionTemplate db;
	
	
	// 파일 업로드
	public int insert (QnAFileDTO fdto) {
		return db.insert("QnAFile.insert",fdto);
	}
	
}
