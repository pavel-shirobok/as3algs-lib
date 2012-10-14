package as3algs.math 
{
	/**
	 * ...
	 * @author Shirobok Pavel aka ramshteks
	 */
	public class MathUtils 
	{
		static public const DOUBLE_PI:Number = Math.PI * 2;
		
		public static function isPowerOfTwo(d:Number):Boolean {
			return (d & (d - 1)) == 0;
		}
		
	}

}