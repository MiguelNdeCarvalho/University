/*
There are 25 primes between 2 and 100, and there are 1229 primes between
2 and 10,000. Write a program that inputs a positive integer N  2 and
displays the number of primes between 2 and N (inclusive). Use the timing
technique explained in Section 6.9 to show the amount of time it took to
compute the result. */


import java.util.*;

public class Primeinf{

    public boolean Result (int n){
        for (int i = n - 1; i >= 2; i--){
            if (n % i == 0)
                return false;
        }
        return true;
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int count = 0;

        System.out.println("Insert the maximum (int)");
        int max = input.nextInt();

        for (int i = 2; i < max; i++) {
            
            Primo primadas = new Primo();

            if ( primadas.Result (i) == true){
                 count += 1;
            }
                
        }
        System.out.println("Between 2-" + max + " there are " + count + " prime(s).");
    }
}
