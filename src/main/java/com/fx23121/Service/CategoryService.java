package com.fx23121.Service;

import com.fx23121.Entity.Category;

import java.util.List;

public interface CategoryService {
    Category getCategory(int categoryId);

    List<Category> getCategories();

    List<Category> searchRecords(String keyword, int resultCount);

    void saveOrUpdate(Category category);
}
