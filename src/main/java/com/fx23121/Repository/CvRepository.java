package com.fx23121.Repository;

import com.fx23121.Entity.Cv;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface CvRepository {
    public Cv getCv(int cvId);

    public void addCv(Cv cv);

}
