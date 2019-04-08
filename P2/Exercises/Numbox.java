/* This code is not good because it works only for printing 10 through 49. Try
to develop the code so that it can be extended easily to handle any range of
values. You can do this coding in two ways: with a nested for statement or
with modulo arithmetic. (If you divide a number by 10 and the remainder is
9, then the number is 9, 19, 29, or 39, and so forth.) */

import java.util.*;

public class Numbox{
    public static void main(String[] args) {
        
        Scanner input = new Scanner(System.in);

        System.out.println("Insert the minimum");
        int min = input.nextInt();

        System.out.println("Insert the maximum");
        int max = input.nextInt();
        

        for (int i = min; i < max+1; i++) {
            if (i % 10 == 9) {
                System.out.println(" " + i); 
            }
            else{
                System.out.print(" " + i);            
            }
        }
    }
}
