package com.clinicalpsychology.springmvc.dao;

import com.clinicalpsychology.springmvc.model.Login;
import com.clinicalpsychology.springmvc.model.User;

public interface UserDao {

  int register(User user);

  User validateUser(Login login);
}
