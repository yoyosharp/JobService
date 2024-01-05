package com.fx23121.Repository;

import com.fx23121.DTO.SearchData;
import com.fx23121.Entity.Recruitment;
import com.fx23121.Model.RecruitmentSearchFilter;

import java.util.List;


public interface RecruitmentRepository {

    Recruitment getRecruitment(int recruitmentId);


    void saveOrUpdate(Recruitment recruitment);

    List<Recruitment> getTopRecruitments(int resultCount);

    SearchData<Recruitment> searchRecruitment(RecruitmentSearchFilter filter, int pageSize, int pageIndex);

    List<Recruitment> getAppliedRecruitment(int userId);
}
