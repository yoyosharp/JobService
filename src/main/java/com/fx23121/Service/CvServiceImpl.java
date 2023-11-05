package com.fx23121.Service;

import com.fx23121.Entity.Cv;
import com.fx23121.Entity.User;
import com.fx23121.Repository.CvRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CvServiceImpl implements CvService {

    @Autowired
    private CvRepository cvRepository;

    @Override
    @Transactional
    public Cv getCv(int cvId) {
        return cvRepository.getCv(cvId);
    }

    @Override
    @Transactional
    public void addCv(Cv cv) {
        cvRepository.addCv(cv);
    }

}
