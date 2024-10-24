package com.astrology.joyTarot.dao;

import com.astrology.joyTarot.dao.domain.TarotCard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TarotCardRepository extends JpaRepository<TarotCard, String> {


    @Query(value ="select * " +
            "from ( " +
            "SELECT name,ROUND(RAND()) as positive FROM tarot_card group by name ORDER BY RAND() LIMIT :cardCount " +
            ") as result " +
            "right join tarot_card as all_tarot on result.name=all_tarot.name and result.positive = all_tarot.POSITIVE " +
            "where result.name is not null" ,nativeQuery = true)
    public List<TarotCard> findRandomTarotCardsByCardCount( @Param(value = "cardCount") Integer cardCount);

    @Query(value ="SELECT * FROM tarot_card ORDER BY NUMBER LIMIT 78" ,nativeQuery = true)
    public List<TarotCard> findAllPositiveCard();



}
