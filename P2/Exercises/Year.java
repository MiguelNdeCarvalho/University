import java.util.Scanner;

public class Year{

    public static void main (String[] args){

        Scanner input = new Scanner(System.in);

        System.out.println("Insert a year");
        int year = input.nextInt();

        boolean x = (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);

        System.out.println(x);

    }

}
