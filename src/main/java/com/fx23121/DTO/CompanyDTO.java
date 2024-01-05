package com.fx23121.DTO;

import com.fx23121.Entity.Company;

import java.util.List;

public class CompanyDTO {
    private final Company company;

    private final long parameter;

    public CompanyDTO(Company company, long parameter) {
        this.company = company;
        this.parameter = parameter;
    }

    public Company getCompany() {
        return company;
    }

    public long getParameter() {
        return parameter;
    }

    @Override
    public String toString() {
        return "CompanyDTO{" +
                "company=" + company +
                ", parameter=" + parameter +
                '}';
    }
}
