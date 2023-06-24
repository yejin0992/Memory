package p.memory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import p.memory.dto.FreeBoardDTO;
import p.memory.repositories.MyPageDAO;

@Service
public class MyPageService {

	
	@Autowired
	private MyPageDAO myDAO; 
	
	public List<FreeBoardDTO> selectMyPost(String fr_writer, int start, int end) {
		System.out.println("컨트롤러에서 전달받은 작성자 : " + fr_writer);
		return myDAO.selectMyPost(fr_writer, start, end); 
	}
	
	public int getMyPostsCount(String fr_writer) {
		return myDAO.getMyPostsCount(fr_writer); 
	}
}
