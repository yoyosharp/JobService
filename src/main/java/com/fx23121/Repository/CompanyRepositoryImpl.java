package com.fx23121.Repository;

import com.fx23121.DTO.CompanyDTO;
import com.fx23121.DTO.SearchData;
import com.fx23121.Entity.Company;
import com.mysql.cj.log.Log;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.ArrayList;
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
    public List<Company> getCompanies() {
        Session session = sessionFactory.getCurrentSession();

        Query<Company> query = session.createQuery("FROM Company", Company.class);
        return query.getResultList();
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

    @Override
    public List<CompanyDTO> getTopCompanies(int type, int resultCount) {

        //get a new session
        Session session = sessionFactory.getCurrentSession();

        String strQuery = "SELECT c, COUNT(DISTINCT r) AS recruitmentCount, SUM(r.quantity) AS totalJobCount," +
                " COUNT(au.id) AS totalApplied" +
                " FROM Company c" +
                " LEFT JOIN Recruitment r ON c.id = r.company.id" +
                " LEFT JOIN r.appliedUsers au" +
                " GROUP BY c.id";

        switch (type) {
            case 1: {
                strQuery += " ORDER BY recruitmentCount DESC";
                break;
            }

            case 2: {
                strQuery += " ORDER BY totalJobCount DESC";
                break;
            }

            case 3: {
                strQuery += " ORDER BY totalApplied DESC";
                break;
            }

            default:{}
        }

        Query<Object[]> query = session.createQuery(strQuery, Object[].class);
        query.setMaxResults(resultCount);

        List<Object[]> queryResultList = query.list();

        switch (type) {
            case 1: {
                List<CompanyDTO> resultList = new ArrayList<>();
                queryResultList.forEach(objects -> {
                    resultList.add(new CompanyDTO((Company) objects[0], (Long) objects[1]));
                });

                return resultList;
            }

            case 2: {
                List<CompanyDTO> resultList = new ArrayList<>();
                queryResultList.forEach(objects -> {
                    resultList.add(new CompanyDTO((Company) objects[0], (Long) objects[2]));
                });

                return resultList;
            }

            case 3: {
                List<CompanyDTO> resultList = new ArrayList<>();
                queryResultList.forEach(objects -> {
                    resultList.add(new CompanyDTO((Company) objects[0], (Long) objects[3]));
                });

                return resultList;
            }

            default:{
                return null;
            }
        }
    }

    @Override
    public SearchData<Company> getListCompany(int type, int pageSize, int pageIndex) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();

        //get total company count
        String strTotalResultCount = "SELECT COUNT(c) FROM Company c";
        Query<Long> totalResultCountQuery = session.createQuery(strTotalResultCount, Long.class);
        long totalResultCount = totalResultCountQuery.getSingleResult();

        int resultCount = (int) Math.min(pageSize, totalResultCount - pageSize * (pageIndex - 1));

        String strQuery = "SELECT c, COUNT(DISTINCT r) AS recruitmentCount, SUM(r.quantity) AS totalJobCount," +
                " COUNT(au.id) AS totalApplied" +
                " FROM Company c" +
                " LEFT JOIN Recruitment r ON c.id = r.company.id" +
                " LEFT JOIN r.appliedUsers au" +
                " GROUP BY c.id";

        switch (type) {
            case 1: {
                strQuery += " ORDER BY recruitmentCount DESC";
                break;
            }

            case 2: {
                strQuery += " ORDER BY totalJobCount DESC";
                break;
            }

            case 3: {
                strQuery += " ORDER BY totalApplied DESC";
                break;
            }

            default:{}
        }

        Query<Object[]> query = session.createQuery(strQuery, Object[].class);
        query.setMaxResults(resultCount);

        List<Object[]> queryResultList = query.list();

        List<Company> resultList = new ArrayList<>();
        queryResultList.forEach(objects -> {
            resultList.add((Company) objects[0]);
        });

        return new SearchData<>((int) totalResultCount, resultList);
    }
}
