package study.login.service;

import java.util.List;

import study.login.dto.LoginDTO;

public interface LoginService {
	
	public String idChk(String uid);
	
	public LoginDTO login(String uid);
	
	public List<LoginDTO> getList();
	
	public void register(LoginDTO dto);

}
