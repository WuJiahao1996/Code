public class HomeworkFourThree {
    public static void main(String[]args){
        int n = Integer.parseInt(args[0]);
        System.out.println("1^3 + 2^3 + ... + " + n + "^3"+ " = " + HomeworkFourThree.sum(n) +
                " = " + n + "^2 *" + " (" + n + " + 1)^2" + " / 4 ");
        //cube can also be expressed by n^2 * (n+1)^2 / 4
    }
    public static int sum(int n){
        return sumofTwo(n,0,0);
    }
    public static int sumofTwo(int n,int start,int end){
        System.out.println("At index " + start + " sum becomes " + end +
                " + " + start*start*start + " that is " + (end+start*start*start));
        if (n == start)
            return end + start*start*start;
        else
            return sumofTwo(n, start + 1, end+start*start*start);
    }
}
