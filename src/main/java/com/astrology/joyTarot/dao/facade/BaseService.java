package com.astrology.joyTarot.dao.facade;

import com.astrology.joyTarot.dao.AuthorityRepository;
import com.astrology.joyTarot.dao.TarotCardRepository;
import com.astrology.joyTarot.dao.UsersDetailRepository;
import com.astrology.joyTarot.dao.UsersRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 提供基本Service層方法
 * @param <T> 定義基本Service的類別類型
 */

@Service
public abstract class BaseService {

//	//一定要在第一個
//  private  Class<T> clazz;
	
	@Autowired
    protected HttpServletRequest request;
    @Autowired
    protected HttpServletResponse response;
    
    
    @Autowired
	public TarotCardRepository tarotCardRepository;
    @Autowired
	public UsersDetailRepository usersDetailRepository;
    @Autowired
    public AuthorityRepository authorityRepository;
    @Autowired
    public UsersRepository usersRepository;

    protected final Logger log = LoggerFactory.getLogger(getClass());
}
