import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.CodeSignature;

aspect GetInfo3 {
   
    public int Demo1.count = 0;

    public void Demo1.upCount() {
    	count++;
    }


    before(Demo1 d, int a): target(d) && execution(* foo(..)) && args(a) {
	System.out.println("Calling with argument "+a);
    }

    after(Demo1 d, int a) returning(int b): target(d) && execution(* foo(..)) && args(a) {
	System.out.println("Result with argument "+a+" is "+b);
    }
   
}
