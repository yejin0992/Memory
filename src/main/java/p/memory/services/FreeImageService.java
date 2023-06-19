package p.memory.services;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import p.memory.dto.FreeImageDTO;
import p.memory.repositories.FreeImageDAO;

@Service
public class FreeImageService {
	
	@Autowired
	private FreeImageDAO dao; 
	
	
	public void insertImage(String realPath,int fr_seq, MultipartFile[] files) throws Exception {

		File realPathFile = new File (realPath);
		if(!realPathFile.exists()) {
			realPathFile.mkdir(); 
		}
		if (files !=null ) {
			for (MultipartFile file : files) {
				if (file.isEmpty()) {
					break; 
				}
				String oriName = file.getOriginalFilename(); 
				String sysName = UUID.randomUUID() + "-" + oriName; 
				
				file.transferTo(new File(realPath + "/" +sysName));
				dao.insertImage(new FreeImageDTO(0 ,oriName, sysName, fr_seq)); 
			}
		}
	}
	
	public List<FreeImageDTO> selectImagesByFr_seq(int fr_seq) throws Exception {
		return dao.selectImagesByFr_seq(fr_seq); 
	}
	
	public int deleteImages(int fr_seq) throws Exception {
		return dao.deleteImage(fr_seq); 
	}
	

	
	
}
