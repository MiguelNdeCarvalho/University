
/*
Author: MiguelNdeCarvalho
Date: 28/02/2019
In this program we are basically doing a converter from Fahrenheit to Celsius
*/

import java.util.Scanner;

public class Temp2C {

    public static void main (String[] args){
        double c ,f;

        System.out.print("Insert the desired temperature in Fahrenheit to convert to Celsius:");

        Scanner scanner = new Scanner(System.in);
        f = scanner.nextFloat();
        c = 5.0/9.0 * (f - 32);


        System.out.print("The themperature is: " + c + "ºC");


    }

}
