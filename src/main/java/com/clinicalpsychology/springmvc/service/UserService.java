package com.clinicalpsychology.springmvc.service;

import com.clinicalpsychology.springmvc.model.Login;
import com.clinicalpsychology.springmvc.model.User;

public interface UserService {

  int register(User user);

  User validateUser(Login login);
}
