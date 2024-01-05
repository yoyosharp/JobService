package com.fx23121.Service;

import com.fx23121.DTO.SearchData;
import com.fx23121.Entity.Company;
import com.fx23121.Model.RecruitmentSearchFilter;
import com.fx23121.Entity.Recruitment;
import com.fx23121.Model.RecruitmentModel;

import java.util.List;

public interface RecruitmentService {

    void addRecruitment(Company company, RecruitmentModel recruitmentModel);

    Recruitment getRecruitment(int recruitmentId);


    List<Recruitment> getTopRecruitments(int resultCount);

    SearchData<Recruitment> searchRecruitment(RecruitmentSearchFilter filter, int pageSize, int pageIndex);

    void saveOrUpdate(Recruitment recruitment);

    void deleteRecruitment(int recruitmentId);

    void update(Recruitment currentRecruitment, RecruitmentModel recruitmentModel);

    List<Recruitment> getAppliedRecruitment(int userId);
}
