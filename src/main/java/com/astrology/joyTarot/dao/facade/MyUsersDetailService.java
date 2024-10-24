package com.astrology.joyTarot.dao.facade;

import com.astrology.joyTarot.dao.domain.Authorities;
import com.astrology.joyTarot.dao.domain.Users;
import com.astrology.joyTarot.dao.domain.UsersDetail;
import com.astrology.joyTarot.form.RegisterForm;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Service;


@Service
public class MyUsersDetailService extends BaseService {

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
        usersRepository.save(users);
        Authorities authorities = new Authorities();
        authorities.setUsername(registerForm.getUsername());
        authorities.setAuthority("ROLE_USER");
        authorityRepository.save(authorities);


        //客戶資料
        UsersDetail usersDetail = new UsersDetail();
        usersDetail.setName(registerForm.getName());
        usersDetail.setEmail(registerForm.getEmail());
        usersDetail.setPrivacy(registerForm.isPrivacy());
        usersDetail.setSubscription(registerForm.isSubscription());
        //執行新增
        usersDetailRepository.save(usersDetail);
    }

    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
