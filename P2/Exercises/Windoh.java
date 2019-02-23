import javax.swing.JFrame;
import java.util.Scanner;

/*
Basically in this program we are asking the user for a Widh , a High and a Title for a window
*/

public class Windoh {
    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);
        String Title;

        System.out.print("Enter the Title:");
        Title = scanner.next();

        JFrame frame;
        frame = new JFrame(Title);
        int W,H;

        System.out.print("Enter the width");
        W = scanner.nextInt();
        System.out.print("Enter the high");
        H = scanner.nextInt();

        frame.setSize(W,H);
        frame.setTitle(Title);
        frame.setVisible(true);

        frame.setDefaultCloseOperation(frame.EXIT_ON_CLOSE);
    }
}
