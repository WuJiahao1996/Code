public class Student {
    String name;
    int count;
    double totalScore;
    double averScore;

    public Student(String name){
    this.name=name;
    }
    public String getName(){
    return this.name;
    }
    public void addQuiz(int score){
        count+=1;
        this.totalScore =this.totalScore + score;
    }
    public double getTotalScore(){
        return this.totalScore;
    }
    public double getAverScore(){
        return (double) this.totalScore/this.count;
    }
    public static void main(String[]args){
        Student a = new Student("Laura");
        a.addQuiz(90);
        a.addQuiz(94);
        System.out.println("Student name is " + a.getName() + " Score are " + a.getTotalScore() +
                " Average score are " + a.getAverScore());
    }
}

