package p.memory.services;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import p.memory.dto.QnAFileDTO;
import p.memory.repositories.QnAFileDAO;

@Service
public class QnAFileService {

	@Autowired
	private QnAFileDAO fdao;

// 파일 업로드
	public void insert(String realPath, MultipartFile[] files, int qa_seq) throws Exception {

		File realPathFile = new File(realPath);
		if (!realPathFile.exists()) {
			realPathFile.mkdir();
		}
		if (files != null) {
			for (MultipartFile file : files) {
				if (file.isEmpty()) {
					continue;
				}
				String oriName = file.getOriginalFilename();
				String sysName = UUID.randomUUID() + "_" + oriName;

				file.transferTo(new File(realPath + "/" + sysName));
				System.out.println(qa_seq);
				fdao.insert(new QnAFileDTO(0, oriName, sysName, qa_seq));
			}
		}
	}
}
