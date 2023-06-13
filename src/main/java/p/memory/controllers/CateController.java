package p.memory.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import p.memory.dto.CateDTO;
import p.memory.services.CateService;


@RequestMapping("/cate/")
@Controller
public class CateController {
	
	//service
	@Autowired
	private CateService service;
	
	@RequestMapping("selectCate")
	public String selectCate(Model model) {
		System.out.println("selectCate 컨트롤러 도착");
		List<CateDTO> list= service.selectCate();
		System.out.println("리스트 확인 : " + list);
		model.addAttribute("category", list); 
		return "freeBoard/freeBoardWrite"; 
		
	}
	

}
