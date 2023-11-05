package com.fx23121.Service;

import com.fx23121.Entity.Company;
import com.fx23121.Model.CompanyModel;
import com.fx23121.Repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyRepository companyRepository;

    @Override
    @Transactional
    public int addCompany(Company company) {
        return companyRepository.saveOrUpdate(company);
    }

    @Override
    @Transactional
    public Company getCompany(int companyId) {
        return companyRepository.getCompany(companyId);
    }

    @Override
    @Transactional
    public void saveOrUpdate(CompanyModel companyModel) {
//        companyRepository.saveOrUpdate(company);
    }

    @Override
    @Transactional
    public List<Company> getCompanies() {
        return null;
    }
}
