package p.memory.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import p.memory.services.FreeImageService;

@RequestMapping("/FreeImage/")
@Controller
public class FreeImageController {

	//서비스 
	@Autowired
	private FreeImageService imageService; 
	
	
}
