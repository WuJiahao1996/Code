import java.util.Scanner;
public class DataSetTester {
    public static void main(String[]args){
        Scanner userInput = new Scanner(System.in);
        DataSet set = new DataSet();
        System.out.print("Enter data please: ");
        //Code that I tried before but not work
        //String[]nums = data.split("");
        //int len = nums.length;
        //double number;
        //for (int i=0;i<len;i++){
        while (true) {
        try{set.add(userInput.nextDouble());}
            catch(Exception E)
            {
                break;
            }
        }
        System.out.println("You have " + set.getCount()+" numbers");
        System.out.println("Average is "+ set.getAverage());
        System.out.println("Standard deviation is: " + set.getStandardDeviation());
    }
}
