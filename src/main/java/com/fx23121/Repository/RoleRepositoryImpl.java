package com.fx23121.Repository;

import com.fx23121.Entity.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.List;

@Repository
@EnableTransactionManagement
public class RoleRepositoryImpl implements RecordRepository<Role> {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Role getRecord(int categoryId) {
        //get a new session and retrieve the object
        Session session = sessionFactory.getCurrentSession();

        return session.get(Role.class, categoryId);
    }

    @Override
    public List<Role> getRecords() {
        //get a new session and retrieve the objects
        Session session = sessionFactory.getCurrentSession();

        Query<Role> query = session.createQuery("FROM Category", Role.class);
        return query.getResultList();
    }
}
