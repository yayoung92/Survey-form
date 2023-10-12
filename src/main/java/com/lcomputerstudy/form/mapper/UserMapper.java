package com.lcomputerstudy.form.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.GrantedAuthority;
import com.lcomputerstudy.form.domain.User;

@Mapper
public interface UserMapper {

	public User readUser(String username);
	   
	public void createUser(User user);

	public List<GrantedAuthority> readAuthorities(String username);

	public void createAuthority(User user);

}
