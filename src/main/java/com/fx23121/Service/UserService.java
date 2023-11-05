package com.fx23121.Service;

import com.fx23121.Entity.User;
import com.fx23121.Exception.ConfirmPasswordNotMatchException;
import com.fx23121.Exception.EmailAlreadyExistedException;
import com.fx23121.Model.UserModel;

import java.util.List;

public interface UserService {
    User getUser(int userId);

    void saveOrUpdate(User user);

    List<User> getUsers();

    User getUserByEmail(String email);

    void addUser(UserModel userModel) throws ConfirmPasswordNotMatchException, EmailAlreadyExistedException;

    void update(UserModel userModel) throws EmailAlreadyExistedException;
}
