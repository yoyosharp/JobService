package com.fx23121.Repository;

import com.fx23121.Entity.Recruitment;


public interface RecruitmentRepository {

    Recruitment getRecruitment(int recruitmentId);

    SearchData<Recruitment> getRecruitments(String searchKeyword, int pageSize, int pageIndex, int status);

    void saveOrUpdate(Recruitment recruitment);

}
