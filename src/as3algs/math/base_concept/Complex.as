package as3algs.math.base_concept 
{
	/**
	 * ...
	 * @author Shirobok Pavel aka ramshteks
	 */
	public class Complex 
	{
		public static function fromExp(d:Number):Complex {
			return new Complex(Math.cos(d), Math.sin(d));
		}
		
		private var _r:Number;
		private var _im:Number;
		
		public function Complex(r:Number = 0, im:Number = 0) 
		{
			_r = r;
			_im = im;
		}
		
		public function append(c:Complex, createNew:Boolean = false):Complex {
			var target_c:Complex = getTarget(createNew);
			target_c.r = target_c.r + c.r;
			target_c.im = target_c.im + c.im;
			return target_c;
		}
		
		public function appendNumber(d:Number, createNew:Boolean = false):Complex {
			var target_c:Complex = getTarget(createNew);
			target_c.r += d;
			return target_c;
		}
		
		public function subtract(c:Complex, createNew:Boolean = false):Complex {
			var target_c:Complex = getTarget(createNew);
			target_c.r -= c.r;
			target_c.im -= c.im;
			return target_c;
		}
		
		public function subtractNumber(d:Number, createNew:Boolean = false):Complex {
			var target_c:Complex = getTarget(createNew);
			target_c.r -= d;
			return target_c;
		}
		
		public function multiply(c:Complex, createNew:Boolean = false):Complex {
			var target_c:Complex = getTarget(createNew);
			
			var nr:Number = target_c.r * c.r - target_c.im * c.im;
			var nim:Number = target_c.im * c.r + target_c.r * c.im;
			
			target_c.r = nr;
			target_c.im = nim;
			
			return target_c;
		}
		
		public function multiplyNumber(d:Number, createNew:Boolean = false):Complex {
			var target_c:Complex = getTarget(createNew);
			
			target_c.r = target_c.r * d;;
			target_c.im = target_c.im * d;
			
			return target_c;
		}
		
		public function divide(c:Complex, createNew:Boolean = false):Complex {
			var target_c:Complex = getTarget(createNew);
			
			if (c.r == 0 && c.im == 0) throw new ArgumentError("Divide by zero-complex");
			
			var z:Number = Math.pow(c.r, 2) + Math.pow(c.im, 2);
			
			var nr:Number = (target_c.r * c.r + target_c.im * c.im) / z;
			var nim:Number = (c.r * target_c.im + target_c.r * c.im) / z;
			
			target_c.r = nr;
			target_c.im = nim;
			
			return target_c;
		}
		
		public function divideByNumber(d:Number, createNew:Boolean = false):Complex {
			var target_c:Complex = getTarget(createNew);
			
			var z:Number = Math.pow(d, 2);
			
			var nr:Number = (target_c.r * d) / z;
			var nim:Number = (target_c.im * d) / z;
			
			target_c.r = nr;
			target_c.im = nim;
			
			return target_c;
		}
		
		public function toString():String 
		{
			return "(" + r + ", " + im + ")";
		}
		
		private function getTarget(createNew:Boolean):Complex {
			if (createNew) return clone();
			return this;
		}
		
		public function clone():Complex {
			return new Complex(_r, _im)
		}
		
		public function get r():Number 
		{
			return _r;
		}
		
		public function get im():Number 
		{
			return _im;
		}
		
		public function set r(value:Number):void 
		{
			_r = value;
		}
		
		public function set im(value:Number):void 
		{
			_im = value;
		}
	}

}