package com.astrology.joyTarot.controller;

import com.astrology.joyTarot.dao.domain.TarotCard;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class TarotController extends BaseController {

    @RequestMapping(value = "/tarot", method = RequestMethod.GET)
    public String gotoTarotPage(ModelMap model) {
        model.put("name", "Joanne");
        return "tarot/tarotIndex";
    }

    @RequestMapping(value = "/tarot/tarotResult", method = RequestMethod.GET)
    public String gotoTarotResult(ModelMap model, @RequestParam Integer cardCount) {
        if(cardCount != 1 && cardCount != 3 && cardCount != 5){
            return null;
        }

        List<TarotCard> randomTarotCards = tarotCardService.findRandomTarotCardsByCardCount(cardCount);
        model.put("tarotNum", cardCount);
        model.put("randomTarotCards", randomTarotCards);
        return "tarot/tarotResult";
    }

    @RequestMapping(value = "/tarot/tarotAll", method = RequestMethod.GET)
    public String gotoTarotAll(ModelMap model) {
        List<TarotCard> tarotCardList = tarotCardService.findAll();
        model.put("tarotCardList", tarotCardList);
        return "tarot/tarotAll";
    }

}
