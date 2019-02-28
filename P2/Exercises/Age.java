
/*
Author: MiguelNdeCarvalho
Date: 28/02/2019
Write a program that inputs the year a person is born and outputs the age of
the person in the following format:
You were born in 1990 and will be (are) 18 this year.
*/

import java.util.Scanner;

public class Age {

    public static void main (String[] args){

        int year_c, year_b , age;
        year_c = 2019;

        System.out.print("Insert the year when you had born:");

        Scanner scanner = new Scanner(System.in);
        year_b = scanner.nextInt();

        age = year_c - year_b;

        System.out.print("You were born in " + year_b + " and will be (are) " + age + " this year");




    }


}
