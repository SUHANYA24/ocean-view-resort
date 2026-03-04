/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.model;

public class Admin extends Staff {

    private String adminRole;

    public Admin() {}

    public Admin(int id, String email, String password,
                 String role, String empId, String adminRole) {

        super(id, email, password, role, empId);
        this.adminRole = adminRole;
    }

    public String getAdminRole() { return adminRole; }
    public void setAdminRole(String adminRole) {
        this.adminRole = adminRole;
    }
}
