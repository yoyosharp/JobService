package com.fx23121.Service;

import com.fx23121.Entity.Type;

import java.util.List;

public interface TypeService {
    Type getType(int typeId);

    List<Type> getTypes();
}
