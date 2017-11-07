import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.CodeSignature;

aspect GetInfo5 {
   
    public int Demo1.count2 = 0;

    public void Demo1.upCount() {
    	this.count++;
    }

   
}
