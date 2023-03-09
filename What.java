
public class What {
        int value;
        What next;
        public What(int value, What next) {
            this.value = value;
            this.next = next;
        }
        public String toString() {
            return this.value + (this.next == null ? " " : " " + this.next);
        }
        public static What zoom(What a, What b) {
            if (b == null) return b;
            else if (b.next == null) {
                b.next = a;
                return b;
            } else {
                What temp = b.next;
                b.next = a;
                return zoom(b, temp);
            }
        }
        public static void main(String[] args) {
            What what = new What(5, new What(4, new What(3, new What(2, new What(1, null)))));
            System.out.println(what); // draw what at this point [1]
            what = What.zoom(null, what); // trace the effect of zoom [2]
            System.out.println( what ); // result of [2] should match drawing of what here [3]
        }
    }
