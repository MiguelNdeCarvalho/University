import javax.swing.JFrame;

/*
Basically in this little program we create a window with a resolution of 800x600 
*/

public class Welcome
{
    public static void main(String[] args)
    {
        JFrame frame = new JFrame();

        frame.setSize(800,600);
        frame.setTitle("Mind Bending Drugs!");
        frame.setVisible(true);
    }
}
