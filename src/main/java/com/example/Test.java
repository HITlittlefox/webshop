package com.example;

import java.util.ArrayList;

/**
 * @author fudon
 * @version 1.0
 * @date 2021-10-02 0:05
 */
public class Test {

    public static void main(String[] args) {
        ArrayList<Integer> integers = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            integers.add(i);
        }
        System.out.println(integers.toString());
    }
}

