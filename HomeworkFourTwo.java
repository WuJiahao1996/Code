public class HomeworkFourTwo {
    public static void main(String[]args){
        int n = Integer.parseInt(args[0]);
        System.out.println("1^2 + 2^2 + ... + " + n + "^2"+ " = " + HomeworkFourTwo.sum(n) +
                " = " + n + " * (" + n + " + 1)" + "(" + 2*n + " + 1)" + "/ 6 ");
    }
    public static int sum(int n){
        return sumofTwo(n,0,0);
    }
    public static int sumofTwo(int n,int start,int end){
        System.out.println("At index " + start + " sum becomes " + end +
                " + " + start*start + " that is " + (end+start*start));
        if (n == start)
            return end + start*start;
        else
            return sumofTwo(n, start + 1, end+start*start);
    }
}
