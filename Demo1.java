public class Demo1 extends DemoDummy {
    static Demo1 d;

    public static void main(String[] args){
        new Demo1().go();
    }

    void go(){
        System.out.println(foo(100));
	System.out.println("In main,printing count "+count);
        //System.out.println(foo(49));
	//System.out.println("In main,printing count "+count);
    }

    int foo(int number){

	upCount();
	
	int with32;
	int with10;
	int with1;
	int minimum = -1;
	
	if (number == 0) return 0;

	if (number >=32) {
	    with32 = 1 + foo(number - 32);
	    minimum = with32;
	}
	if (number >=10) {
	    with10 = 1 + foo(number - 10);
	    if (minimum == -1) minimum = with10;
	    else if (minimum > with10) minimum = with10;
	}
	with1 = 1 + foo(number - 1);
	if (minimum == -1) minimum = with1;
	else if (minimum > with1) minimum = with1;

	return minimum;

    }

}
