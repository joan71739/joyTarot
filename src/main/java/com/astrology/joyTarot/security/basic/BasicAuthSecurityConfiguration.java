package com.astrology.joyTarot.security.basic;


import jakarta.servlet.ServletContext;
import jakarta.servlet.SessionTrackingMode;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AuthorizeHttpRequestsConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;
import java.util.EnumSet;

@Configuration
@EnableWebSecurity
public class BasicAuthSecurityConfiguration {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        //目前此般本，首頁可以自由訪問，其他頁面需要登入，登入頁面為內建
        http.authorizeHttpRequests(auth -> auth.requestMatchers(
                "/WEB-INF/**"
                , "/css/**"
                , "/js/**"
                , "/pic/**"
                , "/vendor/**"
                , "/tarot/**"
                , "/astrology/**"
                , "/animal/**"
                , "/register"
                , "/privacy"
                , "/").permitAll());
        http.authorizeHttpRequests((auth) -> {
            ((AuthorizeHttpRequestsConfigurer.AuthorizedUrl) auth
                    .anyRequest()
            )
                    .authenticated();
        });
        http.formLogin(form->form.loginPage("/login").defaultSuccessUrl("/").permitAll());

        //關掉csrf
        http.csrf(csrf -> csrf.disable());

        //session 設定
        http.sessionManagement(
                session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                        .maximumSessions(1)
                        .expiredUrl("/")
        );

        return (SecurityFilterChain) http.build();


    }

    //將使用者帳密碼新增近db
    @Bean
    public UserDetailsService userDetailsService(DataSource dataSource) {
        var jdbcUserDetailsManager = new JdbcUserDetailsManager(dataSource);
        return jdbcUserDetailsManager;
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
