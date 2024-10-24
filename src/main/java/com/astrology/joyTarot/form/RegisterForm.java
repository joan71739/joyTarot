package com.astrology.joyTarot.form;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RegisterForm {

    private String name;
    private String username;
    private String password;
    private String email;
    private boolean privacy;
    private boolean subscription;


}
