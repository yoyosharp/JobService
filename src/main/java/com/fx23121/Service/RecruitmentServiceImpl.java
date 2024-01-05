package com.fx23121.Service;

import com.fx23121.DTO.SearchData;
import com.fx23121.Entity.Category;
import com.fx23121.Entity.Company;
import com.fx23121.Entity.Type;
import com.fx23121.Model.RecruitmentSearchFilter;
import com.fx23121.Entity.Recruitment;
import com.fx23121.Model.RecruitmentModel;
import com.fx23121.Repository.CompanyRepository;
import com.fx23121.Repository.RecruitmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {

    @Autowired
    private RecruitmentRepository recruitmentRepository;

    @Autowired
    private TypeService typeService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CompanyRepository companyRepository;

    @Override
    @Transactional
    public void addRecruitment(Company company, RecruitmentModel recruitmentModel) {


        Recruitment newRecruitment = new Recruitment();

        newRecruitment.setTitle(recruitmentModel.getTitle());
        newRecruitment.setStatus(1);
        newRecruitment.setDescription(recruitmentModel.getDescription());
        newRecruitment.setExperience((recruitmentModel.getExperience().isEmpty())? "Không yêu cầu": recruitmentModel.getExperience());
        newRecruitment.setQuantity(recruitmentModel.getQuantity());
        System.out.println(company.getAddress());
        newRecruitment.setAddress((recruitmentModel.getAddress().isEmpty())? company.getAddress() : recruitmentModel.getAddress());
        newRecruitment.setDeadline((recruitmentModel.getDeadline().isEmpty())? "Vô thời hạn" : recruitmentModel.getDeadline());
        newRecruitment.setSalary(recruitmentModel.getSalary());

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String createAt = formatter.format(LocalDateTime.now());
        newRecruitment.setCreateAt(createAt);

        Type jobType = typeService.getType(recruitmentModel.getTypeId());
        newRecruitment.setType(jobType);

        Category jobCategory = categoryService.getCategory(recruitmentModel.getCategoryId());
        newRecruitment.setCategory(jobCategory);

        newRecruitment.setCompany(company);

        company.setTotalJob(company.getTotalJob() + 1);

        recruitmentRepository.saveOrUpdate(newRecruitment);
        companyRepository.saveOrUpdate(company);
    }

    @Override
    @Transactional
    public Recruitment getRecruitment(int recruitmentId) {
        return recruitmentRepository.getRecruitment(recruitmentId);
    }


    @Override
    @Transactional
    public List<Recruitment> getTopRecruitments(int resultCount) {
        return recruitmentRepository.getTopRecruitments(resultCount);
    }

    @Override
    @Transactional
    public SearchData<Recruitment> searchRecruitment(RecruitmentSearchFilter filter, int pageSize, int pageIndex) {
        return recruitmentRepository.searchRecruitment(filter, pageSize, pageIndex);
    }

    @Override
    @Transactional
    public void saveOrUpdate(Recruitment recruitment) {

    }

    @Override
    @Transactional
    public void deleteRecruitment(int recruitmentId) {

    }

    @Override
    @Transactional
    public void update(Recruitment currentRecruitment, RecruitmentModel recruitmentModel) {
        currentRecruitment.setTitle(recruitmentModel.getTitle());
        currentRecruitment.setAddress(recruitmentModel.getAddress());
        currentRecruitment.setExperience(recruitmentModel.getExperience());
        currentRecruitment.setDescription(recruitmentModel.getDescription());
        currentRecruitment.setQuantity(recruitmentModel.getQuantity());
        currentRecruitment.setDeadline(recruitmentModel.getDeadline());
        if (currentRecruitment.getType().getId() != recruitmentModel.getTypeId()){
            Type jobType = typeService.getType(recruitmentModel.getTypeId());
            currentRecruitment.setType(jobType);
        }

        if (currentRecruitment.getCategory().getId() != recruitmentModel.getCategoryId()) {
            Category category = categoryService.getCategory(recruitmentModel.getCategoryId());
            currentRecruitment.setCategory(category);
        }

        recruitmentRepository.saveOrUpdate(currentRecruitment);
    }

    @Override
    @Transactional
    public List<Recruitment> getAppliedRecruitment(int userId) {
        return recruitmentRepository.getAppliedRecruitment(userId);
    }
}
