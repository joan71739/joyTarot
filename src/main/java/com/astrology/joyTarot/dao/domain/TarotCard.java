package com.astrology.joyTarot.dao.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "TAROT_CARD")
public class TarotCard {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name="UUID")
    private String uuid;

    @Column(name="NUMBER")
    private Integer number;

    @Column(name="NAME")
    private String name;

    @Column(name="IMAGE_UUID")
    private String imageUuid;

    @Column(name="PROPERTY")
    private String property;

    @Column(name="ELEMENT")
    private String element;

    @Column(name="PEOPLE")
    private String people;

    @Column(name="PLANET")
    private String planet;

    @Column(name="POSITIVE")
    private boolean positive;

   @Column(name="KEYWORD")
    private String keyWord;

   @Column(name="ONEWORD")
    private String oneWord;

   @Column(name="THINKING")
    private String thinking;

   @Column(name="JOB")
    private String job;

   @Column(name="HEALTH")
    private String health;

   @Column(name="MEANING")
    private String meaning;

    @Transient
    private String cardPosition;

}
