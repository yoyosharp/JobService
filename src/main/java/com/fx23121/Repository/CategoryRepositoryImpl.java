package com.fx23121.Repository;

import com.fx23121.Entity.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.List;

@Repository
@EnableTransactionManagement
public class CategoryRepositoryImpl implements RecordRepository<Category> {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Category getRecord(int categoryId) {
        //get a new session and retrieve the object
        Session session = sessionFactory.getCurrentSession();

        return session.get(Category.class, categoryId);
    }

    @Override
    public List<Category> getRecords() {
        //get a new session and retrieve the objects
        Session session = sessionFactory.getCurrentSession();

        Query<Category> query = session.createQuery("FROM Category", Category.class);
        return query.getResultList();
    }

    @Override
    public List<Category> searchRecords(String keyword, int resultCount) {
        //get new session
        Session session = sessionFactory.getCurrentSession();
        String strKeyword = "%" + keyword + "%";

        Query<Category> query = session.createQuery("FROM Category WHERE name LIKE :strKeyword" +
                " ORDER BY appliedNumber DESC", Category.class);
        query.setParameter("strKeyword", strKeyword);
        query.setMaxResults(8);

        return query.getResultList();
    }

    @Override
    public void saveOrUpdate(Category category) {

        // get new session
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(category);
    }
}

