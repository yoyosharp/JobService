package com.fx23121.Repository;

import com.fx23121.Entity.Company;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.List;

@Repository
@EnableTransactionManagement
public class CompanyRepositoryImpl implements CompanyRepository {

    private final int ALL_STATUS_VALUE = -10;
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Company getCompany(int companyId) {

        //get a new session and retrieve the object
        Session session = sessionFactory.getCurrentSession();

        return session.get(Company.class, companyId);
    }

    @Override
    public SearchData<Company> getCompanies(String searchKeyword, int pageSize, int pageIndex, int status) {

        //get a new session
        Session session = sessionFactory.getCurrentSession();

        //handle query

        String queryKeyword = "%" + searchKeyword + "%";

        String strTotalResultQuery = "SELECT COUNT(c) FROM Company c" +
                " WHERE (name LIKE :queryKeyword OR phoneNumber LIKE :queryKeyword)";
        String strResultQuery = "FROM Company c" +
                " WHERE (name LIKE :queryKeyword OR phoneNumber LIKE :queryKeyword)";
        //handle status
        if (status != ALL_STATUS_VALUE) {
            strTotalResultQuery += " AND status = :status";
            strResultQuery += " AND status = :status";
        }

        //order by most job applied and posted
        strResultQuery += "ORDER BY totalApplied, totalJob DESC";

        //retrieve maxResultCount
        Query<Long> totalResultCountQuery = session.createQuery(strTotalResultQuery, Long.class);
        if (status != ALL_STATUS_VALUE) totalResultCountQuery.setParameter("status", status);
        long totalResultCount = totalResultCountQuery.getSingleResult();

        //get number of result to query
        int resultCount = (int) Math.min(pageSize, totalResultCount - pageSize * (pageIndex - 1));

        //get result list
        Query<Company> resultQuery = session.createQuery(strResultQuery, Company.class);
        if (status != ALL_STATUS_VALUE) resultQuery.setParameter("status", status);
        resultQuery.setFirstResult(pageSize * (pageIndex - 1));
        resultQuery.setMaxResults(resultCount);
        List<Company> resultList = resultQuery.getResultList();

        return new SearchData<>((int) totalResultCount, resultList);
    }

    @Override
    public int saveOrUpdate(Company company) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(company);

        return company.getId();
    }
}
