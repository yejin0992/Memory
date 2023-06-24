package p.memory.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import p.memory.dto.HeartDTO;
import p.memory.services.HeartService;

@Controller
@RequestMapping("/test/")
public class TestController {

	@Autowired
	private HeartService heartService;
	@Autowired
	HttpSession session;
	
@RequestMapping("heartTest")	
	public String test() {
	System.out.println("heartTest 도착");
//	List<String> heart = heartService.select("아멀랑");
	
//	ArrayList<Integer> heartList = new ArrayList<>();
//	for (String a : heart) {
//		System.out.println("값 : " + a);
//		System.out.println("per_seq : "+a.getPer_seq() + " writer : "+ a.getWriter());
//		if (a.getWriter() == null) {
//			System.out.println("널인지 아닌지 : "+ a);
//			a.setWriter("0");
//			System.out.println("0을 숫자로 바꾼 값(숫자가 나와야함) : "+ Integer.parseInt("0"));
//			heartList.add(Integer.parseInt(a.getWriter()));
//		} else if (a.getWriter() == "1") {
//			System.out.println("참일때니까 1이 나와야 함 : "+ a.getWriter());
//			heartList.add(Integer.parseInt(a.getWriter()));
//		}
//	}
	
	return "";
	}
}
