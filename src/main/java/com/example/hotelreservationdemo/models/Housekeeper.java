package com.example.hotelreservationdemo.models;

// INHERITANCE: Inherits from Employee
public class Housekeeper extends Employee {

    private int assignedFloor;

    public Housekeeper(String employeeId, String name, String phone, double baseSalary, int assignedFloor) {
        super(employeeId, name, phone, baseSalary);
        this.assignedFloor = assignedFloor;
    }

    // POLYMORPHISM: Custom implementation for Housekeepers
    @Override
    public String getJobDescription() {
        return "Maintains cleanliness and room standards on Floor " + assignedFloor + ".";
    }

    @Override
    public String toFileString() {
        // Format: ID,Name,Phone,Salary,Role,ExtraData
        return getEmployeeId() + "," + getName() + "," + getPhone() + "," +
                getBaseSalary() + ",Housekeeper," + assignedFloor;
    }
}