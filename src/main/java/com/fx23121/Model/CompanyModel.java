package com.fx23121.Model;


import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


public class CompanyModel {

    @NotNull(message = "Tên công ty không được bỏ trống")
    @Size(min = 1, message = "Tên công ty không được bỏ trống")
    @NotBlank(message = "Tên công ty không được bỏ trống")
    private String name;

    @NotNull(message = "Số điện thoại không được bỏ trống")
    @Size(min = 1, message = "Số điện thoại không được bỏ trống")
    @NotBlank(message = "Số điện thoại không được bỏ trống")
    private String phoneNumber;

    @NotNull(message = "Địa chỉ không được bỏ trống")
    @Size(min = 1, message = "Địa chỉ không được bỏ trống")
    @NotBlank(message = "Địa chỉ không được bỏ trống")
    private String address;

    @NotNull(message = "Email không được bỏ trống")
    @Pattern(regexp = "^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$",
            message = "Email không hợp lệ")
    private String email;

    private String logo;

    private String description;

    public CompanyModel() {
    }

    public CompanyModel(String name, String phoneNumber, String address, String email, String logo, String description) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.email = email;
        this.logo = logo;
        this.description = description;
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
}
