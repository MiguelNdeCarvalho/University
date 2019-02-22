import java.util.*;

/*
Basically in this little program we ask the user for first, middle and last name. And then we do the output
*/

public class Name{
    public static void main(String[]args){
        String first, middle, last;

        Scanner scanner = new Scanner(System.in);
        //scanner.useDelimiter (System.getProperty("line.separator"));
        System.out.print("Enter First Name:");
        first = scanner.next();
        System.out.print("Enter Middle Name:");
        middle = scanner.next();
        System.out.print("Enter Last Name:");
        last = scanner.next();
		/*
		System.out.print(first +  " ");
		System.out.print(middle.charAt(0) + ". ");
		System.out.println(last);
		*/
        System.out.println(first +  " " + middle.charAt(0) + ". " + last);


    }

}
