package p.memory.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.CateDTO;

@Repository
public class CateDAO {
	
	// mybatis
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CateDTO> selectCate(){
		System.out.println("cateDAO 도착");
		return mybatis.selectList("Cate.selectCate"); 
	}
	

}
