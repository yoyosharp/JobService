package com.fx23121.Repository;

import com.fx23121.DTO.CompanyDTO;
import com.fx23121.DTO.SearchData;
import com.fx23121.Entity.Company;

import java.util.List;

public interface CompanyRepository {

    Company getCompany(int companyId);

    List<Company> getCompanies();

    SearchData<Company> getCompanies(String searchKeyword, int pageSize, int pageIndex, int status);

    int saveOrUpdate(Company company);

    List<CompanyDTO> getTopCompanies(int type, int resultCount);

    SearchData<Company> getListCompany(int type, int pageSize, int pageIndex);
}
