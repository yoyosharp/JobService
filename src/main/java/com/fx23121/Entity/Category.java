package com.fx23121.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category {

    //define fields
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "applied_number")
    private int appliedNumber;

    //define constructors
    public Category() {
    }

    public Category(int id, String name, int appliedNumber) {
        this.id = id;
        this.name = name;
        this.appliedNumber = appliedNumber;
    }

    //define getters/setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAppliedNumber() {
        return appliedNumber;
    }

    public void setAppliedNumber(int appliedNumber) {
        this.appliedNumber = appliedNumber;
    }

    //define toString()

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", appliedNumber=" + appliedNumber +
                '}';
    }
}
