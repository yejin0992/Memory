package p.memory.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.HeartDTO;
import p.memory.repositories.HeartDAO;
import p.memory.repositories.PerfumeDAO;

@Service
public class HeartService {
	@Autowired
	private HeartDAO heartDAO;
	@Autowired
	private PerfumeDAO perfumeDAO;
	
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
