import java.util.Random;
public class Paradox {
    public static void main(String[]args){
        int switchDoorWin = 0;
        int stayDoorWin = 0;
        Random plays = new Random();
        for (int i = 0; i < 1000; i++) {
            int[] doors = {0, 0, 0};// Car 1, Goat 0
            doors[plays.nextInt(3)] = 1; // Have a Car randomly
            int choice = plays.nextInt(3);
            int shown;
            do{
                shown = plays.nextInt(3);
                //don't show the winner or the choice
            }while(doors[shown] == 1 || shown == choice);

            stayDoorWin += doors[choice];
            switchDoorWin += doors[3 - choice - shown];
        }
        System.out.println("Switching door wins " + switchDoorWin + " times.");
        System.out.println("Staying door wins " + stayDoorWin + " times.");
        }
    }
