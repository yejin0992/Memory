package p.memory.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.FreeImageDTO;

@Repository
public class FreeImageDAO {
	
	// mybatis 
	@Autowired
	private SqlSessionTemplate mybatis;  
	
	
	public int insertImage(FreeImageDTO dto) {
		return mybatis.insert("FreeImage.insert", dto); 
	}
	
	public List<FreeImageDTO> selectImagesByFr_seq(int fr_seq){
		return mybatis.selectList("FreeImage.selectImagesByFr_seq", fr_seq); 
	}
	
	public int deleteImage(int fr_seq) {
		return mybatis.delete("FreeImage.deleteImages", fr_seq); 
 	}

}
