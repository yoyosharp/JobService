package com.fx23121.Exception;

public class EmailAlreadyExistedException extends Exception{
    @Override
    public String getMessage() {
        return "Email đã tồn tại trên hệ thống";
    }
}
