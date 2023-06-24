package p.memory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.HeartDTO;
import p.memory.repositories.HeartDAO;

@Service
public class HeartService {
	
	@Autowired
	private HeartDAO heartDAO;
	
	public List<HeartDTO> selectList(String writer) {
		return heartDAO.selectList(writer);
	}
	
	public int insert (HeartDTO dto) {
		return heartDAO.insert(dto);
	}
	
	public int delete(HeartDTO dto) {
		return heartDAO.delete(dto);
	}
	
	public int selectHeart(HeartDTO dto) {
		return heartDAO.selectHeart(dto);
	}
}
