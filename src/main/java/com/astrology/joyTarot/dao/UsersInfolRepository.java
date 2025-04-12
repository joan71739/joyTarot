package com.astrology.joyTarot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.astrology.joyTarot.dao.domain.Users;
import com.astrology.joyTarot.dao.domain.UsersInfo;

@Repository
public interface UsersInfolRepository extends JpaRepository<UsersInfo, String> {

	 
	 public UsersInfo findByUser(Users user);
}
