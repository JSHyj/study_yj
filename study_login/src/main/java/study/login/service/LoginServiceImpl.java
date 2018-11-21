package study.login.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import study.login.dto.LoginDTO;
import study.login.mapper.LoginMapper;

@Service
@Log4j
@AllArgsConstructor
public class LoginServiceImpl implements LoginService {
	
	private LoginMapper mapper;

	@Override
	public String idChk(String uid) {
		// TODO Auto-generated method stub
		log.info("idChk Service--------------------------");
		
		
		return mapper.idChk(uid);
	}

	@Override
	public LoginDTO login(String uid) {
		// TODO Auto-generated method stub
		log.info("login service----------------");
		return mapper.Login(uid);
	}

	@Override
	public List<LoginDTO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public void register(LoginDTO dto) {
		// TODO Auto-generated method stub
		log.info("register service");
		mapper.register(dto);
	}

}
