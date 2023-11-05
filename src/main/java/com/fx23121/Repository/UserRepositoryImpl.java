package com.fx23121.Repository;

import com.fx23121.Entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.NoResultException;
import java.util.List;

@Repository
@EnableTransactionManagement
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
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

    @Override
    public List<User> getUsers() {
        //get a new session and retrieve the object
        Session session = sessionFactory.getCurrentSession();

        Query<User> query = session.createQuery("FROM User where status != -1", User.class);

        return query.getResultList();
    }

    @Override
    public User getUserByEmail(String email) {
        //get a new session and retrieve the object
        Session session = sessionFactory.getCurrentSession();
        try {
            Query<User> query = session.createQuery("FROM User WHERE email = :email", User.class);
            query.setParameter("email", email);
            return query.getSingleResult();
        } catch (NoResultException nre) {
            return null;
        }
    }
}
