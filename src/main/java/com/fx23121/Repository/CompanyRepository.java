package com.fx23121.Repository;

import com.fx23121.Entity.Company;

import java.util.List;

public interface CompanyRepository {

    Company getCompany(int companyId);

    SearchData<Company> getCompanies(String searchKeyword, int pageSize, int pageIndex, int status);

    void saveOrUpdate(Company company);
}
