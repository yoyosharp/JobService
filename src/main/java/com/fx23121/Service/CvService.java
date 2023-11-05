package com.fx23121.Service;

import com.fx23121.Entity.Cv;
import com.fx23121.Entity.User;

import java.util.List;

public interface CvService {
    Cv getCv(int CvId);

    void addCv(Cv cv);


}
