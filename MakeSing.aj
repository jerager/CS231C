
public aspect MakeSing {
	
		call (ShouldBeSingleton.new(..))	
}

