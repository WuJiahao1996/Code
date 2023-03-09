public class DataSet {
    private double sum;
    private double sumOfSquares;
    private int count;
    //private ArrayList<Double> userArray;

    //Constructor
    public DataSet()
    {
        sum = 0.0;
        sumOfSquares = 0.0;
        count = 0;
        //userArray = new ArrayList<>();
    }
    //add value to data set
    public void add(double value){
        sum += value;
        sumOfSquares += Math.pow(value,2);
        count ++;
        //userArray.add(value);
    }
    public double getAverage(){
        return sum/(double)count;
    }
    public double getStandardDeviation(){
        return Math.sqrt((sumOfSquares-(1/count)*sumOfSquares)/(count-1));
    }
    public int getCount(){
        return count;
    }
}
