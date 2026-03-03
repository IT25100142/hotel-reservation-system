package com.example.hotelreservationdemo.models;

// INHERITANCE: Inherits from Employee
public class Manager extends Employee {

    private String department; // e.g., HR, Front Desk, Operations

    public Manager(String employeeId, String name, String phone, double baseSalary, String department) {
        super(employeeId, name, phone, baseSalary);
        this.department = department;
    }

    // POLYMORPHISM: Custom implementation for Managers
    @Override
    public String getJobDescription() {
        return "Oversees the " + department + " department and manages staff operations.";
    }

    @Override
    public String toFileString() {
        // Format: ID,Name,Phone,Salary,Role,ExtraData
        return getEmployeeId() + "," + getName() + "," + getPhone() + "," +
                getBaseSalary() + ",Manager," + department;
    }
}