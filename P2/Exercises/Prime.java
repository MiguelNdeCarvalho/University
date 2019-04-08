/* A prime number is an integer greater than 1 and divisible by only itself and
1. The first seven prime numbers are 2, 3, 5, 7, 11, 13, and 17. Write a
method that returns true if its parameter is a prime number. Using this
method, write a program that repeatedly asks the user for input and displays
Prime if the input is a prime number and Not Prime, otherwise. Stop the
repetition when the input is a negative number.  */

import java.util.*;

public class Prime{

    public boolean Result (int n){
        for (int i = n - 1; i >= 2; i--){
            if (n % i == 0)
                return false;
        }
        return true;
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        
        for (int i = 1; i > 0; i++) {
            
            int numb = input.nextInt();
            Prime primed = new Prime();

            if (numb < 0)
                break;
            else 
                System.out.println(primed.Result (numb));
                
        }
    }
}
