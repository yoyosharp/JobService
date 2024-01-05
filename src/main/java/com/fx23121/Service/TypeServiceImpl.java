package com.fx23121.Service;

import com.fx23121.Entity.Type;
import com.fx23121.Repository.RecordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    private RecordRepository<Type> typeRecordRepository;

    @Override
    @Transactional
    public Type getType(int typeId) {
        return typeRecordRepository.getRecord(typeId);
    }

    @Override
    @Transactional
    public List<Type> getTypes() {
        return typeRecordRepository.getRecords();
    }
}
