package com.astrology.joyTarot.dao.facade;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.astrology.joyTarot.dao.domain.Authorities;
import com.astrology.joyTarot.dao.domain.Users;
import com.astrology.joyTarot.dao.domain.UsersInfo;
import com.astrology.joyTarot.form.RegisterForm;


@Service
public class UsersInfoService extends BaseService {

	public UsersInfo findByUser(Users user) {		
		return usersInfoRepository.findByUser(user);
	}
	
	
    public void save(RegisterForm registerForm){
        //帳號密碼及權限
//        var user = User.withUsername(registerForm.getUsername())
//                .password(registerForm.getPassword())
//                .passwordEncoder(str -> passwordEncoder().encode(str))
//                .roles("USER")
//                .build();
//        var jdbcUserDetailsManager = new JdbcUserDetailsManager();
//        //執行新增
//        jdbcUserDetailsManager.createUser(user);
        Users users = new Users();
        users.setUsername(registerForm.getUsername());
        users.setPassword(new BCryptPasswordEncoder().encode(registerForm.getPassword()));
        users.setEnabled(1);
        Users user = usersRepository.save(users);
        
        System.out.println("UUID:"+user.getUuid());
        
        Authorities authorities = new Authorities();
        authorities.setUsername(registerForm.getUsername());
        authorities.setAuthority("ROLE_USER");
        authorityRepository.save(authorities);


        //客戶資料
        UsersInfo usersInfo = new UsersInfo();
        usersInfo.setUseruuid(user.getUuid());
        usersInfo.setName(registerForm.getName());
        usersInfo.setEmail(registerForm.getEmail());
        usersInfo.setPrivacy(registerForm.isPrivacy());
        usersInfo.setSubscription(registerForm.isSubscription());
        //執行新增
        usersInfoRepository.save(usersInfo);
    }

    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
