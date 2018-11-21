package study.login.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import study.login.dto.LoginDTO;

public interface LoginMapper {
	
	public String idChk(@Param("uid")String uid);
	
	public LoginDTO Login(String uid);
	
	public List<LoginDTO> getList();
	
	public void register(LoginDTO dto);

}
