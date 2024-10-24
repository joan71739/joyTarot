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
@Table(name = "USERS")
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name="UUID")
    private String uuid;

    @Column(name="USERNAME")
    private String username;

    @Column(name="PASSWORD")
    private String password;

    @Column(name="ENABLED")
    private Integer enabled;


}
