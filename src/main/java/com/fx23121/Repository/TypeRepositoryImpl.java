package com.fx23121.Repository;

import com.fx23121.Entity.Type;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@EnableTransactionManagement
public class TypeRepositoryImpl implements RecordRepository<Type> {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Type getRecord(int typeId) {
        //get a new session and retrieve the object
        Session session = sessionFactory.getCurrentSession();

        return session.get(Type.class, typeId);
    }

    @Override

    public List<Type> getRecords() {
        //get a new session and retrieve the objects
        Session session = sessionFactory.getCurrentSession();

        Query<Type> query = session.createQuery("FROM Type", Type.class);
        return query.getResultList();
    }

    @Override
    public List<Type> searchRecords(String keyword, int resultCount) {
        return null;
    }

    @Override
    public void saveOrUpdate(Type type) {

    }
}
