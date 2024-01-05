package com.fx23121.Service;

import com.fx23121.Entity.Category;
import com.fx23121.Repository.RecordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private RecordRepository<Category> categoryRecordRepository;


    @Override
    @Transactional
    public Category getCategory(int categoryId) {
        return categoryRecordRepository.getRecord(categoryId);
    }

    @Override
    @Transactional
    public List<Category> getCategories() {
        return categoryRecordRepository.getRecords();
    }


    @Override
    @Transactional
    public List<Category> searchRecords(String keyword, int resultCount) {
        return categoryRecordRepository.searchRecords(keyword, resultCount);
    }

    @Override
    @Transactional
    public void saveOrUpdate(Category category) {
        categoryRecordRepository.saveOrUpdate(category);
    }
}
