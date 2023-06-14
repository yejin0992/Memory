package p.memory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.CateDTO;
import p.memory.repositories.CateDAO;

@Service
public class CateService {
	
	// dao
	@Autowired
	private CateDAO dao; 
	
	public List<CateDTO> selectCate() {
		System.out.println("cate Service 도착");
		return dao.selectCate(); 
	}
	
	

	
	

}
