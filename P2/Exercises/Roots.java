import java.util.Scanner;
import static java.lang.Math.*;

class Roots {

    public static void main(String[] args) {
        
        Scanner input = new Scanner(System.in);

        int a, b, c;
        double x1,x2, delta;

        System.out.print("Insira o valor de a:");
        a = input.nextInt(); 


        System.out.print("Insira o valor de b:");
        b = input.nextInt();


        System.out.print("Insira o valor de c:");
        c = input.nextInt();

        delta = Math.pow(b, 2) - 4 * a * c;

        if (delta < 0){

            System.out.println("A equacao nao tem raizes reais!");

        }

        else if (delta == 0){

            x1 = -b / (2 * a);
            System.out.println("A equacao tem uma unica solucao e e: " + x1);

        }

        else if (a == 0){

            System.out.println("A funcao nao e quadratica!");

        }


        else{

            x1 = (-b + Math.sqrt(delta)) / (2 * a);
            x2 = (-b - Math.sqrt(delta)) / (2 * a);

            System.out.println("A equacao tem 2 duas solucoes diferentes e sao x=" + x1 + " ou x=" + x2 + ".");

        }

    }

}
