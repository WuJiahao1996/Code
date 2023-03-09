import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
public class BSTTest extends JComponent implements MouseMotionListener,MouseListener{
    BST what;
    public static void main(String[]args){
        JFrame frame = new JFrame("Drawing a BST");
        BST what = new BST(1,new BST(2,new BST(3, new BST (4,null))));
        BSTTest board = new BSTTest(what);
        frame.add(board);
        frame.setSize(800,800);
        frame.setVisible(true);
    }
    BST selected;
    public void mouseMoved(MouseEvent e){}
    public void mouseDragged (MouseEvent e){
        if (this.selected == null) {
        }
        else{
            this.selected.moveTo(e.getX(),e.getY());
            this.repaint();
        }
    }
    public void mouseReleased (MouseEvent e){
        this.selected = null;
    }
    public void mousePressed(MouseEvent e){
        BST what = this.what;
        while (what != null){
            if (what.contains(e.getX(),e.getY())){
                this.selected = what;
                break;
            }
            else {
                what = what.next;
            }
        }
    }
    public void mouseEntered(MouseEvent e){}
    public void mouseExited(MouseEvent e){}
    public void mouseClicked(MouseEvent e){}
    BSTTest(BST what){
        this.what = what;
        this.addMouseMotionListener(this);
        this.addMouseListener(this);
    }
    public void paintComponent (Graphics g){
        what.draw(g);
    }
}
