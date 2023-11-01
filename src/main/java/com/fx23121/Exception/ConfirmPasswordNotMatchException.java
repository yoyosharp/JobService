package com.fx23121.Exception;

public class ConfirmPasswordNotMatchException extends Exception{
    @Override
    public String getMessage() {
        return "Xác nhận mật khẩu không khớp";
    }
}
