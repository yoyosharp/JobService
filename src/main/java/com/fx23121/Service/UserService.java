package com.fx23121.Service;

import com.fx23121.Entity.Cv;
import com.fx23121.Entity.User;

public interface UserService {
    User getUser(int userId);

    void saveOrUpdate(User user);

}
