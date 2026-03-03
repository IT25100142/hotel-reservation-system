package com.example.hotelreservationdemo.utils;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {

    // IMPORTANT: Replace this path with the ABSOLUTE PATH to your "data" folder.
    // To find it: Right-click your "data" folder in IntelliJ -> "Copy Path/Reference" -> "Absolute Path"
    // Remember to use double backslashes (\\) if you are on Windows!
    private static final String BASE_PATH = "C:\\Users\\chamidu\\Desktop\\test project\\hotel-reservation-demo\\src\\main\\resources\\data\\";
    /**
     * CREATE: Appends a single line of data to the specified text file.
     * @param fileName The name of the file (e.g., "rooms.txt")
     * @param data The string of data to save (e.g., "101,Standard,150.00")
     */
    public static void appendToFile(String fileName, String data) {
        try (FileWriter fw = new FileWriter(BASE_PATH + fileName, true);
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {

            out.println(data);
            System.out.println("Successfully wrote to " + fileName);

        } catch (IOException e) {
            System.out.println("Error writing to file: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * READ: Reads all lines from the specified text file.
     * @param fileName The name of the file (e.g., "guests.txt")
     * @return A List of Strings, where each string is one line from the file.
     */
    public static List<String> readFromFile(String fileName) {
        List<String> lines = new ArrayList<>();
        File file = new File(BASE_PATH + fileName);

        // If the file doesn't exist yet, return an empty list to avoid crashes
        if (!file.exists()) {
            return lines;
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                lines.add(line);
            }
        } catch (IOException e) {
            System.out.println("Error reading from file: " + e.getMessage());
            e.printStackTrace();
        }
        return lines;
    }

    /**
     * UPDATE & DELETE: Overwrites the entire file with a new list of lines.
     * @param fileName The name of the file (e.g., "reservations.txt")
     * @param newLines The updated list of data lines to save.
     */
    public static void overwriteFile(String fileName, List<String> newLines) {
        try (FileWriter fw = new FileWriter(BASE_PATH + fileName, false); // 'false' means overwrite mode
             BufferedWriter bw = new BufferedWriter(fw);
             PrintWriter out = new PrintWriter(bw)) {

            for (String line : newLines) {
                out.println(line);
            }
            System.out.println("Successfully updated " + fileName);

        } catch (IOException e) {
            System.out.println("Error overwriting file: " + e.getMessage());
            e.printStackTrace();
        }
    }
}