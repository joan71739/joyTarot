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
@Table(name = "AUTHORITIES")
public class Authorities {

    @Id
    @Column(name="USERNAME")
    private String username;

    @Column(name="AUTHORITY")
    private String authority;


}
