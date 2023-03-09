import javax.swing.JComponent;
import javax.swing.JFrame;
import java.awt.Graphics;

public class Flags extends JComponent{
    public static void main(String[]args){
        JFrame frame = new JFrame();
        frame.setVisible(true);
        int width = 500, height = 500;
        frame.setSize(width + 20, height + 40);
        Flags drawing = new Flags(width,height);
        frame.add(drawing);
    }
    int width,height;
    Flag a,b,c;
    public Flags(int width, int height){
        this.width = width;
        this.height = height;
        a = new Flag(20,50,0.3);
        b = new Flag( 220, 20, 0.5);
        c = new Flag(40, 230, 0.4);
    }
    public void paintComponent(Graphics g){
        a.draw(g);
        b.draw(g);
        c.draw(g);
    }
}
