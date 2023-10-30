package com.fx23121.Entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "company")
public class Company {

    //define fields
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    @NotNull(message = "Tên công ty không được bỏ trống")
    @Size(min = 1, message = "Tên công ty không được bỏ trống")
    @NotBlank(message = "Tên công ty không được bỏ trống")
    private String name;

    @Column(name = "phone_number")
    @NotNull(message = "Số điện thoại không được bỏ trống")
    @Size(min = 1, message = "Số điện thoại không được bỏ trống")
    @NotBlank(message = "Số điện thoại không được bỏ trống")
    private String phoneNumber;

    @Column(name = "address")
    @NotNull(message = "Địa chỉ không được bỏ trống")
    @Size(min = 1, message = "Địa chỉ không được bỏ trống")
    @NotBlank(message = "Địa chỉ không được bỏ trống")
    private String address;

    @Column(name = "email")
    @NotNull(message = "Email không được bỏ trống")
    @Pattern(regexp = "^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$",
            message = "Email không hợp lệ")
    private String email;

    @Column(name = "logo")
    private String logo;

    @Column(name = "description")
    private String description;

    @Column(name = "total_job")
    private int totalJob;

    @Column(name = "total_applied")
    private int totalApplied;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User hr;

    @ManyToMany(mappedBy = "followedCompanies")
    private List<User> followedUsers;
    //define constructors

    public Company() {
    }

    public Company(String name, String phoneNumber, String address, String email, String logo, String description) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.email = email;
        this.logo = logo;
        this.description = description;
        totalJob = 0;
        totalApplied = 0;
    }

    //define getters/setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTotalJob() {
        return totalJob;
    }

    public void setTotalJob(int totalJob) {
        this.totalJob = totalJob;
    }

    public int getTotalApplied() {
        return totalApplied;
    }

    public void setTotalApplied(int totalApplied) {
        this.totalApplied = totalApplied;
    }

    public User getHr() {
        return hr;
    }

    public void setHr(User hr) {
        this.hr = hr;
    }

    public List<User> getFollowedUsers() {
        return followedUsers;
    }

    public void setFollowedUsers(List<User> followedUsers) {
        this.followedUsers = followedUsers;
    }


    //define toString()

    @Override
    public String toString() {
        return "Company{" +
                "id=" + id +
                ", hr=" + hr.getEmail() +
                '}';
    }
}
