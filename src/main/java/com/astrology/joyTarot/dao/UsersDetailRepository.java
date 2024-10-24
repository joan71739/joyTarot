package com.astrology.joyTarot.dao;

import com.astrology.joyTarot.dao.domain.UsersDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersDetailRepository extends JpaRepository<UsersDetail, String> {


}
