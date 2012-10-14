package as3algs.math.base_concept 
{
	import as3algs.math.MathUtils;
	/**
	 * ...
	 * @author Shirobok Pavel aka ramshteks
	 */
	public class CosWave extends AbstractWave
	{
		
		public function CosWave(freq:Number = 1, ampl:Number = 1, phase:Number = 0) 
		{
			init(freq, ampl, phase);
		}
		
		override public function getValue(time:Number):Number 
		{
			return _amplitude * Math.cos(time * MathUtils.DOUBLE_PI * _frequency + _phase);
		}
		
	}

}