import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.CodeSignature;

aspect GetInfo6 {
   
   before(): execution(* upCount(..)) {
       System.out.println("Calling upCount ");
   }
   
    before(Demo1 d) : execution(* foo(..)) && target(d) {
	d.upCount();
    }


}
