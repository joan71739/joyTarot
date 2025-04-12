package com.astrology.joyTarot.dao;

import com.astrology.joyTarot.dao.domain.Users;
import com.astrology.joyTarot.dao.domain.UsersInfo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersRepository extends JpaRepository<Users, String> {

	Optional<Users> findByUsername(String username);


}
