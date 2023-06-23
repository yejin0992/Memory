package p.memory.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.HeartDTO;
import p.memory.repositories.HeartDAO;

@Service
public class HeartService {
	@Autowired
	private HeartDAO heartDAO;
	
	public HeartDTO select(int per_seq) {
		return heartDAO.select(per_seq);
	}
	
	public int insert (HeartDTO dto) {
		return heartDAO.insert(dto);
	}
	
	public int flagTrue(int per_seq) {
		return heartDAO.flagTrue(per_seq);
	}
	
	public int flagFalse(int per_seq) {
		return heartDAO.flagFalse(per_seq);
	}
}
