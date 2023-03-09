// Wu Jiahao
// wu231
// Lab 2
import java.awt.Font;
import javax.swing.JComponent;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.Polygon;

public class Picture extends JComponent {
    int width, height;
    public Picture(int width, int height) {
        this.width = width;
        this.height = height;
    }
    public void paintComponent(Graphics g){
        g.setColor(Color.WHITE);
        g.fillRect(0,0,500,500);
        g.setColor(Color.RED);
        g.fillRect(5, 10,450, 350);

        g.setColor(Color.YELLOW);
        g.fillPolygon( new Polygon
                ( new int[] {42,52,72,52,60,40,15,28,9,32,42 },
                        new int[] {38,62,68,80,105,85,102,75,58,60,38 },
                        11));
        g.setColor(Color.YELLOW);
        g.fillPolygon( new Polygon
                ( new int[] {42,52,72,52,60,40,15,28,9,32,42},
                        new int[] {138,162,168,180,205,185,202,175,158,160,138  },
                        11));
        g.setColor(Color.YELLOW);
        g.fillPolygon( new Polygon
                ( new int[] {102,112,132,112,120,100,75,88,69,92,102},
                        new int[] {118,142,148,160,185,165,182,155,138,140,118  },
                        11));
        g.setColor(Color.YELLOW);
        g.fillPolygon( new Polygon
                ( new int[] {112,122,142,122,130,110,85,98,79,102,112},
                        new int[] {63,87,93,105,130,110,127,100,83,85,63  },
                        11));
        g.setColor(Color.YELLOW);
        g.fillPolygon( new Polygon
                ( new int[] {112,122,142,122,130,110,85,98,79,102,112},
                        new int[] {13,37,43,55,80,60,77,50,33,35,13  },
                        11));
        g.setFont(new Font("TimesRoman", Font.PLAIN, 55));
        g.drawString("CHINA", 240, 320);
    }
}