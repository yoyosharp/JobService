package com.fx23121.Model;

import org.springframework.stereotype.Component;

@Component
public class RecruitmentSearchFilter {
    private String title;

    private int categoryId;

    private int type;

    private String address;

    private int companyId;

    public RecruitmentSearchFilter() {
    }

    public RecruitmentSearchFilter(String title, int categoryId, int type, String address, int companyId) {
        this.title = title;
        this.categoryId = categoryId;
        this.type = type;
        this.address = address;
        this.companyId = companyId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public void reset() {
        this.title = "";
        this.categoryId = 0;
        this.type = 0;
        this.address = "";
        this.companyId = 0;
    }
}
