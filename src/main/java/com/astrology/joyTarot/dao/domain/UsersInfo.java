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
@Table(name = "USERS_INFO")
public class UsersInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name="UUID")
    private String uuid;

    @Column(name = "USERUUID")
    private String useruuid;
    
    @Column(name="NAME")
    private String name;

    @Column(name="EMAIL")
    private String email;

    @Column(name="PRIVACY")
    private Boolean privacy;

    @Column(name="SUBSCRIPTION")
    private Boolean subscription;
    
    @OneToOne
    @JoinColumn(name = "USERUUID", referencedColumnName = "UUID", insertable = false, updatable = false)
    private Users user;

}
