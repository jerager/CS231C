import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.CodeSignature;

aspect GetInfo {
   
    before(): call(int compareTo(Object)) 
	{
	    System.out.println("before");
	}

    before(int a): execution(* m(..)) && args(a) {
	System.out.println("Calling the method with argument "+a);
    }
    
    before(): call(int m(..)) 
	{
	    System.out.println("before m");
	}
   
    int around(int k): call(int m(int)) &&args(k) {
	proceed(k+1);
	return proceed(k);	
//	    System.out.println("around m");
	//    return 17;
    }

    int around(Object d, Object a): call(int compareTo(..)) && target(d) 
	&& args(a){
	System.out.println("Intercepted message: " +
		thisJoinPointStaticPart.getSignature().getName());
	System.out.println("in class: " +
		thisJoinPointStaticPart.getSignature().getDeclaringType().getName());
	//int k =  
	//  printParameters(thisJoinPoint);
	//System.out.println("Result "+k);
	System.out.println("Running original method: \n" );
      
	int result = proceed(d,a);
	//System.out.println("  result: " + result);
	//int resultInt = ((Integer) result).intValue();
	if (result > 0) return 1;
	else if (result < 0) return -1;
	else return 0;
   }

    int around(): call(int compareTo(Object)) {

	System.out.println("Running original method: \n" );
      
	return 4;
   }

}



