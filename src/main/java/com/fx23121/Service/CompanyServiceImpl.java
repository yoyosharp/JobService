package com.fx23121.Service;

import com.fx23121.DTO.CompanyDTO;
import com.fx23121.DTO.SearchData;
import com.fx23121.Entity.Company;
import com.fx23121.Exception.EmailAlreadyExistedException;
import com.fx23121.Model.CompanyModel;
import com.fx23121.Repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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
    public void saveOrUpdate(Company company) {
        companyRepository.saveOrUpdate(company);
    }

    @Override
    @Transactional
    public List<Company> getCompanies() {
        return companyRepository.getCompanies();
    }

    @Override
    @Transactional
    public void update(int companyId, CompanyModel companyModel) throws EmailAlreadyExistedException {
        Company currentCompany = getCompany(companyId);
        List<String> companyEmails = new ArrayList<>();
        getCompanies().forEach(company -> companyEmails.add(company.getEmail()));

        if (!companyModel.getEmail().equals(currentCompany.getEmail()) && companyEmails.contains(companyModel.getEmail())) throw new EmailAlreadyExistedException();

        currentCompany.setEmail(companyModel.getEmail());
        currentCompany.setName(companyModel.getName());
        currentCompany.setAddress(companyModel.getAddress());
        currentCompany.setPhoneNumber(companyModel.getPhoneNumber());
        currentCompany.setDescription(companyModel.getDescription());

        companyRepository.saveOrUpdate(currentCompany);
    }

    //get top companies by type: 1 - by total recruitment, 2 - by total job quantity, 3 - by total applicant
    @Override
    @Transactional
    public List<CompanyDTO> getTopCompanies(int type, int resultCount) {
        return companyRepository.getTopCompanies(type, resultCount);
    }

    @Override
    @Transactional
    public SearchData<Company> listCompany(int type, int pageSize, int pageIndex) {
        return companyRepository.getListCompany(type, pageSize, pageIndex);
    }

}
