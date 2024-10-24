package com.astrology.joyTarot.dao;

import com.astrology.joyTarot.dao.domain.Authorities;
import com.astrology.joyTarot.dao.domain.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorityRepository extends JpaRepository<Authorities, String> {


}
