import java.awt.Graphics;
import java.awt.Color;
import java.awt.Polygon;
import java.awt.Font;

public class Flag {
    int x,y;
    double scale;
    public Flag(int x,int y,double scale){
        this.x=x;
        this.y=y;
        this.scale=scale;
    }
    private int scale(int size){
        return(int)(this.scale*size);
    }
    public void draw (Graphics g){
        g.setColor(Color.WHITE);
        g.fillRect(x + 0,y + 0,scale(500),scale(500));
        g.setColor(Color.RED);
        g.fillRect(x + 5, y+10,scale(450),scale( 350));

        g.setColor(Color.YELLOW);
        g.fillPolygon( new Polygon
                ( new int[] {x+scale(42),x+scale(52),x+scale(72),x+scale(52),
                             x+scale(60),x+scale(40),x+scale(15),x+scale(28),
                             x+scale(9), x+scale(32),x+scale(42) },
                        new int[] {y+scale(38),y+scale(62),y+scale(68),y+scale(80),
                                y+scale(105),y+scale(85),y+scale(102),y+scale(75),
                                y+scale(58),y+scale(60),y+scale(38) },
                        11));
        g.setColor(Color.YELLOW);
        g.fillPolygon( new Polygon
                ( new int[] {x+scale(42),x+scale(52),x+scale(72),x+scale(52),
                        x+scale(60),x+scale(40),x+scale(15),x+scale(28),
                        x+scale(9),x+scale(32),x+scale(42)},
                        new int[] {y+scale(138),y+scale(162),y+scale(168),y+scale(180),
                                y+scale(205),y+scale(185),y+scale(202),y+scale(175),
                                y+scale(158),y+scale(160),y+scale(138) },
                        11));
        g.setColor(Color.YELLOW);
        g.fillPolygon( new Polygon
                ( new int[] {x+scale(102),x+scale(112),x+scale(132),x+scale(112),
                        x+scale(120),x+scale(100),x+scale(75),x+scale(88),
                        x+scale(69),x+scale(92),x+scale(102)},
                        new int[] {y+scale(118),y+scale(142),y+scale(148),y+scale(160),
                                y+scale(185),y+scale(165),y+scale(182),y+scale(155),
                                y+scale(138),y+scale(140),y+scale(118)},
                        11));
        g.setColor(Color.YELLOW);
        g.fillPolygon( new Polygon
                ( new int[] {x+scale(112),x+scale(122),x+scale(142),x+scale(122),
                        x+scale(130),x+scale(110),x+scale(85),x+scale(98),
                        x+scale(79),x+scale(102),x+scale(112)},
                        new int[] {y+scale(63),y+scale(87),y+scale(93),y+scale(105),
                                y+scale(130),y+scale(110),y+scale(127),y+scale(100),
                                y+scale(83),y+scale(85),y+scale(63)},
                        11));
        g.setColor(Color.YELLOW);
        g.fillPolygon( new Polygon
                ( new int[] {x+scale(112),x+scale(122),x+scale(142),x+scale(122),
                        x+scale(130),x+scale(110),x+scale(85),x+scale(98),
                        x+scale(79),x+scale(102),x+scale(112)},
                        new int[] {y+scale(13),y+scale(37),y+scale(43),y+scale(55),
                                y+scale(80),y+scale(60),y+scale(77),y+scale(50),
                                y+scale(33),y+scale(35),y+scale(13)},
                        11));
        g.setFont(new Font("TimesRoman", Font.PLAIN, scale(55)));
        g.drawString("CHINA", x+scale(240), y+scale(320));
    }
}
