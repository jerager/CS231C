import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.CodeSignature;

aspect GetInfo1 {
   
   before(int a): execution(* foo(..)) && args(a) {
       System.out.println("Calling the method with argument "+a);
   }
   


}
