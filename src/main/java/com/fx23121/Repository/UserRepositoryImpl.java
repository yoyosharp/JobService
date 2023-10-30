package com.fx23121.Repository;

import com.fx23121.Entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Repository
@EnableTransactionManagement
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public User getUser(int userId) {
        //get a new session and retrieve the object
        Session session = sessionFactory.getCurrentSession();

        return session.get(User.class, userId);
    }

    @Override
    public void saveOrUpdate(User user) {
        //get a new session and retrieve the object
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(user);
    }
}
