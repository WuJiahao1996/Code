public class Car {
    private int efficiency;
    private double fuel;
    public Car(int efficiency){
        this.efficiency=efficiency;
    }
    public void drive(double miles){
        double neededGas = miles;
        if(this.fuel >= neededGas){
            this.fuel -= neededGas;
        }
    }
    public double getGasInTank(){
        return this.fuel;
    }
    public void addGas(double gallons){
        this.fuel+=gallons;
    }
    public static void main(String[]args){
        Car a = new Car(50);
        System.out.println(a);
        System.out.println(a.getGasInTank());
        System.out.println(a.efficiency);
        a.drive(100);
        System.out.println(a.getGasInTank());
        System.out.println(a.efficiency);
        a.addGas(3.2);
        System.out.println(a.getGasInTank());
        System.out.println(a.efficiency);
    }
}
