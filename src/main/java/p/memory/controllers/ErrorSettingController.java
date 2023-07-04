package p.memory.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorSettingController {

	@RequestMapping("/error404")
	public String error404() {
		return "/404error";
	}
	@RequestMapping("/error500")
	public String error500() {
		return "/500error";
	}
	
	
}
