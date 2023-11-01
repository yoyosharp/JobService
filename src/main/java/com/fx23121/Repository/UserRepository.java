package com.fx23121.Repository;

import com.fx23121.Entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface UserRepository {

    User getUser(int userId);

    void saveOrUpdate(User user);

    List<User> getUsers();

    User getUserByEmail(String email);
}
