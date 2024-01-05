package com.fx23121.DTO;

import java.util.List;

public class SearchData<T> {
    private int totalResultCount;

    private List<T> resultList;

    public SearchData(int totalResultCount, List<T> resultList) {
        this.totalResultCount = totalResultCount;
        this.resultList = resultList;
    }

    public int getTotalResultCount() {
        return totalResultCount;
    }

    public List<T> getResultList() {
        return resultList;
    }
}
