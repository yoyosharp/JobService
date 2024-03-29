package com.fx23121.Service;

import com.fx23121.DTO.CompanyDTO;
import com.fx23121.DTO.SearchData;
import com.fx23121.Entity.Company;
import com.fx23121.Entity.User;
import com.fx23121.Exception.EmailAlreadyExistedException;
import com.fx23121.Model.CompanyModel;

import java.util.List;

public interface CompanyService {

    int addCompany(Company company);

    Company getCompany(int companyId);

    void saveOrUpdate(Company company);

    List<Company> getCompanies();

    void update(int companyId, CompanyModel companyModel) throws EmailAlreadyExistedException;

    List<CompanyDTO> getTopCompanies(int type, int resultCount);

    SearchData<Company> listCompany(int type, int pageSize, int pageIndex);
}
