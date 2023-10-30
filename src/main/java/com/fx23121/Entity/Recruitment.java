package com.fx23121.Entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "recruitment")
public class Recruitment {
    
    //define fields
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    
    @Column(name = "title")
    @NotNull(message = "Tiêu đề không được bỏ trống")
    @Size(min = 1, message = "Tiêu đề không được bỏ trống")
    @NotBlank(message = "Tiêu đề không được bỏ trống")
    private String title;
    
    @Column(name = "description")
    private String description;
    
    @Column(name = "experience")
    private String experience;
    
    @Column(name = "quantity")
    @NotNull(message = "Số lượng tuyển dụng không được bỏ trống")
    private Integer quantity;

    @Column(name = "address")
    @NotNull(message = "Địa chỉ không được bỏ trống")
    @Size(min = 1, message = "Địa chỉ không được bỏ trống")
    @NotBlank(message = "Địa chỉ không được bỏ trống")
    private String address;

    @Column(name = "salary")
    @NotNull(message = "Mức lương không được bỏ trống")
    private Integer salary;

    @Column(name = "deadline")
    @NotNull(message = "Hạn ứng tuyển không được bỏ trống")
    @Size(min = 1, message = "Hạn ứng tuyển không được bỏ trống")
    @NotBlank(message = "Hạn ứng tuyển không được bỏ trống")
    private String deadline;

    @Column(name = "create_at")
    private String createAt;//this field is an auto-generated field

    @Column(name = "total_applied")
    private int totalApplied;

    @ManyToOne
    @JoinColumn(name = "type_id")
    private Type type;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;

    @ManyToMany(mappedBy = "savedJobs")
    private List<User> savedUsers;

    @ManyToMany(mappedBy = "appliedJobs")
    private List<User> appliedUsers;
    //define constructors
    public Recruitment() {
    }

    public Recruitment(String title, String description, String experience, Integer quantity, String address, Integer salary, String deadline, String createAt) {
        this.title = title;
        this.description = description;
        this.experience = experience;
        this.quantity = quantity;
        this.address = address;
        this.salary = salary;
        this.deadline = deadline;
        this.createAt = createAt;
    }

    //define getters/setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public List<User> getSavedUsers() {
        return savedUsers;
    }

    public void setSavedUsers(List<User> savedUsers) {
        this.savedUsers = savedUsers;
    }

    public List<User> getAppliedUsers() {
        return appliedUsers;
    }

    public void setAppliedUsers(List<User> appliedUsers) {
        this.appliedUsers = appliedUsers;
    }

    //define toString()

    @Override
    public String toString() {
        return "Recruitment{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", company=" + company.getName() +
                '}';
    }
}
