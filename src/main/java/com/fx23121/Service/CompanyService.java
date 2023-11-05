package com.fx23121.Service;

import com.fx23121.Entity.Company;
import com.fx23121.Entity.User;
import com.fx23121.Model.CompanyModel;

import java.util.List;

public interface CompanyService {

    int addCompany(Company company);

    Company getCompany(int companyId);

    void saveOrUpdate(CompanyModel companyModel);

    List<Company> getCompanies();


}
