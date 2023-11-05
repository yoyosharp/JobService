package com.fx23121.Repository;

import com.fx23121.Entity.Company;

public interface CompanyRepository {

    Company getCompany(int companyId);

    SearchData<Company> getCompanies(String searchKeyword, int pageSize, int pageIndex, int status);

    int saveOrUpdate(Company company);
}
