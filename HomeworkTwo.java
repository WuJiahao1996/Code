public class HomeworkTwo {
    public static void main(String[]args){
        String time1, time2;
        time1 = args[0];
        time2 = args[1];
        System.out.println("The first time is "+ time1);
        System.out.println("The second time is "+ time2);
        int h1,h2,m1,m2;
        h1 = Integer.parseInt(time1.substring(0,2));
        m1 = Integer.parseInt(time1.substring(3));
        h2 = Integer.parseInt(time2.substring(0,2));
        m2 = Integer.parseInt(time2.substring(3));
        int t1 = h1*60 + m1;
        int t2 = h2*60 + m2;
        System.out.println("First time in minutes are " + t1);
        System.out.println("Second time in minutes are " + t2);

        int d = (t2-t1 + 24*60) % (24*60);
        System.out.println("Between " + time1 + " and " + time2 + " we have " +
                (d/60) + " hours and " + (d%60) + " minutes.");
    }
}
