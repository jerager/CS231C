import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.CodeSignature;

/** Introduce counter, and trace entrance and exit */

aspect GetInfo2 {
   
    private int Demo.count = 0;

    before(Demo d, int a): target(d) && execution(* foo(..)) && args(a) {
	System.out.println("Calling with argument "+a);
	d.count++;
    }

    after(Demo d, int a) returning(int b): target(d) && execution(* foo(..)) && args(a) {
	System.out.println("Result with argument "+a+" is "+b);
    }
   
    after(Demo d): execution(* go()) && target(d) {
	System.out.println("Counter at end:" + d.count);
    }

}
