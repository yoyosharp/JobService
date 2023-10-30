package com.fx23121.Entity;

import javax.persistence.*;

@Entity
@Table(name = "cv")
public class Cv {

    //define fields
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "file_name")
    private String fileName;

    @ManyToOne(fetch = FetchType.LAZY,
            cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name = "user_id")
    private User user;

    //define constructors

    public Cv() {
    }

    public Cv(String fileName, User user) {
        this.fileName = fileName;
        this.user = user;
    }

    //define getters/setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    //define toString()

    @Override
    public String toString() {
        return "Cv{" +
                "id=" + id +
                ", fileName='" + fileName + '\'' +
                ", user=" + user.getId() +
                '}';
    }
}
