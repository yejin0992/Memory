package p.memory.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import p.memory.dto.FileDTO;
import p.memory.dto.PerfumeMainDTO;

@Repository
public class FileDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public int insert(FileDTO dto) {
		return mybatis.insert("File.insert", dto);
	}
	
	public List<PerfumeMainDTO> selectList(){
		return mybatis.selectList("File.selectList");
	}
	
	public FileDTO selectByPerSeq(int per_seq) {
		return mybatis.selectOne("File.selectByPerSeq", per_seq);
	}
	
	// file_seq로 update
	public int update(FileDTO dto) {
		System.out.println("file udpate DAO");
		
		System.out.println(dto.getFile_seq());
		System.out.println(dto.getOriName());
		System.out.println(dto.getSysName());
		System.out.println(dto.getPer_seq());
		return mybatis.update("File.update", dto);
	}
	
}
