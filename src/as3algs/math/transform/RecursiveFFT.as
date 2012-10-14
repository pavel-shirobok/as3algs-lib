package as3algs.math.transform 
{
	import as3algs.math.base_concept.Complex;
	import as3algs.math.MathUtils;
	/**
	 * ...
	 * @author Shirobok Pavel aka ramshteks
	 */
	public class RecursiveFFT implements IFourier 
	{
		
		public function RecursiveFFT() {}
		
		public function direct(selection:Vector.<Complex>):Vector.<Complex> 
		{
			return transform(selection, false);
		}
		
		public function reverse(selection:Vector.<Complex>):Vector.<Complex> 
		{
			return transform(selection, true);
		}
		
		private function transform(selection:Vector.<Complex>, reverse:Boolean):Vector.<Complex> {
			var n:int = selection.length;
			
			if (!MathUtils.isPowerOfTwo(n)) throw new ArgumentError("Length of incoming selection must be power of two");

			if (n == 1)
			{
				return selection;
			}
			
			var w:Complex = new Complex(1, 0);
			var wn:Complex = Complex.fromExp(((2 * Math.PI) / Number(n)) * (reverse ? -1 : 1));
			
			var half_length:int = n / 2;

			var a0:Vector.<Complex> = new Vector.<Complex>();
			a0.length = half_length;//new Complex[half_length];
			var a1:Vector.<Complex> = new Vector.<Complex>();
			a1.length = half_length;

			var last0_index:int = 0;
			var last1_index:int = 0;
			
			var i:int;
			
			for (i = 0; i < n; i++)
			{
				if ((i & 1) == 1)
				{
					a1[last1_index] = selection[i].clone();
					last1_index++;
				}
				else
				{
					a0[last0_index] = selection[i].clone();
					last0_index++;
				}
			}

			var y0:Vector.<Complex> = transform(a0, reverse);
			var y1:Vector.<Complex> = transform(a1, reverse);

			var y:Vector.<Complex> = new Vector.<Complex>()
			y.length = n;

			for (i = 0; i < n; i++)
			{
				y[i] = new Complex(1, 0);
			}

			var y0k:Complex;
			var y1k:Complex;
			var w0k:Complex;
			
			for (var k:int = 0; k < half_length; k++)
			{
				y0k = y0[k];
				y1k = y1[k];

				w0k = w.multiply(y1k, true);
				y[k] = y0k.append(w0k, true);
				y[k + n / 2] = y0k.subtract(w0k, true);
				if (reverse) {
					y[k].divideByNumber(2);
					y[k + n / 2].divideByNumber(2);// /= 2;
				}
				w.multiply(wn);
			}

			return y;
		}
		
	}

}