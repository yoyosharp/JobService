package com.fx23121.Repository;

import java.util.List;

public interface RecordRepository<T> {
    T getRecord(int id);

    List<T> getRecords();
}
