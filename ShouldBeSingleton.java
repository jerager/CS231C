
public class ShouldBeSingleton {

	private int tag;
	
	public ShouldBeSingleton() {
		this(7);
	}
	
	public ShouldBeSingleton(int i) {
		tag = i;
	}
	
	public String toString() {
		return super.toString()+" tag "+tag;
	}
	public static void main(String[] args) {
		

		ShouldBeSingleton a = new ShouldBeSingleton();
		
		ShouldBeSingleton b = new ShouldBeSingleton();
		
		ShouldBeSingleton c = new ShouldBeSingleton(1);

		System.out.println(a);
		System.out.println(b);
		System.out.println(c);

		
		System.out.println((a==b)+"  "+(b==c));
	}

}
