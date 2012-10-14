package as3algs.math.base_concept 
{
	/**
	 * ...
	 * @author Shirobok Pavel aka ramshteks
	 */
	internal class AbstractWave implements IWave 
	{
		protected var _phase:Number;
		protected var _amplitude:Number;
		protected var _frequency:Number;
		
		protected function init(freq:Number, ampl:Number, phase:Number):void {
			_phase = phase;
			_frequency = freq;
			_amplitude = ampl;
		}
		
		public function get phase():Number 
		{
			return _phase;
		}
		
		public function set phase(value:Number):void 
		{
			_phase = value;
		}
		
		public function get amplitude():Number 
		{
			return _amplitude;
		}
		
		public function set amplitude(value:Number):void 
		{
			_amplitude = value;
		}
		
		public function get frequency():Number 
		{
			return _frequency;
		}
		
		public function set frequency(value:Number):void 
		{
			_frequency = value;
		}
		
		public function getValue(time:Number):Number 
		{
			throw new Error("No Implementation");
		}
		
	}

}