
/*
Author: MiguelNdeCarvalho
Date: 28/02/2019
In this program we are basically doing a converter from Celsius to Fahrenheit
*/

import java.util.Scanner;

public class Temp2F {

    public static void main (String[] args){
        double c ,f;

        System.out.print("Insert the desired temperature in Celsius to convert to Fahrenheit:");

        Scanner scanner = new Scanner(System.in);
        c = scanner.nextFloat();
        f = 1.8 * c + 32;


        System.out.print("The themperature is: " + f + "ºF");


    }

}
