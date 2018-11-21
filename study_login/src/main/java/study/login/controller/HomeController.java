package study.login.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import study.login.dto.LoginDTO;
import study.login.service.LoginService;


@Log4j
@Controller
@AllArgsConstructor
public class HomeController {
	
	private LoginService service;
	
	@GetMapping("/")
	public String home(Model model) {
		log.info("home----------------");
		
		return "home";		
	}
	
	@ResponseBody
	@PostMapping("/home.do")
	public int idChk(@RequestBody Map<String, Object> map ) {
		
		log.info("home.do----------------------------");
		log.info("id:" + map.get("uid"));
		log.info("pw:" + map.get("pw"));
		
		LoginDTO dto = service.login((String) map.get("uid"));
		log.info("dto : " + dto);
		
		if(dto==null) {
			log.info("null id");
			return 0; //아이디가 없을 때 0 
		}
		else {
			log.info("else id");
			if(dto.getPassword().equals(map.get("pw"))) {
				log.info("success");
				return 1; // 성공하면 1
			}else {
				log.info("fail");
				return 2; // 실패하면 2
			}
		
		}
	}
	
	@GetMapping("/register")
	public void register() {
		log.info("register------------------");
	}
	
	@ResponseBody
	@GetMapping("/register.do")
	public boolean register_id_chk(@RequestParam("uid") String uid) {
		log.info("register.do-----------------------------");
		log.info(uid);
		
		String chk = service.idChk(uid);
		log.info(chk+"여기");
		if(chk==null) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@PostMapping("/register")
	public String register_post(LoginDTO dto, RedirectAttributes rttr, Model model) {
		
		log.info("register post-----------------------------");
		service.register(dto);
		
		
		return "redirect:/";
	}
	
}
