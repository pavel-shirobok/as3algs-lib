package as3algs.math.base_concept 
{
	
	/**
	 * ...
	 * @author Shirobok Pavel aka ramshteks
	 */
	public interface IWave 
	{
		function get phase():Number;
		function set phase(v:Number):void;
		
		function get amplitude():Number;
		function set amplitude(v:Number):void;
		
		function get frequency():Number;
		function set frequency(v:Number):void;
		
		function getValue(time:Number):Number;
	}
	
}