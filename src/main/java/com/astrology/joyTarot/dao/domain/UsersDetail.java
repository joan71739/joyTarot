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
@Table(name = "USERS_DETAIL")
public class UsersDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name="UUID")
    private String uuid;

    @Column(name="USERNAME")
    private String username;

    @Column(name="NAME")
    private String name;

    @Column(name="EMAIL")
    private String email;

    @Column(name="PRIVACY")
    private Boolean privacy;

    @Column(name="SUBSCRIPTION")
    private Boolean subscription;

}
