import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.CodeSignature;

aspect GetInfo4 {
	private int count = 0;
	private int[] Demo.args = new int[10000];
	private int[] Demo.results = new int[10000];
	private int Demo.resultCount = 0;

	private int Demo.search(int arg) {

		for (int k =0; k<resultCount; k++)
			if (args[k] == arg) return results[k];	
		return -1;
	}

	private void Demo.add(int arg, int result) {

		for (int k =0; k<resultCount; k++)
			if (args[k] == arg) return;

		args[resultCount] = arg;
		results[resultCount] = result;
		resultCount++;
	}

	static final void println(String s){ System.out.println(s); }

	pointcut others(): execution(void go()) ||
	execution(static * main(..));

	before(): others() {
		println("Intercepted message: " +
				thisJoinPointStaticPart.getSignature().getName());
		println("in class: " +
				thisJoinPointStaticPart.getSignature().getDeclaringType().getName());
		printParameters2(thisJoinPoint);
	}

	after(): execution(* go(..)) {
		println("count:"+count);
	}

	Object around(Demo d, int k1): execution(* foo(int)) &&args(k1) && target(d) {

		println("\nExecuting around advice ");
		count = count + 1;
		println("Intercepted message: " +
				thisJoinPointStaticPart.getSignature().getName());
		println("in class: " +
				thisJoinPointStaticPart.getSignature().getDeclaringType().getName());
		int k = printParameters(thisJoinPoint);

		if (d.search(k) != -1) {
			System.out.println("Used cached value");
			return new Integer(d.search(k));
		}

		println("Running original method: \n" );
		Object result = proceed(d,k1);
		int resultInt = ((Integer) result).intValue();
		d.add(k,resultInt);
		return result;
	}


	static private int printParameters(JoinPoint jp) {
		println("Arguments: " );
		Object[] args = jp.getArgs();
		String[] names = ((CodeSignature)jp.getSignature()).getParameterNames();
		Class[] types = ((CodeSignature)jp.getSignature()).getParameterTypes();

		for (int i = 0; i < args.length; i++) {
			println("  "  + i + ". " + names[i] +
					" : " +            types[i].getName() +
					" = " +            args[i]);
		}
		return ((Integer) args[0]).intValue();
	}


 static private void printParameters2(JoinPoint jp) {
      println("Arguments: " );
      Object[] args = jp.getArgs();
      String[] names = ((CodeSignature)jp.getSignature()).getParameterNames();
      Class[] types = ((CodeSignature)jp.getSignature()).getParameterTypes();
      if (args.length == 0)
          System.out.println("No Arguments");
      for (int i = 0; i < args.length; i++) {
         println("  "  + i + ". " + names[i] +
             " : " +            types[i].getName() +
             " = " +            args[i]);
      }
   }
}