package com.astrology.joyTarot.controller;

import com.astrology.joyTarot.dao.domain.TarotCard;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class TarotController extends BaseController {

    @GetMapping(value = "/tarot")
    public String gotoTarotPage(ModelMap model) {
        model.put("name", "Joanne");
        return "tarot/tarotIndex";
    }

    @GetMapping(value = "/tarot/tarotResult")
    public String gotoTarotResult(ModelMap model, @RequestParam Integer cardCount) {
        if(cardCount != 1 && cardCount != 3 && cardCount != 5){
            return null;
        }

        List<TarotCard> randomTarotCards = tarotCardService.findRandomTarotCardsByCardCount(cardCount);
        model.put("tarotNum", cardCount);
        model.put("randomTarotCards", randomTarotCards);
        return "tarot/tarotResult";
    }

    @GetMapping(value = "/tarot/tarotAll")
    public String gotoTarotAll(ModelMap model) {
        List<TarotCard> tarotCardList = tarotCardService.findAll();
        model.put("tarotCardList", tarotCardList);
        return "tarot/tarotAll";
    }

}
