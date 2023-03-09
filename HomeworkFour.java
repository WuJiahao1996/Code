public class HomeworkFour {
    public static void main(String[]args){
        int n = Integer.parseInt(args[0]);
        System.out.println("1 + 2 + ... + " + n + " = " + HomeworkFour.sum(n) +
                " = " + n + " * (" + n + " + 1) / 2 ");
    }
    public static int sum(int n){
        return sumofOne(n,0,0);
    }
    public static int sumofOne(int n,int start,int end){
        System.out.println("At index " + start + " sum becomes " + end +
                " + " + start + " that is " + (end+start));
        if (n == start)
            return end + start;
        else
            return sumofOne(n, start +1, end + start);
    }
}
