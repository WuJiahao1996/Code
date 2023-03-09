public class CounterTest {
    public static void main(String[]args){
        Counter a = new Counter();
        int result = a.getValue();
        System.out.println(result);//Expect answer 0

        a.click();
        a.click();
        result = a.getValue();
        System.out.println(result);//Expect answer 2

        a.reset();
        result = a.getValue();
        System.out.println(result);//Expect answer 0
    }
}
