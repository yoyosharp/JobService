package com.fx23121.Repository;

import com.fx23121.DTO.SearchData;
import com.fx23121.Entity.Recruitment;
import com.fx23121.Model.RecruitmentSearchFilter;
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
    public void saveOrUpdate(Recruitment recruitment) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(recruitment);
    }

    @Override
    public List<Recruitment> getTopRecruitments(int resultCount) {

        //get a session
        Session session= sessionFactory.getCurrentSession();

        //create query
        String strQuery = "FROM Recruitment r WHERE status = 1 ORDER BY salary DESC, quantity DESC, totalApplied DESC";
        Query<Recruitment> query = session.createQuery(strQuery, Recruitment.class);
        query.setMaxResults(resultCount);

        return query.getResultList();
    }

    @Override
    public SearchData<Recruitment> searchRecruitment(RecruitmentSearchFilter filter, int pageSize, int pageIndex) {
        //get a new session
        Session session = sessionFactory.getCurrentSession();
        String keyword =  "%" + filter.getTitle() + "%";
        String address = "%" + filter.getAddress() + "%";
        int companyId = filter.getCompanyId();
        int typeId = filter.getType();
        int categoryId = filter.getCategoryId();
        System.out.println(categoryId);

        //create queries
        String strResultCountQuery = "SELECT COUNT(r) FROM Recruitment r WHERE (title LIKE :keyword" +
                " OR company.name LIKE :keyword)" +
                " AND address LIKE :address";
        String strQuery = "FROM Recruitment r WHERE (title LIKE :keyword OR company.name LIKE :keyword) AND address LIKE :address";
        if (typeId != 0){
            strResultCountQuery += " AND type.id = :typeId";
            strQuery += " AND type.id = :typeId";
        }
        if (categoryId != 0) {
            strResultCountQuery += " AND category.id = :categoryId";
            strQuery += " AND category.id = :categoryId";
        }
        if ((companyId != 0)) {
            strResultCountQuery += " AND company.id = :companyId";
            strQuery += " AND company.id = :companyId";
        }

        strResultCountQuery += " AND status = 1";
        strQuery += " AND status = 1";
        strQuery += " ORDER by r.salary DESC, r.quantity DESC, r.totalApplied DESC";

        Query<Long> resultCountQuery = session.createQuery(strResultCountQuery, Long.class);
        Query<Recruitment> resultQuery = session.createQuery(strQuery, Recruitment.class);
        resultCountQuery.setParameter("keyword", keyword);
        resultQuery.setParameter("keyword", keyword);
        resultCountQuery.setParameter("address", address);
        resultQuery.setParameter("address", address);
        if (typeId != 0){
            resultCountQuery.setParameter("typeId", typeId);
            resultQuery.setParameter("typeId", typeId);
        }
        if (categoryId != 0) {
            resultCountQuery.setParameter("categoryId", categoryId);
            resultQuery.setParameter("categoryId", categoryId);
        }
        if (companyId != 0) {
            resultCountQuery.setParameter("companyId", companyId);
            resultQuery.setParameter("companyId", companyId);
        }

        long totalResultCount = resultCountQuery.getSingleResult();


        int resultCount = Math.min(pageSize, (int) (totalResultCount - pageSize*(pageIndex - 1)));
        resultQuery.setFirstResult(pageSize*(pageIndex - 1));
        resultQuery.setMaxResults(resultCount);
        List<Recruitment> resultList = resultQuery.getResultList();
        return new SearchData<>((int) totalResultCount, resultList);
    }

    @Override
    public List<Recruitment> getAppliedRecruitment(int userId) {
        //get a new session
//        Session session = sessionFactory.getCurrentSession();
//
//        Query<Recruitment> query = session.createQuery("FROM Recruitment r JOIN ");
        return null;
    }
}
