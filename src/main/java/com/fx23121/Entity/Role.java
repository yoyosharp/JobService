package com.fx23121.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role {
    //define fields
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "role_name")
    private String roleName;

    //define constructors
    public Role() {
    }
    public Role(int id, String roleName) {
        this.id = id;
        this.roleName = roleName;
    }

    //define getters/setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    //define toString()

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", roleName='" + roleName + '\'' +
                '}';
    }
}
