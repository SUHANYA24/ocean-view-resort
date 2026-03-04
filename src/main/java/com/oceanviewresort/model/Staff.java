/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.model;

/**
 *
 * @author hansa
 */
public class Staff extends User{
    protected String empId;
    
    public Staff(){}

    public Staff(int id, String email, String password,
                 String role, String empId) {

        super(id, email, password, role);
        this.empId = empId;
    }


    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }
}
