import java.awt.*;
public class BST {
    int x, y;
    public void moveTo(int x, int y){
        this.x=x;
        this.y=y;
    }
    int value;
    BST next;
    BST (int value, BST next){
        this.value = value;
        this.next = next;
        this.x = (int)(Math.random()*400 + 50);
        this.y = (int)(Math.random()*400 + 50);
    }
    public boolean contains(int x, int y){
        return Math.sqrt(Math.pow(this.x - x,2) + Math.pow(this.y - y, 2)) <=20;
    }
    public void draw(Graphics g){
        Graphics2D g2 = (Graphics2D) g;
        float thickness = 6;
        Stroke oldStroke = g2.getStroke();
        g2.setStroke(new BasicStroke(thickness));
        Font myFont = new Font("Arial", Font.BOLD, 40);
        g2.setFont(myFont);
        if (this.next == null){

        }
        else {
            g2.drawLine(this.x,this.y,this.next.x, this.next.y);
            this.next.draw(g);
        }
        g2.setColor(Color.CYAN);
        g2.fillOval(this.x-30,this.y-30,60,60);
        g2.setColor(Color.BLACK);
        g2.drawOval(this.x-30,this.y-30,60,60);
        g2.drawString(this.value + "", this.x-10,this.y+10);

    }
}
