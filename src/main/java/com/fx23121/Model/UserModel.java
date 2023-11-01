package com.fx23121.Model;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ConcurrentModificationException;


public class UserModel {

    @NotNull(message = "Email không được bỏ trống")
    @Pattern(regexp = "^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$",
            message = "Email không hợp lệ")
    private String email;

    @NotNull(message = "Mật khẩu không được bỏ trống")
    @Size(min = 6, message = "Mật khẩu dài tối thiểu 6 ký tự")
    @NotBlank(message = "Mật khẩu không được bỏ trống")
    private String password;

    private String repeatPassword;

    @NotNull(message = "Họ tên không được bỏ trống")
    @NotBlank(message = "Họ tên không được bỏ trống")
    private String name;

    private String phoneNumber;

    private String address;

    @NotNull(message = "Hãy chọn một vai trò")
    private Integer roleId;

    public UserModel() {
    }

    public UserModel(String email, String password, String repeatPassword, String name, String phoneNumber, String address, Integer roleId) {
        this.email = email;
        this.password = password;
        this.repeatPassword = repeatPassword;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.roleId = roleId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRepeatPassword() {
        return repeatPassword;
    }

    public void setRepeatPassword(String repeatPassword) {
        this.repeatPassword = repeatPassword;
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

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}
