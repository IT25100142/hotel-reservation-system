package com.example.hotelreservationdemo.models;

// ABSTRACTION: Abstract parent class
public abstract class Employee {
    // ENCAPSULATION: Private variables
    private String employeeId;
    private String name;
    private String phone;
    private double baseSalary;

    public Employee(String employeeId, String name, String phone, double baseSalary) {
        this.employeeId = employeeId;
        this.name = name;
        this.phone = phone;
        this.baseSalary = baseSalary;
    }

    // POLYMORPHISM: Abstract methods to be overridden by children
    public abstract String getJobDescription();
    public abstract String toFileString();

    // Getters and Setters
    public String getEmployeeId() { return employeeId; }
    public void setEmployeeId(String employeeId) { this.employeeId = employeeId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public double getBaseSalary() { return baseSalary; }
    public void setBaseSalary(double baseSalary) { this.baseSalary = baseSalary; }
}