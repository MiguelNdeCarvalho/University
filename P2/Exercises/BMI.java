
/*
Author: MiguelNdeCarvalho
Date: 28/02/2019
A quantity known as the body mass index (BMI) is used to calculate the risk
of weight-related health problems. BMI is computed by the formula
where w is weight in kilograms and h is height in centimeters. A BMI of
about 20 to 25 is considered “normal.” Write an application that accepts
weight and height (both integers) and outputs the BMI.
*/


import java.util.Scanner;

public class BMI {

    public static void main(String[] args){

       double height, weight, bmi;
       Scanner scanner = new Scanner(System.in);


       System.out.print("Insert your Height:");
       height = scanner.nextFloat();
       System.out.print("Insert your Weight:");
       weight = scanner.nextFloat();
       bmi = weight / Math.pow((height / 100.0),2);
       System.out.print("Your BMI is:" + bmi);




    }


}
