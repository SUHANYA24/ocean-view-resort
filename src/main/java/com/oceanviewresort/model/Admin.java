/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.model;

/**
 *
 * @author hansa
 */
public class Admin extends Staff{
    private String adminRole;

    public Admin(String adminRole, int empId, int id, String email, String password) {
        super(empId, id, email, password);
        this.adminRole = adminRole;
    }

    public String getAdminRole() {
        return adminRole;
    }

    public void setAdminRole(String adminRole) {
        this.adminRole = adminRole;
    }

    
}
