package com.fx23121.Repository;

import com.fx23121.Entity.Recruitment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.List;

@Repository
@EnableTransactionManagement
public class RecruitmentRepositoryImpl implements RecruitmentRepository {

    private final int ALL_STATUS_VALUE = -10;
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Recruitment getRecruitment(int recruitmentId) {

        //get new session
        Session session = sessionFactory.getCurrentSession();

        return session.get(Recruitment.class, recruitmentId);
    }

    @Override
    public SearchData<Recruitment> getRecruitments(String searchKeyword, int pageSize, int pageIndex, int status) {

        //get a new session
        Session session = sessionFactory.getCurrentSession();

        //handle query

        String queryKeyword = "%" + searchKeyword + "%";

        String strTotalResultQuery = "SELECT COUNT(r) FROM Recruitment r" +
                " WHERE (title LIKE :queryKeyword OR phoneNumber LIKE :queryKeyword)";
        String strResultQuery = "FROM Recruitment r" +
                " WHERE (title LIKE :queryKeyword OR phoneNumber LIKE :queryKeyword)";
        //handle status
        if (status != ALL_STATUS_VALUE) {
            strTotalResultQuery += " AND status = :status";
            strResultQuery += " AND status = :status";
        }
        strResultQuery += " ORDER BY salary, quantity DESC";

        //retrieve maxResultCount
        Query<Long> totalResultCountQuery = session.createQuery(strTotalResultQuery, Long.class);
        if (status != ALL_STATUS_VALUE) totalResultCountQuery.setParameter("status", status);
        long totalResultCount = totalResultCountQuery.getSingleResult();

        //get number of result to query
        int resultCount = (int) Math.min(pageSize, totalResultCount - pageSize * (pageIndex - 1));

        //get result list
        Query<Recruitment> resultQuery = session.createQuery(strResultQuery, Recruitment.class);
        if (status != ALL_STATUS_VALUE) resultQuery.setParameter("status", status);
        resultQuery.setFirstResult(pageSize * (pageIndex - 1));
        resultQuery.setMaxResults(resultCount);
        List<Recruitment> resultList = resultQuery.getResultList();

        return new SearchData<>((int) totalResultCount, resultList);

    }

    @Override
    public void saveOrUpdate(Recruitment recruitment) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(recruitment);
    }
}
