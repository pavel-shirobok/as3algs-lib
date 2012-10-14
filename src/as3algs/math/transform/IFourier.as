package as3algs.math.transform 
{
	import as3algs.math.base_concept.Complex;
	
	/**
	 * ...
	 * @author Shirobok Pavel aka ramshteks
	 */
	public interface IFourier 
	{
		function direct(selection:Vector.<Complex>):Vector.<Complex>;
		function reverse(selection:Vector.<Complex>):Vector.<Complex>;
	}
	
}