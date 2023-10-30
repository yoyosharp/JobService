package com.fx23121.Repository;

import com.fx23121.Entity.User;
import org.springframework.stereotype.Repository;


public interface UserRepository {

    User getUser(int userId);

    void saveOrUpdate(User user);


}
