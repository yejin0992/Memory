package p.memory.services;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import p.memory.dto.FileDTO;
import p.memory.repositories.FileDAO;

@Service
public class FileService {

	@Autowired
	private FileDAO fileDAO;
	

	
	//file insert 및 update
	public void insert(String realPath, int parent_seq, MultipartFile[] files, int file_seq) throws Exception {
		System.out.println("fileservice 도착");
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) {realPathFile.mkdir();}
		if(files != null) {	
			for(MultipartFile file : files) {
				if(file.isEmpty()) {break;}
				String oriName = file.getOriginalFilename();
				//UUID : 랜덤 name 붙여줌
				String sysName = UUID.randomUUID() + "_" + oriName;
				file.transferTo(new File(realPath + "/" + sysName));
				if(file_seq == 0) {
					System.out.println("insert 하는중");
				fileDAO.insert(new FileDTO(0,oriName, sysName,parent_seq));
				}else {
					System.out.println("update 하는중");
					System.out.println("sysname : " + sysName);
					System.out.println("file_Seq: "+file_seq);
					FileDTO fDTO = new FileDTO(file_seq, oriName, sysName, 0);
					fileDAO.update(fDTO);
				}
			}
		}
	}
	
	// per_seq로 파일 찾기
	public FileDTO selectByPerSeq(int per_seq) {
		return fileDAO.selectByPerSeq(per_seq);
	}

	// file_seq로 update
	public int update(FileDTO dto) {
		return fileDAO.update(dto);
	}

	
	
	
}
