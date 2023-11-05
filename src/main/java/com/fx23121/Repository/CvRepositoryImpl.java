package com.fx23121.Repository;

import com.fx23121.Entity.Cv;
import com.fx23121.Entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.WebUtils;

import java.util.List;
import java.util.Queue;

@Repository
@EnableTransactionManagement
public class CvRepositoryImpl implements CvRepository {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public Cv getCv(int cvId) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();

        return session.get(Cv.class, cvId);
    }

    @Override
    public void addCv(Cv cv) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(cv);
    }

}
