package com.fx23121.Model;

import com.fx23121.Entity.Category;
import com.fx23121.Entity.Company;
import com.fx23121.Entity.Type;
import com.fx23121.Entity.User;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

public class RecruitmentModel {

    @NotNull(message = "Tiêu đề không được bỏ trống")
    @NotBlank(message = "Tiêu đề không được bỏ trống")
    private String title;

    private String description;

    private String experience;

    @NotNull(message = "Số lượng tuyển dụng không được bỏ trống")
    private Integer quantity;

    private String address;

    private Integer salary = 0;

    private String deadline;

    @NotNull(message = "Loại công việc không được bỏ trống")
    private Integer typeId;
    @NotNull(message = "Danh mục không được bỏ trống")
    private Integer categoryId;

    public RecruitmentModel(String title, String description, String experience, Integer quantity, String address, Integer salary, String deadline, Integer typeId, Integer categoryId) {
        this.title = title;
        this.description = description;
        this.experience = experience;
        this.quantity = quantity;
        this.address = address;
        this.salary = salary;
        this.deadline = deadline;
        this.typeId = typeId;
        this.categoryId = categoryId;
    }

    public RecruitmentModel() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
}
