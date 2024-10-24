package com.astrology.joyTarot.dao.facade;

import com.astrology.joyTarot.dao.domain.TarotCard;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TarotCardService extends BaseService {

    public List<TarotCard> findAll() { return tarotCardRepository.findAllPositiveCard();}

    public List<TarotCard> findRandomTarotCardsByCardCount(Integer cardCount) {
        List<TarotCard> tarotCards = tarotCardRepository.findRandomTarotCardsByCardCount(cardCount);
        switch (cardCount){
            case 1:
                tarotCards.get(0).setCardPosition("現況");
                break;
            case 3:
                tarotCards.get(0).setCardPosition("過去");
                tarotCards.get(1).setCardPosition("現況");
                tarotCards.get(2).setCardPosition("未來");
                break;
            case 5:
                tarotCards.get(0).setCardPosition("環境");
                tarotCards.get(1).setCardPosition("A選擇過程");
                tarotCards.get(2).setCardPosition("B選擇過程");
                tarotCards.get(3).setCardPosition("A選擇結果");
                tarotCards.get(4).setCardPosition("B選擇結果");
                break;
            default:
                break;

        }
        return tarotCards;
    }
}
